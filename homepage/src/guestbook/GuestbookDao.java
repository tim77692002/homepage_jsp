package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import utility.DBClose;
import utility.DBOpen;

public class GuestbookDao {
	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from guestbook ");
		if (word.trim().length() > 0)
			sql.append(" where " +col+ " like '%'||?||'%' ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;
	}

	public void upViewcnt(int no) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update guestbook set viewcnt = viewcnt + 1 where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
	}

	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open(); // 디비 연결
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer(); // 쿼리 처리담을 객체
		sql.append(" delete from guestbook where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString()); // 전송 객체
			pstmt.setInt(1, no); // 물을표 연결
			int cnt = pstmt.executeUpdate(); // 전송하는것. 전송된 객체 수 리턴.
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(GuestbookDto dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update guestbook set title = ?, content = ?, wname = ? where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWname());
			pstmt.setInt(4, dto.getNo());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public GuestbookDto read(int no) {
		GuestbookDto dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(
				" select no,title,content,to_char(wdate,'yyyy-mm-dd') wdate, viewcnt,wname from guestbook where no = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new GuestbookDto();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWname(rs.getString("wname"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}

	public boolean create(GuestbookDto dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into guestbook(no, title, content, wname, wdate) values((SELECT NVL(MAX(no), 0) + 1 as no FROM guestbook),?,?,?,sysdate) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWname());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public List<GuestbookDto> list(Map map) {
		List<GuestbookDto> list = new ArrayList<GuestbookDto>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();

		sql.append(" select no, title, to_char(wdate, 'yyyy-mm-dd') wdate, wname, viewcnt, r ");
		sql.append(" from( ");
		sql.append(" 	select no, title, wdate, wname, viewcnt, rownum r ");
		sql.append(" 	from ( ");
		sql.append(" 		SELECT no, title, wdate, wname, viewcnt FROM guestbook ");

		if (word.trim().length() > 0)
			sql.append(" 	where " + col + " like '%'||?||'%' ");

		sql.append(" 		ORDER BY no DESC ");
		sql.append(" 	) ");
		sql.append(" ) where r>=? and r<=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			int i = 0;

			if (word.trim().length() > 0)
				pstmt.setString(++i, word);

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GuestbookDto dto = new GuestbookDto();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setWname(rs.getString("wname"));
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