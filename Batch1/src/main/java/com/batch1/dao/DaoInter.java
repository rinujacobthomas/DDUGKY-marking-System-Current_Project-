package com.batch1.dao;

import java.util.List;

import com.batch1.bo.AddUserbo;
import com.batch1.bo.BoClass;
import com.batch1.bo.LoginBO;



public interface DaoInter {

	void setList(String date,String batch );

	void addstudent(AddUserbo addbo);

	List<BoClass> ListView(String date, String batch);

	void markupdate(BoClass boclass, String date);

	void setListWeek(String date, String batch);

	List<BoClass> ListViewWeek(String week, String batch);

	void markupdateWeek(BoClass boclass, String week);

	LoginBO uservalidate(LoginBO logbo);

	List<BoClass> studentDetails(String id);

	List<BoClass> studentDetailsweek(String id);

}
