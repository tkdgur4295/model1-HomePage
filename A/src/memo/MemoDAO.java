package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class MemoDAO {
	public int total(String col, String word){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) ");
		sql.append(" from Amemo ");
		if(word.trim().length()>0){
		sql.append(" where "+col+" like '%'||?||'%'  ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0){
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				total=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		
		return total;
	}
	public void upViewcnt(int memono) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update Amemo ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where memono=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public boolean delete(int memono) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from Amemo ");
		sql.append(" where memono = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update Amemo ");
		sql.append(" set title = ?, ");
		sql.append(" content = ? ");
		sql.append(" where memono = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public MemoDTO read(int memono) {
		MemoDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono, title,content,to_char(wdate,'yyyy-mm-dd') wdate,viewcnt ");
		sql.append(" from Amemo ");
		sql.append(" where memono = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public boolean create(MemoDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into Amemo(memono,title,content,wdate) ");
		sql.append(" values((SELECT NVL(MAX(memono), 0) + 1 FROM Amemo),?,?,sysdate) ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public List<MemoDTO> list(Map map) {
		List<MemoDTO> list = new ArrayList<MemoDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		StringBuffer sql = new StringBuffer();
		sql.append(" select memono, title, to_char(wdate,'yyyy-mm-dd') wdate,viewcnt, r ");
		sql.append(" 	from( ");
		sql.append(" 		select memono, title, wdate,viewcnt,rownum r ");
		sql.append(" 			from( ");
		sql.append(" 				select memono,title,wdate,viewcnt ");
		sql.append(" 				from Amemo ");


		if (word.trim().length() > 0) {
			sql.append("            where " + col + " like '%'||?||'%' ");
		}

		sql.append("               	order by memono desc ");
		sql.append(" 	 ) ");
		sql.append(" )where r>=? and r<=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			int j = 0;
			if (word.trim().length() > 0) {
				pstmt.setString(++j, word);
			}
			pstmt.setInt(++j, sno);
			pstmt.setInt(++j, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

}
