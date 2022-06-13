package cellivery.classes;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	
	@Value("${spring.config.activate.on-profile}")
	private static String env;
	
	public static HashMap<String, String> fileUpload(List<MultipartFile> files, String uploadPath, String env) {
		String[] fnList = (files != null) ? new String[files.size()] : new String[0];
		String[] oriList = (files != null) ? new String[files.size()] : new String[0];
		HashMap<String, String> res = new HashMap<>();
		String sep = "/";
		
		Calendar cal = Calendar.getInstance();
		String year = new SimpleDateFormat("yyyy").format(cal.getTime());
		String month = new SimpleDateFormat("MM").format(cal.getTime());
		
		String dirPath = "";
		String savePath = "";
		
		if("local".equals(env))
		{
			dirPath = sep+ "src/main/resources/static/upload" +sep+ uploadPath +sep+ year +sep+ month;
			savePath = System.getProperty("user.dir") + dirPath;
		}
		else if("server".equals(env))
		{
			dirPath = "static/upload" +sep+ uploadPath +sep+ year +sep+ month;
			FileUtils fileUtils = new FileUtils();
			String path = fileUtils.getClass().getResource("/").getPath();
			savePath = path + dirPath;
		}
		
		
		System.out.println("env : "+env);
		
		if (!new File(savePath).exists()) {
			try{
				new File(savePath).mkdirs();
			}
			catch(Exception e){
				e.getStackTrace();
			}
		}
		
		try {
			for(int num = 0; num < files.size(); num++) {
				MultipartFile file = files.get(num);
				String origFilename = file.getOriginalFilename();
				String filename = (!origFilename.equals("")) ? MD5Generator(origFilename) : "";
				String ext = "";
				
				String[] fileNameArr = origFilename.split("\\.");
				
				if( fileNameArr.length != 0 ) {
					ext = "."+fileNameArr[fileNameArr.length - 1];
				}
				
				filename = filename + ext;
				
				String filePath = savePath +sep+ filename;
				dirPath = sep+ "upload" +sep+ uploadPath +sep+ year +sep+ month;
				if(file.getSize() > 0) {
					file.transferTo(new File(filePath));
					filename = dirPath +sep+ filename;
				}
				fnList[num] = filename;
				oriList[num] = origFilename;
			}
		} catch(Exception e) {
		    e.printStackTrace();
		}
		res.put("oriFilename", String.join("|",	oriList));
		res.put("filename", String.join("|", fnList));
		return res;
	}
	
	
	public static String MD5Generator(String input) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		MessageDigest mdMD5 = MessageDigest.getInstance("MD5");
		mdMD5.update(input.getBytes("UTF-8"));
		byte[] md5Hash = mdMD5.digest();
		StringBuilder hexMD5hash = new StringBuilder();
		for (byte b : md5Hash) {
			String hexString = String.format("%02x", b);
			hexMD5hash.append(hexString);
		}
		return hexMD5hash.toString();
	}
	public static List<HashMap<String, String>> fileToList(Object filename, Object oriFilename){
		List<HashMap<String, String>> fileList = new ArrayList<>();
		String[] fileStr = String.valueOf(filename).split("\\|");
		String[] oriFileStr = String.valueOf(oriFilename).split("\\|");
		for(int i = 0; i < fileStr.length; i++) {
			HashMap<String, String> fileMap = new HashMap<>();
			fileMap.put("filename", fileStr[i]);
			fileMap.put("oriFilename", oriFileStr[i]);
			fileList.add(fileMap);
		}
		return fileList;
	}
}