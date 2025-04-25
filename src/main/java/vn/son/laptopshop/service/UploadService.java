package vn.son.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(
            ServletContext servletContext) {

        this.servletContext = servletContext;
    }

    // Phương thức để xử lý việc lưu file tải lên từ người dùng.
    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // don't upload file
        if (file.isEmpty()) {
            return "";
        }
        // Lấy đường dẫn tuyệt đối đến thư mục chứa hình ảnh trên server.
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            // Chuyển file tải lên thành mảng byte.
            byte[] bytes = file.getBytes();
            // Tạo thư mục đích (targetFolder) nếu nó chưa tồn tại.
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists()) {
                dir.mkdirs();// Tạo thư mục mới nếu chưa tồn tại.
            }

            // Tạo tên file duy nhất, tránh trùng lặp.
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            // Tạo đối tượng file trên server để lưu trữ.
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            // uuid
            // Ghi dữ liệu của file tải lên vào file trên server.
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);// Ghi mảng byte vào file.
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // Trả về tên file đã lưu trên server để có thể sử dụng sau này (ví dụ: lưu vào cơ sở dữ liệu).
        return finalName;
    }

}
