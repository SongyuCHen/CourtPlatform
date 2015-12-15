package nju.software.courtplatform.help;

import java.util.List;

import nju.software.courtplatform.model.TModule;

public class MenuContext {

	private TModule currentModel;
	private List<TModule> subModels; 
	
	
	public TModule getCurrentModel() {
		return currentModel;
	}
	public void setCurrentModel(TModule currentModel) {
		this.currentModel = currentModel;
	}
	public List<TModule> getSubModels() {
		return subModels;
	}
	public void setSubModels(List<TModule> subModels) {
		this.subModels = subModels;
	}
	
	
}
