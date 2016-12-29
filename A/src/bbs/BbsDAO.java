package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class BbsDAO {
	/**
	 * 부모글인지 확인
	 * 부모글이면 삭제못함
	 * @param Bbsno 삭제하려고하는 글번호
	 * @return true 부모글번호,  false부모글번호 아님
	 */
	public boolean checkRefno(int bbsno){
		boolean flag = false;
		Connection con =DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(refno) from Abbs ");
		sql.append(" where refno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0){
					flag = true;//부모글이다.
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return flag;
	}
	public int total(String col, String word){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from Abbs ");
		if(word.trim().length()>0){
		sql.append(" where " +col+ " like '%'||?||'%' ");
		}
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return total;
		
	}
	
	public void upAnsnum(Map map) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");

		sql.append(" update Abbs ");
		sql.append(" set ansnum = ansnum + 1 ");
		sql.append(" where grpno = ? and ansnum > ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public boolean createReply(BbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO Abbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum,refno,filename,filesize)   ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 FROM Abbs),  ");
		sql.append(" ?,?,?,?, sysdate, ");
		sql.append(" ?,?,?,?,?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());//★부모와 grpno동일
			pstmt.setInt(6, dto.getIndent()+1);//★부모의 indent+1
			pstmt.setInt(7, dto.getAnsnum()+1);//★부모의 ansnum+1
			pstmt.setInt(8, dto.getBbsno());//★부모의 글번호 등록
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		

		return flag;
	}

	public boolean delete(int bbsno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" delete from Abbs ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(BbsDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE  Abbs  ");
		sql.append(" SET wname=?,  ");
		sql.append(" title=?,  ");
		sql.append(" content=?  ");
		if(dto.getFilesize()>0){
			sql.append(" ,filename= ?, ");
			sql.append(" filesize= ? ");
		}
		sql.append(" WHERE bbsno = ?  ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, dto.getWname());
			pstmt.setString(++i, dto.getTitle());
			pstmt.setString(++i, dto.getContent());
			
			if(dto.getFilesize()>0){
				pstmt.setString(++i, dto.getFilename());
				pstmt.setInt(++i, dto.getFilesize());
			}
			
			pstmt.setInt(++i, dto.getBbsno());

			int cnt = pstmt.executeUpdate();
			
			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int bbsno = (Integer) map.get("bbsno");
		String passwd = (String) map.get("passwd");

		StringBuffer sql = new StringBuffer();

		sql.append(" select COUNT(bbsno) as cnt  ");
		sql.append(" FROM Abbs  ");
		sql.append(" WHERE bbsno=? AND passwd=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");

			if (cnt > 0) {
				flag = true;// 존재(올바른패스워드)
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return flag;
	}

	public BbsDTO readReply(int bbsno) {
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select Bbsno,  title, grpno, indent, ansnum,filename,filesize ");
		sql.append(" from Abbs ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}

	public BbsDTO read(int bbsno) {// 읽기용 리드
		BbsDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select Bbsno, wname , title, viewcnt ,content, to_char(wdate,'yyyy-mm-dd') wdate, filename,filesize ");
		sql.append(" from Abbs ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;

	}

	public void upViewcnt(int bbsno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" update Abbs ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public List<BbsDTO> list(Map map) {
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, wname, title, content, passwd, viewcnt,  to_char(wdate,'yyyy-mm-dd') wdate,  indent, filename , r   ");
		sql.append(" 	FROM(  ");
		sql.append(" SELECT bbsno, wname, title, content, passwd, viewcnt, wdate, indent, filename ,rownum r ");
		sql.append(" 	FROM(  ");
		sql.append(" 	select Bbsno, wname , title, content, passwd, viewcnt , wdate ,indent,  filename ");
		sql.append(" 	from Abbs ");
		
		if(word.trim().length()>0){
			sql.append(" 			where "+col+" like '%'||?||'%' ");
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ASC ");
		sql.append(" 				) ");
		sql.append("	 	)where r>=? and r<=? ");
		
			try {
			pstmt = con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0){
				pstmt.setString(++i, word);
			}
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);

			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setIndent(rs.getInt("indent"));
				dto.setFilename(rs.getString("filename"));

				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean create(BbsDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO Abbs(bbsno, wname, title, content, passwd, wdate, grpno,filename,filesize)   ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 FROM Abbs),  ");
		sql.append(" ?,?,?,?, sysdate, ");
		sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 FROM Abbs),?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

}
