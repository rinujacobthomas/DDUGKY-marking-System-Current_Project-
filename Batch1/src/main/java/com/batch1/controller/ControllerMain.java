package com.batch1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;
import com.batch1.service.ServiceInter;

@Controller
public class ControllerMain {
	String week,batch;
	List<BoClass> list;
	@Autowired
	ServiceInter ser;
	@RequestMapping("/")
	public ModelAndView index() {
		
		ModelAndView mv=new ModelAndView("index");
		return mv;
		}
	@RequestMapping("logOut")
	public ModelAndView logout() {
		
		ModelAndView mv=new ModelAndView("index");
		return mv;
		}
	@RequestMapping("Login")
	public ModelAndView log(HttpServletRequest request,HttpServletResponse response,LoginBO logbo) {
		logbo.setUsername(request.getParameter("username"));
		logbo.setPassword(request.getParameter("password"));
		System.out.println(logbo.getUsername());
		System.out.println(logbo.getPassword());
		LoginBO user=ser.uservalidate(logbo);
		ModelAndView mv= new ModelAndView();
		if(user==null)
		{
			mv.setViewName("index");
		}
		else if(user.getUser().equals("trainer"))
		{
			mv.setViewName("loginpage");
		}
		else
		{
			List<BoClass> details=ser.studentDetails(user.getId());
			List<BoClass> weekdetails=ser.studentDetailsWeek(user.getId());
			
			mv.addObject("list", details);
			System.out.println(details.get(0).getName());
			mv.addObject("listweek", weekdetails);
			mv.setViewName("student");
		}
		mv.addObject("userDetails", user);
		//ModelAndView mv=new ModelAndView("index");
		return mv;
		}
	@RequestMapping("week")
	public ModelAndView weekView() {
		
		ModelAndView mv=new ModelAndView("weekMark");
		return mv;
		}
	@RequestMapping("createListWeek")
	public ModelAndView createListWeek(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("in create list");
		ser.setListWeek(request.getParameter("week"),request.getParameter("batch"));
		ModelAndView mv=new ModelAndView();
		mv.setViewName("weekMark");
		return mv;
		}
	@RequestMapping("ListViewWeek")
	public ModelAndView ListViewWeek(HttpServletRequest request,HttpServletResponse response) {
		System.out.println("in create list");
		week=request.getParameter("weekView");
		batch=request.getParameter("batchView");
		list=ser.ListViewWeek(week,batch);
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);
		mv.addObject("week", week);
		mv.setViewName("weekMark");
		return mv;
		}
	@RequestMapping("updateWeek")
	public ModelAndView updateMarkWeek(HttpServletRequest request,HttpServletResponse response,BoClass boclass) {
		boclass.setId(request.getParameter("idtxt"));
		boclass.setBatch(request.getParameter("batchtxt"));
		boclass.setProjectWeek(request.getParameter("projecttxt"));
		boclass.setInterview(request.getParameter("interviewtxt"));
		boclass.setOverall(request.getParameter("overalltxt"));
		boclass.setViva(request.getParameter("interviewtxt"));
		boclass.setCoding(request.getParameter("overalltxt"));
		ser.markupdateWeek(boclass,week);
		list=ser.ListViewWeek(week,batch);
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);
		System.out.println(list.size());
		mv.addObject("week", week);
		mv.setViewName("weekMark");
		return mv;
	
		}
}
