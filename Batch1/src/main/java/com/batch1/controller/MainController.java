package com.batch1.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.service.ServiceInter;

@Controller
public class MainController {
	String datemain,batch;
	public static int dayAvailable;
	List<BoClass> list;
	@Autowired
	ServiceInter ser;

	/*
	 * @RequestMapping("/") public ModelAndView index() {
	 * 
	 * ModelAndView mv=new ModelAndView("loginpage"); return mv; }
	 */
	@RequestMapping("addUserb")
	public ModelAndView AddPage() {
		
		ModelAndView mv=new ModelAndView("addStudent");
		return mv;
		}
	@RequestMapping("dailyMark")
	public ModelAndView MarkPage() {
		
		ModelAndView mv=new ModelAndView("loginpage");
		return mv;
		}
	//@RequestMapping(value = "addUser", method =RequestMethod.POST)
	@RequestMapping("addUser")
	public void Add(HttpServletRequest request,HttpServletResponse response,AddUserbo addbo) {
		//addbo.setName(request.getParameter("name"));
		ser.addstudent(addbo);
		System.out.println(addbo.getBatch());
		System.out.println(addbo.getName());
		System.out.println(addbo.getId());
		}
	@RequestMapping("createList")
	public ModelAndView createList(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("in create list");
		ser.setList(request.getParameter("date"),request.getParameter("batch"));
		ModelAndView mv=new ModelAndView();
		mv.setViewName("loginpage");
		return mv;
		}
	@RequestMapping("ListView")
	public ModelAndView ListView(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("in create list");
		datemain=request.getParameter("dateView");
		batch=request.getParameter("batchView");
		list=ser.ListView(datemain,batch);
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);
		mv.addObject("date", datemain);
		mv.setViewName("loginpage");
		return mv;
		}
	@RequestMapping("update")
	public ModelAndView updateMark(HttpServletRequest request,HttpServletResponse response,BoClass boclass) {
		boclass.setId(request.getParameter("idtxt"));
		boclass.setBatch(request.getParameter("batchtxt"));
		boclass.setViva(request.getParameter("vivatxt"));
		boclass.setCoding(request.getParameter("codingtxt"));
		boclass.setProject(request.getParameter("projecttxt"));
		System.out.println(request.getParameter("vivatxt"));
		ser.markupdate(boclass,datemain);
		list=ser.ListView(datemain,batch);
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);
		System.out.println(list.size());
		mv.addObject("date", datemain);
		mv.setViewName("loginpage");
		return mv;
	
		}
}
