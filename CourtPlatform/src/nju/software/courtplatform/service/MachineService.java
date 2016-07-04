package nju.software.courtplatform.service;

import nju.software.courtplatform.dao.ModuleDao;
import nju.software.courtplatform.dao.ServerDao;
import nju.software.courtplatform.help.MechineState;
import nju.software.courtplatform.model.CPUInfo;
import nju.software.courtplatform.model.FileSystem;
import nju.software.courtplatform.model.MemoryInfo;
import nju.software.courtplatform.model.SystemInfo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MachineService extends BaseService{
	
	@Autowired
	private ServerDao sd;
	
	/**
	 * 根据路径得到服务器环境
	 * @param url    e.g.  app/business
	 * @return
	 * @throws SigarException 
	 */
	public MechineState getMechineState(int bh){
		MechineState ms = new MechineState();
		
		CPUInfo cpuInfo = sd.getCPUInfo(bh);
		List<FileSystem> fileSystemInfos = sd.getFileSystem(bh);
		MemoryInfo mInfo = sd.getMemoryInfo(bh);
		SystemInfo sInfo = sd.getSystemInfo(bh);
		
		ms.setCpuInfo(cpuInfo);
		ms.setFileSystems(fileSystemInfos);
		ms.setMemoryInfo(mInfo);
		ms.setSystemInfo(sInfo);		
		
		return ms;
	}
}
