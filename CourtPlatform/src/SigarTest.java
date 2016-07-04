//import java.io.BufferedReader;
//import java.io.File;
//import java.io.FileReader;
//import java.io.IOException;
//import java.net.InetAddress;
//import java.sql.CallableStatement;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.List;
//
//import org.aspectj.weaver.ast.Call;
//import org.codehaus.jackson.util.BufferRecycler;
//import org.hyperic.sigar.CpuInfo;
//import org.hyperic.sigar.FileSystem;
//import org.hyperic.sigar.FileSystemUsage;
//import org.hyperic.sigar.Mem;
//import org.hyperic.sigar.OperatingSystem;
//import org.hyperic.sigar.Sigar;
//import org.hyperic.sigar.SigarException;
//import org.hyperic.sigar.cmd.Ps;
//
//import com.sun.crypto.provider.RSACipher;
//import com.sun.org.apache.regexp.internal.recompile;
//
//import nju.software.courtplatform.help.CPUInfo;
//import nju.software.courtplatform.help.FileSystemInfo;
//import nju.software.courtplatform.help.MechineState;
//import nju.software.courtplatform.help.MemoryInfo;
//import nju.software.courtplatform.help.SystemInfo;
//
//public class SigarTest {
//
//
//	public static void main(String[] args) throws SigarException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
//		// TODO Auto-generated method stub
//		InetAddress ia=null;
//		String localname=null;
//		String localip = null;
//		try {
//			ia=ia.getLocalHost();			
//			localname=ia.getHostName();
//			localip=ia.getHostAddress();
//			System.out.println("本机名称是："+ localname);
//			System.out.println("本机的ip是 ："+localip);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		MechineState ms = new MechineState();
//		
//		CPUInfo cpuInfo = new CPUInfo();
//		ArrayList<FileSystemInfo> fileSystemInfos = new ArrayList<FileSystemInfo>();
//		MemoryInfo mInfo = new MemoryInfo();
//		SystemInfo sInfo = new SystemInfo();
//		
//		Sigar sigar = new Sigar();
//		
//		cpuInfo.setCPUnum(sigar.getCpuInfoList().length);
//		CpuInfo info = sigar.getCpuInfoList()[0];
//		cpuInfo.setRate(info.getMhz()+"MHz");
//		cpuInfo.setVender(info.getVendor());
//		cpuInfo.setModel(info.getModel());
//		cpuInfo.setCache(info.getCacheSize()+"KB");
//		ms.setCpuInfo(cpuInfo);
//		
//		FileSystem fslist[] = sigar.getFileSystemList();
//		for (int i = 0; i < fslist.length; i++) {
//			FileSystem fs = fslist[i];
//			FileSystemInfo fsi = new FileSystemInfo();
//			fsi.setName(fs.getDevName());
//			FileSystemUsage usage = null;
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
//               fsi.setTotal(usage.getTotal()+"KB");
//               fsi.setUsed(usage.getUsed()+"KB");
//               double usePercent = usage.getUsePercent() * 100D;
//               fsi.setPercent(usePercent+"%");
//               break;
//            case 3:// TYPE_NETWORK ：网络
//               break;
//            case 4:// TYPE_RAM_DISK ：闪存
//               break;
//            case 5:// TYPE_CDROM ：光驱
//               break;
//            case 6:// TYPE_SWAP ：页面交换
//               break;
//            }
//            fileSystemInfos.add(fsi);
//		}
//		System.err.println("size:"+fileSystemInfos.size());
//		ms.setFileSystems(fileSystemInfos);
//		
//		Mem mem = sigar.getMem();
//		mInfo.setMemTotal(mem.getTotal() / 1024L + "KB");
//		mInfo.setMemUsed(mem.getUsed() / 1024L + "KB");
//		mInfo.setMemNotUsed(mem.getFree() / 1024L + "KB");
//		ms.setMemoryInfo(mInfo);
//		
//		OperatingSystem OS = OperatingSystem.getInstance();
//		sInfo.setArch(OS.getArch());
//		sInfo.setName(OS.getName());
//		sInfo.setVender(OS.getVendor());
//		sInfo.setVersion(OS.getVersion());
//		ms.setSystemInfo(sInfo);
//		
//		
//	    Class.forName("net.sourceforge.jtds.jdbc.Driver").newInstance();//通过jtds方式连接  	      
//	    String url ="jdbc:jtds:sybase://155.36.0.104:5100/JUDGE";//通过jtds方式连接，test为数据库名  	      
//	    Connection conn= DriverManager.getConnection(url, "sa","");  
//	    Statement stmt = conn.createStatement();
////	    localip = "155.36.0.104";
//	    String sql = "select * from T_SERVERS where IP='"+localip+"'";
//	    ResultSet rs = stmt.executeQuery(sql);
//	    int bh = -1;
//	    while (rs.next()) {
//		    bh  = rs.getInt("BH");
//	    }
//	    
//	    //cpu信息存储
//	    String sql2 = "select * from T_CPU where SERVERBH="+bh+"";
//	    ResultSet rs2 = stmt.executeQuery(sql2);
//	    if (rs2.next()) {
//	    	String sql3 = "update T_CPU set CPUNUM ="+cpuInfo.getCPUnum()+",RATE='"+cpuInfo.getRate()+"' , VENDER='"+cpuInfo.getVender()+"' , MODEL='"+cpuInfo.getModel()+"' , CACHESIZE='"+cpuInfo.getCache()+"' where SERVERBH="+bh;
//	    	stmt.executeUpdate(sql3);
//		}else{
//			 String maxbhsql = "select max(BH) M from T_CPU";
//			 ResultSet rs3 = stmt.executeQuery(maxbhsql);
//			 int maxbh = rs3.getInt("M");
//			 maxbh++;
//			String sql3 = "insert into T_CPU values("+maxbh+","+bh+",'"+cpuInfo.getCPUnum()+"','"+cpuInfo.getRate()+"','"+cpuInfo.getVender()+"','"+cpuInfo.getModel()+"','"+cpuInfo.getCache()+"')";
//	    	stmt.executeUpdate(sql3);
//		}
//	    
//	    //内存信息存储
//	    String sql3 = "select * from T_MEMORYINFO where SERVERBH="+bh+"";
//	    ResultSet rs3 = stmt.executeQuery(sql3);
//	    if (rs3.next()) {
//	    	String sql4 = "update T_MEMORYINFO set TOTAL ="+mInfo.getMemTotal()+",USED='"+mInfo.getMemUsed()+"' , PERCENT='"+mem.getUsedPercent()+"'  where SERVERBH="+bh;
//	    	stmt.executeUpdate(sql4);
//		}else{
//			 String maxbhsql = "select max(BH) M from T_MEMORYINFO";
//			 ResultSet rs4 = stmt.executeQuery(maxbhsql);
//			 int maxbh = rs4.getInt("M");
//			 maxbh++;
//			String sql4 = "insert into T_MEMORYINFO values("+maxbh+","+bh+",'"+mInfo.getMemTotal()+"','"+mInfo.getMemUsed()+"','"+mem.getUsedPercent()+"')";
//	    	stmt.executeUpdate(sql4);
//		}
//	    
//	    //系统信息存储
//	    String sql4 = "select * from T_SYSTEMINFO where SERVERBH="+bh+"";
//	    ResultSet rs4 = stmt.executeQuery(sql4);
//	    if (rs4.next()) {
//	    	String sql5 = "update T_SYSTEMINFO set ARCH ="+sInfo.getArch()+",SYSNAME='"+sInfo.getName()+"' , VENDER='"+sInfo.getVender()+"',VERSION='"+sInfo.getVersion()+"'  where SERVERBH="+bh;
//	    	stmt.executeUpdate(sql5);
//		}else{
//			 String maxbhsql = "select max(BH) M from T_SYSTEMINFO";
//			 ResultSet rs5 = stmt.executeQuery(maxbhsql);
//			 int maxbh = rs5.getInt("M");
//			 maxbh++;
//			String sql5 = "insert into T_SYSTEMINFO values("+maxbh+","+bh+",'"+sInfo.getArch()+"','"+sInfo.getName()+"','"+sInfo.getVender()+"','"+sInfo.getVersion()+"')";
//	    	stmt.executeUpdate(sql5);
//		}
//	    
//	    //磁盘信息存储
//	    String sql5 = "delete from T_FILESYSTEM where SERVERBH="+bh+"";
//	    stmt.execute(sql5);
//	    for(FileSystemInfo fi :fileSystemInfos){
//	    	String maxbhsql = "select max(BH) M from T_FILESYSTEM";
//			 ResultSet rs5 = stmt.executeQuery(maxbhsql);
//			 int maxbh = rs5.getInt("M");
//			 maxbh++;
//	    	String sql6 = "insert into T_FILESYSTEM values("+maxbh+","+bh+",'"+fi.getName()+"','"+fi.getTotal()+"','"+fi.getUsed()+"','"+fi.getPercent()+"')";
//	    	stmt.executeUpdate(sql6);
//	    }
//	    
//
//}
//}
//
