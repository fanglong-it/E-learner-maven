package controller.groupchat;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.MessageDAO;
import dto.BadWord;
import model.Message;
import utils.Constant;
import utils.Util;

/**
 * Servlet implementation class getMessage
 */
@WebServlet("/get-messages")
public class getMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "";
		try {
			String groupChatId = request.getParameter("groupId");
			String rows = request.getParameter("rows");
			
			System.out.println("Vuejs get groupChat Message: " + groupChatId);
			 // Convert messages to JSON string using Jackson ObjectMapper
			MessageDAO messageDAO = new MessageDAO();
			
			List<Message> messages = messageDAO.getAllMessageFromGroupId(Integer.parseInt(groupChatId),
					Integer.parseInt(rows));
			Collections.reverse(messages);
			// get list bad word
			String filePath = Constant.rootPath + "resources/badword.txt"; // Specify the path to your text file

			// get list badwords
			List<BadWord> badWordList = new ArrayList<>();

			try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
				String line;
				while ((line = br.readLine()) != null) {
					BadWord badWord = Util.mapLineToBadWord(line);
					if (badWord != null) {
						badWordList.add(badWord);
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			List<String> badwordContent = new ArrayList<>();
			for (BadWord b : badWordList) {
				badwordContent.add(b.getBadWord());
			}

			for (Message mess : messages) {
				String allowMess = Util.censorBadWords(mess.getContent(), badwordContent);
				mess.setContent(allowMess);
			}
			
			
	        ObjectMapper mapper = new ObjectMapper();
	        String messagesJson = mapper.writeValueAsString(messages);

	        // Send the JSON response back to the client
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(messagesJson);
	        out.flush();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	  // Your method to fetch messages (replace this with your actual method)
//    private List<Message> getMessageData(String groupId) {
//        // Replace this with your logic to retrieve messages based on groupId
//        // Sample data for demonstration purposes
//        List<Message> messages = new ArrayList<>();
//        // Add messages to the list...
//        return messages;
//    }

}
