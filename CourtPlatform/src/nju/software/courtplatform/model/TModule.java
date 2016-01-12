package nju.software.courtplatform.model;

public class TModule
{
	private int bh;
	
	private Integer levels;
	
	private String name;
	
	private String c_url;
	
	private String c_img;
	
	private Integer parent;
	
	private Integer xssx;

	public int getBh()
	{
		return bh;
	}

	public void setBh(int bh)
	{
		this.bh = bh;
	}

	public Integer getLevels()
	{
		return levels;
	}

	public void setLevels(Integer levels)
	{
		this.levels = levels;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getC_url()
	{
		return c_url;
	}

	public void setC_url(String c_url)
	{
		this.c_url = c_url;
	}

	public Integer getParent()
	{
		return parent;
	}

	public void setParent(Integer parent)
	{
		this.parent = parent;
	}

	public Integer getXssx()
	{
		return xssx;
	}

	public void setXssx(Integer xssx)
	{
		this.xssx = xssx;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
	
}
