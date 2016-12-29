package player;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class PlayerDao {

	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		String fname = (String) map.get("fname");
		int num = (Integer) map.get("num");
		StringBuffer sql = new StringBuffer();
		sql.append(" update player set fname = ? where num = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, fname);
			pstmt.setInt(2, num);

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

	public boolean delete(int num) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" delete from player where num = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);

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

	public boolean create(PlayerDto dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into player (num,name,country,tall,bdate,fname,dyear,content) values (?,?,?,?,?,?,?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getCountry());
			pstmt.setInt(4, dto.getTall());
			pstmt.setString(5, dto.getBdate());
			pstmt.setString(6, dto.getFname());
			pstmt.setInt(7, dto.getDyear());
			pstmt.setString(8, dto.getContent());

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

	public PlayerDto read(int num) {
		PlayerDto dto = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select num, name, country, fname, tall, bdate, dyear, content from player where num = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new PlayerDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setCountry(rs.getString("country"));
				dto.setFname(rs.getString("fname"));
				dto.setTall(rs.getInt("tall"));
				dto.setBdate(rs.getString("bdate"));
				dto.setDyear(rs.getInt("dyear"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public List<PlayerDto> list(Map map) {
		List<PlayerDto> list = new ArrayList<PlayerDto>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT num, name, country, fname, r  ");
		sql.append(" from( ");
		sql.append(" 	SELECT num, name, country, fname, rownum r  ");
		sql.append(" 	from( ");
		sql.append(" 		SELECT num, name, country, fname  ");
		sql.append(" 		FROM player  ");
		if (word.trim().length() > 0)
			sql.append(" 	WHERE " + col + " LIKE '%'||?||'%' ");
		sql.append(" 		ORDER BY num asc    "); // 최근가입자가 위에올라옴
		sql.append(" 	) ");
		sql.append(" )where r>=? and r<=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			int i = 1;

			if (word.trim().length() > 0)
				pstmt.setString(i++, word);

			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				PlayerDto dto = new PlayerDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setCountry(rs.getString("country"));
				dto.setFname(rs.getString("fname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" 		select count(*) from player ");
		if (word.trim().length() > 0) {
			sql.append(" 	where " + col + " like '%'||?||'%' ");
		}

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
}