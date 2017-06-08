package traveldiary.td.dto;

import java.util.Date;

public class ReplyDTO {
	private String reply;
	private int day_reply;
	private int member_num;
	private Date time;
	private int reply_num;
	private String del_flag;
	
	public int getDay_reply() {
		return day_reply;
	}

	public void setDay_reply(int day_reply) {
		this.day_reply = day_reply;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public void setReply(String reply){
		this.reply = reply;
	}
	
	public String getReply(){
		return this.reply;
	}
	
	public void setDay_num(int num){
		this.day_reply = num;
	}
	
	public int getDay_num(){
		return this.day_reply;
	}
	
	public void setMember_num(int num){
		this.member_num = num;
	}
	
	public int getMember_num(){
		return this.member_num;
	}
	
	public void setTime(Date time){
		this.time = time;
	}
	
	public Date getTime(){
		return this.time;
	}
	
	public void setReply_num(int renum){
		this.reply_num = renum;
	}

	public int getReply_num(){
		return this.reply_num;
	}
}