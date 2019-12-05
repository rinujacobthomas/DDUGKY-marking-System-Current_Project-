package com.batch1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;

import com.batch1.dao.DaoInter;

public class ServiceClass implements ServiceInter {
@Autowired
DaoInter dao;
	public  void setList(String date,String batch) {
		
		dao.setList(date,batch);
	}
	public void addstudent(AddUserbo addbo) {
		dao.addstudent(addbo);
	}
	public List<BoClass> ListView(String date, String batch) {
		
		return dao.ListView(date,batch);
	}
	public void markupdate(BoClass boclass,String date) {
		
		dao.markupdate(boclass,date);
	}
	public void setListWeek(String date, String batch) {
		dao.setListWeek(date,batch);
	}
	public List<BoClass> ListViewWeek(String week, String batch) {
		
		return dao.ListViewWeek(week,batch);
	}
	public void markupdateWeek(BoClass boclass, String week) {
		dao.markupdateWeek(boclass,week);
		
	}
	public LoginBO uservalidate(LoginBO logbo) {
		
		return dao.uservalidate(logbo);
	}
	public List<BoClass> studentDetails(String id) {
		
		return dao.studentDetails(id);
	}
	public List<BoClass> studentDetailsWeek(String id) {
		
		return dao.studentDetailsweek(id); 
	}

}
