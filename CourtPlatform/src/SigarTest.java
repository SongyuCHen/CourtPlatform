import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.codehaus.jackson.util.BufferRecycler;
import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.FileSystem;
import org.hyperic.sigar.FileSystemUsage;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.OperatingSystem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;

import com.sun.org.apache.regexp.internal.recompile;

public class SigarTest {
	private String DATABASE_DIR = "./";
	
	@SuppressWarnings("unchecked")
	public boolean  dataBaseUp(String basePath,String dataBaseSavePath,long currentTime,String databaseName) throws IOException
	{
		
		File inputFile = createFileOnServer(basePath,new String[]{DATABASE_DIR},"InputFile-"+currentTime+".txt");
		File outFile = createFileOnServer(basePath,new String[]{DATABASE_DIR},"OutFile-"+currentTime+".txt");	
//		FileOnTemplateV fileOnTemplateV = new FileOnTemplateV();
//		fileOnTemplateV.generatorFileBaseOnTemplate("dataBaseDump.vm",new String[]{"databaseName","databaseSavePath"},new Object[]{databaseName.trim(),dataBaseSavePath.trim()}, inputFile);
		
		// 拼出可以执行的命令
		//备份
//		isql -Usa -P -Sfyrs-server
//		go
//		use master  文件命令从这里开始
//		go
//		dump database FYRS TO 'D:\fyrsSpringWorkspace\2014-10-22\tools\apache-tomcat-7.0.53\backup\fyrs20141027.dmp'
//		go
		Process process = Runtime.getRuntime().exec("cmd /c isql -Usa -P  -Sfyrs-server -D"+databaseName.trim()+"  -i"+inputFile.toString()+"  -o"+outFile.toString());
		try
		{
			process.waitFor();
		} catch (InterruptedException e)
		{
			e.printStackTrace();
			return false;
		}
		FileReader fr = new FileReader(outFile);
		BufferedReader br = new BufferedReader(fr);
		boolean c;
		do{
			String s = br.readLine();
			System.out.println(s);
		}while(c = br.read()!=-1);

//		List<String> lines = FileUtils.readLines(outFile);
//		for(String line : lines)
//		{
//			if(line.contains("DUMP is complete"))
//			{
//				return true;
//			}
//		}
		//deleteFile(inputFile);
		//deleteFile(outFile);
		return false;
	}
	public static File createFileOnServer(String basepath,String[] directory,String fileName) throws IOException
	{
		StringBuilder sb = new StringBuilder();
		File file = null;
		if(null == directory)
		{
			sb.append(basepath).append(File.separator).append(fileName);
			file = new File(sb.toString());
			if(!file.exists())
			{
				file.createNewFile();
			}
			return file;
		}
		else
		{
			sb.append(basepath);
			for(int i = 0; i < directory.length; i++)
			{
				sb.append(File.separator).append(directory[i]);
			}
			file = new File(sb.toString());
			if(!file.exists())
			{
				file.mkdirs();
			}
			File newFile = new File(file,fileName);
			if(!newFile.exists())
			{
				newFile.createNewFile();
			}
			return newFile;
		}
		
	}

	public static void main(String[] args) throws SigarException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		   //Class.forName("com.sybase.jdbc3.jdbc.SybDriver").newInstance();//通过jdbc方式连接  
	    Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();//通过jtds方式连接  
	      
	    //String url ="jdbc:sybase:Tds:192.168.102.100:5000/test";//通过jdbc方式连接,test为数据库名  
	    String url ="jdbc:jtds:sybase://155.36.0.104:5000/";//通过jtds方式连接，test为数据库名  
	      
	    Connection conn= DriverManager.getConnection(url, "sa","");  
	    Statement stmt=conn.createStatement(); 
	    String sql1="use master";  
	    stmt.execute(sql1);
	    Statement stmt1=conn.createStatement(); 
	    String sql="sp_spaceused";  
	    ResultSet rs=stmt1.executeQuery(sql);  
	    while(rs.next())  
	    {  
	    	System.out.println(rs.getString(1)+"-"+rs.getString(2));
            System.out.println("->");   
	    }  
	    try  
	    {  
	        rs.close();  
	        stmt.close();  
	        conn.close();  
	    }  
	    catch(Exception e)  
	    {  
	        System.err.println("error");
	    }  
//		Sigar sigar = new Sigar();
//		Mem mem = sigar.getMem();
//		// 内存总量
//        System.out.println("Total = " + mem.getTotal() / 1024L + "K av");
//        // 当前内存使用量
//        System.out.println("Used = " + mem.getUsed() / 1024L + "K used");
//        // 当前内存剩余量
//		System.out.println("Free = " + mem.getFree() / 1024L + "K free");
//		OperatingSystem OS = OperatingSystem.getInstance();
//        // 操作系统内核类型如： 386、486、586等x86
//        System.out.println("OS.getArch() = " + OS.getArch());
//        System.out.println("OS.getCpuEndian() = " + OS.getCpuEndian());//
//        System.out.println("OS.getDataModel() = " + OS.getDataModel());//
//        // 系统描述
//        System.out.println("OS.getDescription() = " + OS.getDescription());
//        System.out.println("OS.getMachine() = " + OS.getMachine());//
//        // 操作系统类型
//        System.out.println("OS.getName() = " + OS.getName());
//        System.out.println("OS.getPatchLevel() = " + OS.getPatchLevel());//
//        // 操作系统的卖主
//        System.out.println("OS.getVendor() = " + OS.getVendor());
//        // 卖主名称
//        System.out.println("OS.getVendorCodeName() = " + OS.getVendorCodeName());
//        // 操作系统名称
//        System.out.println("OS.getVendorName() = " + OS.getVendorName());
//        // 操作系统卖主类型
//        System.out.println("OS.getVendorVersion() = " + OS.getVendorVersion());
//        // 操作系统的版本号
//        System.out.println("OS.getVersion() = " + OS.getVersion());
//        CpuInfo infos[] = sigar.getCpuInfoList();
//        for (int i = 0; i < infos.length; i++) {//不管是单块CPU还是多CPU都适用
//            CpuInfo info = infos[i];
//            System.out.println("mhz=" + info.getMhz());//CPU的总量MHz
//            System.out.println("vendor=" + info.getVendor());//获得CPU的卖主，如：Intel
//            System.out.println("model=" + info.getModel());//获得CPU的类别，如：Celeron
//            System.out.println("cache size=" + info.getCacheSize());//缓冲存储器数量
//        }
//        FileSystem fslist[] = sigar.getFileSystemList();
//        String dir = System.getProperty("user.home");//当前用户文件夹路径
//        for (int i = 0; i < fslist.length; i++) {
//            System.out.println("/n~~~~~~~~~~" + i + "~~~~~~~~~~");
//            FileSystem fs = fslist[i];
//            // 分区的盘符名称
//            System.out.println("fs.getDevName() = " + fs.getDevName());
//            // 分区的盘符名称
//            System.out.println("fs.getDirName() = " + fs.getDirName());
//            System.out.println("fs.getFlags() = " + fs.getFlags());//
//            // 文件系统类型，比如 FAT32、NTFS
//            System.out.println("fs.getSysTypeName() = " + fs.getSysTypeName());
//            // 文件系统类型名，比如本地硬盘、光驱、网络文件系统等
//            System.out.println("fs.getTypeName() = " + fs.getTypeName());
//            // 文件系统类型
//            System.out.println("fs.getType() = " + fs.getType());
//            FileSystemUsage usage = null;
//            try {
//               usage = sigar.getFileSystemUsage(fs.getDirName());
//            } catch (SigarException e) {
//               if (fs.getType() == 2)
//                   throw e;
//               continue;
//            }
//            switch (fs.getType()) {
//            case 0: // TYPE_UNKNOWN ：未知
//               break;
//            case 1: // TYPE_NONE
//               break;
//            case 2: // TYPE_LOCAL_DISK : 本地硬盘
//               // 文件系统总大小
//               System.out.println(" Total = " + usage.getTotal() + "KB");
//               // 文件系统剩余大小
//               System.out.println(" Free = " + usage.getFree() + "KB");
//               // 文件系统可用大小
//               System.out.println(" Avail = " + usage.getAvail() + "KB");
//               // 文件系统已经使用量
//               System.out.println(" Used = " + usage.getUsed() + "KB");
//               double usePercent = usage.getUsePercent() * 100D;
//               // 文件系统资源的利用率
//               System.out.println(" Usage = " + usePercent + "%");
//break;
//            case 3:// TYPE_NETWORK ：网络
//               break;
//            case 4:// TYPE_RAM_DISK ：闪存
//               break;
//            case 5:// TYPE_CDROM ：光驱
//               break;
//            case 6:// TYPE_SWAP ：页面交换
//               break;
//            }
//            System.out.println(" DiskReads = " + usage.getDiskReads());
//            System.out.println(" DiskWrites = " + usage.getDiskWrites());
//        }
//        return;
}
}

