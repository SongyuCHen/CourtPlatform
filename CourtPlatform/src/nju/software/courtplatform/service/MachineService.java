package nju.software.courtplatform.service;

import nju.software.courtplatform.dao.ModuleDao;
import nju.software.courtplatform.help.CPUInfo;
import nju.software.courtplatform.help.FileSystemInfo;
import nju.software.courtplatform.help.MechineState;
import nju.software.courtplatform.help.MemoryInfo;
import nju.software.courtplatform.help.SystemInfo;

import java.util.ArrayList;

import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.FileSystem;
import org.hyperic.sigar.FileSystemUsage;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.OperatingSystem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MachineService extends BaseService{
	
	@Autowired
	private ModuleDao md;
	
	/**
	 * 根据路径得到服务器环境
	 * @param url    e.g.  app/business
	 * @return
	 * @throws SigarException 
	 */
	public MechineState getMechineState(String url) throws SigarException{
		MechineState ms = new MechineState();
		
		CPUInfo cpuInfo = new CPUInfo();
		ArrayList<FileSystemInfo> fileSystemInfos = new ArrayList<FileSystemInfo>();
		MemoryInfo mInfo = new MemoryInfo();
		SystemInfo sInfo = new SystemInfo();
		
		Sigar sigar = new Sigar();
		
		cpuInfo.setCPUnum(sigar.getCpuInfoList().length);
		CpuInfo info = sigar.getCpuInfoList()[0];
		cpuInfo.setRate(info.getMhz()+"MHz");
		cpuInfo.setVender(info.getVendor());
		cpuInfo.setModel(info.getModel());
		cpuInfo.setCache(info.getCacheSize()+"KB");
		ms.setCpuInfo(cpuInfo);
		
		FileSystem fslist[] = sigar.getFileSystemList();
		for (int i = 0; i < fslist.length; i++) {
			FileSystem fs = fslist[i];
			FileSystemInfo fsi = new FileSystemInfo();
			fsi.setName(fs.getDevName());
			FileSystemUsage usage = null;
            try {
               usage = sigar.getFileSystemUsage(fs.getDirName());
            } catch (SigarException e) {
               if (fs.getType() == 2)
                   throw e;
               continue;
            }
            switch (fs.getType()) {
            case 0: // TYPE_UNKNOWN ：未知
               break;
            case 1: // TYPE_NONE
               break;
            case 2: // TYPE_LOCAL_DISK : 本地硬盘
               fsi.setTotal(usage.getTotal()+"KB");
               fsi.setUsed(usage.getUsed()+"KB");
               double usePercent = usage.getUsePercent() * 100D;
               fsi.setPercent(usePercent+"%");
               break;
            case 3:// TYPE_NETWORK ：网络
               break;
            case 4:// TYPE_RAM_DISK ：闪存
               break;
            case 5:// TYPE_CDROM ：光驱
               break;
            case 6:// TYPE_SWAP ：页面交换
               break;
            }
            fileSystemInfos.add(fsi);
		}
		System.err.println("size:"+fileSystemInfos.size());
		ms.setFileSystems(fileSystemInfos);
		
		Mem mem = sigar.getMem();
		mInfo.setMemTotal(mem.getTotal() / 1024L + "KB");
		mInfo.setMemUsed(mem.getUsed() / 1024L + "KB");
		mInfo.setMemNotUsed(mem.getFree() / 1024L + "KB");
		ms.setMemoryInfo(mInfo);
		
		OperatingSystem OS = OperatingSystem.getInstance();
		sInfo.setArch(OS.getArch());
		sInfo.setName(OS.getName());
		sInfo.setVender(OS.getVendor());
		sInfo.setVersion(OS.getVersion());
		ms.setSystemInfo(sInfo);
		return ms;
	}
}
