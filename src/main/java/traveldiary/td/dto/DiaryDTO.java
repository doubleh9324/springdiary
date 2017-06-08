package traveldiary.td.dto;

import java.util.Date;

public class DiaryDTO {

	private int member_num;
	private int diary_volum;
	private String diary_title;
	private Date time;
	private Date start_day;
	private Date end_day;
	private String location_code;
	private String diary_cover;
	private String p_code;
	private String del_flag;

	
	
	public void setMember_num(int mnum){
		this.member_num = mnum;
	}
	
	public int getMember_num(){
		return this.member_num;
	}
	
	public void setDiary_volum(int dvol){
		this.diary_volum = dvol;
	}
	
	public int getDiary_volum(){
		return this.diary_volum;
	}
	
	public void setDiary_title(String title){
		this.diary_title = title;
	}
	
	public String getDiary_title(){
		return this.diary_title;
	}
	
	public void setDate(Date time){
		this.time = time;
	}
	
	public Date getDate(){
		return this.time;
	}
	
	public void setStart_day(Date sday){
		this.start_day = sday;
	}
	
	public Date getStart_day(){
		return this.start_day;
	}
	
	public void setEnd_day(Date eday){
		this.end_day = eday;
	}
	
	public Date getEnd_day(){
		return this.end_day;
	}
	
	public void setLocation_code(String loc){
		this.location_code = loc;
	}
	
	public String getLocation_code(){
		return this.location_code;
	}
	
	public void setDiary_cover(String cov){
		this.diary_cover = cov;
	}
	
	public String getDiary_cover(){
		return this.diary_cover;
	}
	
	public void setP_code(String pcode){
		this.p_code = pcode;
	}
	
	public String getP_code(){
		return this.p_code;
	}
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
}