package travel.sendEmail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailDAO {

	public List<String> getMailList() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;

		try {
			String usr = "travel";
			String pw = "travel";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, usr, pw);

			System.out.println("Database에 연결되었습니다.\n");

		} catch (ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 :" + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}

		List<String> list = new ArrayList<>();
		String sql = "select * from subscribe";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String email = rs.getString("submail");
				list.add(email);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}// end of sendMailList()

	public void sendMail(List<String> list, String contents) {
		System.out.println(contents);

		String host = "smtp.naver.com";
		final String user = "yedamtest";
		final String password = "dyffh12#";

		String to;// = "jhw211@naver.com";

		// 세션 받아옴
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		for (String str : list) {

			to = str.toString();
			System.out.println("to : " + to);
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

				message.setSubject("[Yolo-Travel] Yolo-Travel에서 알리는 새로운 소식!!!");

				message.setText("Simple mail test..");
				message.setContent(contents, "text/html;charset=utf-8");

				Transport.send(message);
				System.out.println("Send Mail Success");

			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}// end of sendMail

}// end of class
