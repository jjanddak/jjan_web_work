package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	
	private UsersDao() {}
	
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	
	public List<UsersDto> getList(){
		List<UsersDto> list=new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체 (connection pool 로부터) 하나 가지고 오기 
			conn=new DbcpBean().getConn();
			String sql="SELECT id, pwd, email, regdate FROM users"
					+ " ORDER BY id DESC";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UsersDto dto=new UsersDto();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool 에 반납하기 
				//.close() 메소드를 호출하면 자동 반납된다.
				if(conn!=null)conn.close(); 
			}catch(Exception e) {}
		}
		return list;
	}
	
	public boolean isExist(String inputId) {
		boolean isExist=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체 (connection pool 로부터) 하나 가지고 오기 
			conn=new DbcpBean().getConn();
			String sql="SELECT id from users"
					+ " where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				isExist=true; //id가 이미존재한다면.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool 에 반납하기 
				//.close() 메소드를 호출하면 자동 반납된다.
				if(conn!=null)conn.close(); 
			}catch(Exception e) {}
		}
		return isExist;
	}
	
	//이메일검증
	public boolean isExist2(String inputEmail) {
		boolean isExist=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체 (connection pool 로부터) 하나 가지고 오기 
			conn=new DbcpBean().getConn();
			String sql="SELECT email from users"
					+ " where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				isExist=true; //id가 이미존재한다면.
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool 에 반납하기 
				//.close() 메소드를 호출하면 자동 반납된다.
				if(conn!=null)conn.close(); 
			}catch(Exception e) {}
		}
		return isExist;
	}
	
	//인자로 전달되는 아이디에 대한 가입정보를 리턴하는 메소드
	public UsersDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT pwd, email, regdate, profile"
					+ " from users"
					+ " where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setProfile(rs.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				//.close() 메소드를 호출하면 자동 반납된다.
				if (conn != null)
					conn.close();
			} catch (Exception e) {}
		}
		return dto;
	}
	
	//비밀번호 수정반영하는 메소드
	public boolean updatePwd(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update users set pwd=? where id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getId());
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//회원삭제 메소드
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete from users where id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		return false;
	}
	
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag=0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update users set email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getId());
			flag=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	//dto의 값이 유효한지 검사하는메소드.(로그인시)
	public boolean isValid(UsersDto dto) {
		boolean isValid=false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select * from users"
					+ " where id=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs=pstmt.executeQuery();
			while(rs.next()) {//select 된 row 가 있으면
				//아이디, 비밀번호가 일치함으로 isValid=true
				isValid=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
			}
		}
		return isValid;
	}
	
	
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO users"
					+ " (id,pwd,email,regdate)"
					+ " VALUES(?, ?, ?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
}
