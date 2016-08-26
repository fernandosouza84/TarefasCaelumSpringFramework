package br.com.caelum.tarefas.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefasController {
	
	private final JdbcTarefaDao dao;
	
	@Autowired
	public TarefasController(JdbcTarefaDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("novaTarefa")
	public String form(){
		return "tarefa/formulario";
	}

	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result){
		
		if(result.hasFieldErrors()){
			return "tarefa/formulario";
		}
		
		this.dao.adiciona(tarefa);
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("listaTarefas")
	public ModelAndView lista(){
		ModelAndView mav = new ModelAndView("tarefa/lista");
		mav.addObject("tarefas", this.dao.lista());
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("removeTarefa")
	public void remove(Tarefa tarefa){
		this.dao.remove(tarefa);
		System.out.println("Tarefa removida -> " + tarefa.getId());
	}
	
	@RequestMapping("mostraTarefa")
	public String mostra(Long id, Model model){
		model.addAttribute("tarefa", this.dao.buscaPorId(id));
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String altera(@Valid Tarefa tarefa){

		if(!tarefa.isFinalizado()){
			tarefa.setDataFinalizacao(null);
		}
		
		this.dao.altera(tarefa);
		return "redirect:listaTarefas";
	}

	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model){
		this.dao.finaliza(id);
		model.addAttribute("tarefa",this.dao.buscaPorId(id));
		System.out.println("Tarefa finalizada -> " + id);
		return "tarefa/finalizada";
	}
}
