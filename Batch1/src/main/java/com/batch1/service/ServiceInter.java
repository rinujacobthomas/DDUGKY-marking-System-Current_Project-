package com.batch1.service;

import java.util.List;

import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;



public interface ServiceInter {

	void setList(String date,String batch);

	void addstudent(AddUserbo addbo);

	List<BoClass> ListView(String parameter, String parameter2);

	void markupdate(BoClass boclass, String datemain);

	void setListWeek(String parameter, String parameter2);

	List<BoClass> ListViewWeek(String week, String batch);

	void markupdateWeek(BoClass boclass, String week);

	LoginBO uservalidate(LoginBO logbo);

	List<BoClass> studentDetails(String id);

	List<BoClass> studentDetailsWeek(String id);

	List<BoClass> search_Student(String id);

	void Delete_Student(String id);

	List<BoClass> batchStudentsView(String batch);

	BoClass passwordView(String parameter);

	void passwordChange(String id, String password);

	void addTrainer(String parameter, String parameter2, String parameter3);

	void trainerPasswordChange(String parameter, String parameter2);



}
