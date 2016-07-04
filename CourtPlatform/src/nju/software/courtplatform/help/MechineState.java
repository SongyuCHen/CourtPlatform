package nju.software.courtplatform.help;

import java.util.ArrayList;
import java.util.List;

import nju.software.courtplatform.model.CPUInfo;
import nju.software.courtplatform.model.FileSystem;
import nju.software.courtplatform.model.MemoryInfo;
import nju.software.courtplatform.model.SystemInfo;


public class MechineState {
	private CPUInfo cpuInfo;
	private MemoryInfo memoryInfo;
	private SystemInfo systemInfo;
	private List<FileSystem> fileSystems;
	public CPUInfo getCpuInfo() {
		return cpuInfo;
	}
	public void setCpuInfo(CPUInfo cpuInfo) {
		this.cpuInfo = cpuInfo;
	}
	public MemoryInfo getMemoryInfo() {
		return memoryInfo;
	}
	public void setMemoryInfo(MemoryInfo memoryInfo) {
		this.memoryInfo = memoryInfo;
	}
	public SystemInfo getSystemInfo() {
		return systemInfo;
	}
	public void setSystemInfo(SystemInfo systemInfo) {
		this.systemInfo = systemInfo;
	}
	public List<FileSystem> getFileSystems() {
		return fileSystems;
	}
	public void setFileSystems(List<FileSystem> fileSystems) {
		this.fileSystems = fileSystems;
	}
}
