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
	public ModelAndView index() { 				//method to show the first page
		
		ModelAndView mv=new ModelAndView("index");
		return mv;
		}
	@RequestMapping("logOut")					//method to show the login page when users logout
	public ModelAndView logout() {
		
		ModelAndView mv=new ModelAndView("index");
		return mv;
		}
	@RequestMapping("Login")
	public ModelAndView log(HttpServletRequest request,HttpServletResponse response,LoginBO logbo) {
												//method to validate users
		logbo.setUsername(request.getParameter("username"));		//getting data from login page	
		logbo.setPassword(request.getParameter("password"));
		//System.out.println(logbo.getUsername());
		//System.out.println(logbo.getPassword());
		LoginBO user=ser.uservalidate(logbo);				// calling method in service class
		ModelAndView mv= new ModelAndView();
		if(user==null)										// checking login status
		{
			mv.setViewName("index");						// displaying login page if user data is wrong
		}
		else if(user.getUser().equals("trainer"))			//checking user to confirm as trainer
		{
			mv.setViewName("loginpage");					//displaying trainer page
		}
		else														//if it is student
		{
			List<BoClass> details=ser.studentDetails(user.getId());			//getting student daily scores to display
			List<BoClass> weekdetails=ser.studentDetailsWeek(user.getId());		////getting student Weekly scores to display
			mv.addObject("list", details);									// setting data as  attributes
			//System.out.println(details.get(0).getName());
			mv.addObject("listweek", weekdetails);					//setting data as an attribute 
			mv.setViewName("student");					//setting display page as student 
		}
		mv.addObject("userDetails", user);					//
		return mv;
		}
	@RequestMapping("week")					
	public ModelAndView weekView() {			//method to display week Score page to trainer
		
		ModelAndView mv=new ModelAndView("weekMark");
		return mv;
		}
	@RequestMapping("createListWeek")					//method to add name list to week Score table to print values
	public void createListWeek(HttpServletRequest request,HttpServletResponse response) {
		//System.out.println(request.getParameter("week"));
		//System.out.println(request.getParameter("batch"));
		ser.setListWeek(request.getParameter("week"),request.getParameter("batch"));		//caling method by passing batch and date
		}
	@RequestMapping("ListViewWeek")					//method to display list from database
	public ModelAndView ListViewWeek(HttpServletRequest request,HttpServletResponse response) {  		
		//System.out.println("in create list");
		week=request.getParameter("weekView");			//setting batch and date to variables
		batch=request.getParameter("batchView");
		//System.out.println(week);
		//System.out.println(batch);
		list=ser.ListViewWeek(week,batch);				//method to display details by passing  batch and date
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);					//setting data to request
		mv.addObject("week", week);				
		mv.setViewName("weekMark");					//setting next view
		return mv;
		}
	@RequestMapping("updateWeek")					//method to update students mark in weeks
	public ModelAndView updateMarkWeek(HttpServletRequest request,HttpServletResponse response,BoClass boclass) {
		boclass.setId(request.getParameter("idtxt"));					//setting data to objects
		boclass.setBatch(request.getParameter("batchtxt"));
		boclass.setProjectWeek(request.getParameter("projecttxt"));
		boclass.setInterview(request.getParameter("interviewtxt"));
		boclass.setOverall(request.getParameter("overalltxt"));
		boclass.setViva(request.getParameter("interviewtxt"));
		boclass.setCoding(request.getParameter("overalltxt"));
		ser.markupdateWeek(boclass,week);							//method to update data
		list=ser.ListViewWeek(week,batch);		
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);							//sending data to jsp
		//System.out.println(list.size());
		mv.addObject("week", week);
		mv.setViewName("weekMark");							//setting next display page
		return mv;
	
		}
}
