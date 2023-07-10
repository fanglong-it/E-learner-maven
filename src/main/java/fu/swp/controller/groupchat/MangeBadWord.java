package fu.swp.controller.groupchat;

import fu.swp.base.Base;
import fu.swp.dao.CourseDAO;
import fu.swp.dto.BadWord;
import fu.swp.model.Account;
import fu.swp.model.Course;
import fu.swp.utils.Constant;
import fu.swp.utils.Util;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "MangeBadWord", value = "/manager-bad-word")
public class MangeBadWord extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String badwordEdit = request.getParameter("editBadword");
        String id = request.getParameter("id");


        String filePath = Constant.rootPath + "resources/badword.txt";  // Specify the path to your text file
        String url = "manager-bad-word.jsp";
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {

                // get list badwords
                List<BadWord> badWordList = new ArrayList<>();

                String line;
                while ((line = br.readLine()) != null) {
                    BadWord badWord = Util.mapLineToBadWord(line);
                    if (badWord != null) {
                        badWordList.add(badWord);
                    }
                }

                if(id != null && !id.trim().isEmpty() &&  badwordEdit != null && !badwordEdit.isEmpty()){
                    // update
                    updateBadWordById(badWordList, Integer.parseInt(id), badwordEdit);
                    // Update the file content
                    updateFileContent(filePath, badWordList);
                }else if(id != null && !id.trim().isEmpty()){
                    // delete
                    deleteBadWordById(badWordList, Integer.parseInt(id));
                    // Update the file content
                    updateFileContent(filePath, badWordList);
                }




                request.setAttribute("badwords", badWordList);
                url = "manager-bad-word.jsp";

            } else {
                url = "Login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }


    }

    private static void updateFileContent(String filePath, List<BadWord> badWordList) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (BadWord badWord : badWordList) {
                bw.write("id=" + badWord.getId() + ",badWord=" + badWord.getBadWord());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private static void updateBadWordById(List<BadWord> badWordList, int id, String updatedName) {
        for (BadWord badWord : badWordList) {
            if (badWord.getId() == id) {
                badWord.setBadWord(updatedName);
                break;
            }
        }

        saveBadWordsToFile(badWordList);
    }

    private static void deleteBadWordById(List<BadWord> badWordList, int id) {
        Iterator<BadWord> iterator = badWordList.iterator();
        while (iterator.hasNext()) {
            BadWord badWord = iterator.next();
            if (badWord.getId() == id) {
                iterator.remove();
                break;
            }
        }

        saveBadWordsToFile(badWordList);
    }

    private static void saveBadWordsToFile(List<BadWord> badWordList) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(Constant.rootPath + "resources/badword.txt"))) {
            for (BadWord badWord : badWordList) {
                bw.write("id=" + badWord.getId() + ",badWord=" + badWord.getBadWord());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void addNewBadWord(List<BadWord> badWordList, String newBadWord) {
        int nextId = getNextId(badWordList);
        BadWord badWord = new BadWord(nextId, newBadWord);
        badWordList.add(badWord);

        saveBadWordsToFile(badWordList);
    }

    private static int getNextId(List<BadWord> badWordList) {
        int maxId = 0;
        for (BadWord badWord : badWordList) {
            if (badWord.getId() > maxId) {
                maxId = badWord.getId();
            }
        }
        return maxId + 1;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String badword = request.getParameter("txtBadWord");

        String filePath = Constant.rootPath + "resources/badword.txt";  // Specify the path to your text file
        String url = "manager-bad-word.jsp";
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {

                // get list badwords
                List<BadWord> badWordList = new ArrayList<>();

                String line;
                while ((line = br.readLine()) != null) {
                    BadWord badWord = Util.mapLineToBadWord(line);
                    if (badWord != null) {
                        badWordList.add(badWord);
                    }
                }

                if(badword != null && !badword.isEmpty()){
                    //save to the list
                    addNewBadWord(badWordList, badword);
                }

                request.setAttribute("badwords", badWordList);
                url = "manager-bad-word.jsp";

            } else {
                url = "Login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }
}
