package com.cleanblog.model;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

public class PostHandler {

    private static ArrayList<Post> blogger;
    private static String PATH;//= "C:\\posts\\blogger.cache";

//    static {
//        try {
//            init();
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        }
//    }
    public static void setRealPath(HttpServletRequest request) {
        PATH = request.getServletContext().getRealPath("/posts/blogger.cache");
        try {
            init();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    private static boolean fileExists(String path) {
        File f = new File(path);
        return f.isFile();
    }

    private static void serialize() throws IOException {
        FileOutputStream fos = new FileOutputStream(PATH);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(blogger);
    }

    private static void deserialize() throws IOException, ClassNotFoundException {
        InputStream file = new FileInputStream(PATH);
        InputStream buffer = new BufferedInputStream(file);
        ObjectInput input = new ObjectInputStream(buffer);
        blogger = (ArrayList<Post>) input.readObject();
    }

    public static void init() throws IOException, ClassNotFoundException {
        if (blogger == null) {
            if (!fileExists(PATH)) {
                blogger = new ArrayList<Post>(10);
                serialize();
            } else {
                deserialize();
            }
        }
    }

    public static int getCurrentID() throws IOException, ClassNotFoundException {
        return blogger.size();
    }

    public static ArrayList<Post> getBlogPosts() throws IOException, ClassNotFoundException {
        return blogger;
    }

    public static boolean containsPost(int id) throws IOException, ClassNotFoundException {
        return (id >= 0 && id < blogger.size());
    }

    public static Post getPostByID(int id) throws IOException, ClassNotFoundException {
        if (containsPost(id)) {
            return blogger.get(id);
        }
        return null;
    }

    public static void addPost(Post p) throws IOException, ClassNotFoundException {
        blogger.add(p);
        serialize();
    }

    public static void hitPost(int pid) throws IOException, ClassNotFoundException {
        getPostByID(pid).hit();
    }

    public static void editPost(int pid, String user, String content) throws IOException, ClassNotFoundException {
        getPostByID(pid).editPost(user, content);
        serialize();
    }

    public static void addComment(int pid, String user, String comment) throws IOException, ClassNotFoundException {
        getPostByID(pid).addComment(new Comment(user, comment));
        serialize();
    }

    public static void approveComment(int pid, int cid) throws IOException, ClassNotFoundException {
        getPostByID(pid).approveComment(cid);
        serialize();
    }

}
