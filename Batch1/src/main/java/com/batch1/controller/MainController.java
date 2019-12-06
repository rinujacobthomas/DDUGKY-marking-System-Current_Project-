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
	//public static int dayAvailable;
	List<BoClass> list;  			//list to store data from database
	@Autowired
	ServiceInter ser;	//object of ServiceInter
	
	@RequestMapping("addUserb")			// method to add  Student
	public ModelAndView AddPage() {
		
		ModelAndView mv=new ModelAndView("addStudent");			// display Add student page 
		return mv;
		}
	@RequestMapping("dailyMark")							//method to display Admin page
	public ModelAndView MarkPage() {
		
		ModelAndView mv=new ModelAndView("loginpage");
		return mv;
		}
	@RequestMapping("addUser")		//method to add user
	public void Add(HttpServletRequest request,HttpServletResponse response,AddUserbo addbo) {
		ser.addstudent(addbo);// calling method to add Stuent
		/*
		 * System.out.println(addbo.getBatch()); System.out.println(addbo.getName());
		 * System.out.println(addbo.getId());
		 */
		}
	@RequestMapping("createList") 		//method to create a new list on a new date
	public ModelAndView createList(HttpServletRequest request,HttpServletResponse response) {
		//System.out.println("in create list");
		ser.setList(request.getParameter("date"),request.getParameter("batch"));
			//calling method to add list by sending batch and date for which list has to created
		ModelAndView mv=new ModelAndView();
		mv.setViewName("loginpage");	//returning to the same page
		return mv;
		}
	@RequestMapping("ListView")				//method to display mark of students on a specified date
	public ModelAndView ListView(HttpServletRequest request,HttpServletResponse response) {
		//System.out.println("in create list");
		datemain=request.getParameter("dateView");		//SETTING data
		batch=request.getParameter("batchView");
		list=ser.ListView(datemain,batch);		//calling method to list mark 
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);			//setting the data from to model amd view object
		mv.addObject("date", datemain);
		mv.setViewName("loginpage");			//return to same page
		return mv;
		}
	@RequestMapping("update")
	public ModelAndView updateMark(HttpServletRequest request,HttpServletResponse response,BoClass boclass) {
		boclass.setId(request.getParameter("idtxt"));			//setting data to BoClass objects
		boclass.setBatch(request.getParameter("batchtxt"));
		boclass.setViva(request.getParameter("vivatxt"));		//		""
		boclass.setCoding(request.getParameter("codingtxt"));
		boclass.setProject(request.getParameter("projecttxt"));
		System.out.println(request.getParameter("vivatxt"));
		ser.markupdate(boclass,datemain);	//method to update  Daily mark 
		list=ser.ListView(datemain,batch);		//method to display  updated data
		ModelAndView mv=new ModelAndView();
		mv.addObject("students", list);			//adding data to mOdeland view object
		System.out.println(list.size());
		mv.addObject("date", datemain);
		mv.setViewName("loginpage");			//returning to the same page
		return mv;
	
		}
}
