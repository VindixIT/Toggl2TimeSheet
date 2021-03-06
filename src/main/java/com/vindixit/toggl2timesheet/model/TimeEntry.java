package com.vindixit.toggl2timesheet.model;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.vindixit.toggl2timesheet.model.Project;
import com.vindixit.toggl2timesheet.model.Workspace;
import com.vindixit.toggl2timesheet.util.DateUtil;;

public abstract class TimeEntry {

    private Long id;
    protected String description;
    private Project project;
    protected Date start;
    protected Date stop;
    protected long duration;
    private Boolean billable;
    private Workspace workspace;
    private List<String> tag_names = new ArrayList<String>();	
    private String created_with;
    private Boolean duronly;
	private Long pid;
	private Long wid;
	private Long tid;

    public TimeEntry() {
    }

    public TimeEntry(String jsonString) {
        JSONObject object = (JSONObject) JSONValue.parse(jsonString);
        this.id = (Long) object.get("id");
        this.description = (String) object.get("description");
        this.start = com.vindixit.toggl2timesheet.util.DateUtil.convertStringToDate((String) object.get("start"));
        this.stop = com.vindixit.toggl2timesheet.util.DateUtil.convertStringToDate((String) object.get("stop"));
        this.duration = (Long) object.get("duration");
        this.billable = (Boolean) object.get("billable");
        this.duronly = (Boolean) object.get("duronly");
        created_with = (String) object.get("created_with");
		this.pid = (Long) object.get("pid");
		this.wid = (Long) object.get("wid");
		this.tid = (Long) object.get("tid");


        JSONObject workspaceObject = (JSONObject) object.get("workspace");
        if (workspaceObject != null) {
            this.workspace = new Workspace(workspaceObject.toJSONString());
        }

        JSONObject projectObject = (JSONObject) object.get("project");
        if (projectObject != null) {
            this.project = new Project(projectObject.toJSONString());
        }
        // Tag names
        JSONArray tagsArray = (JSONArray) object.get("tags");
        List<String> tags = new ArrayList<String>();
        if (tagsArray != null) {
	        for (Object arrayObject : tagsArray) {
	            tags.add((String) arrayObject);
	        }
        }
        this.tag_names = tags;
    }

    public Boolean isBillable() {
        return billable;
    }

    public void setBillable(Boolean billable) {
        this.billable = billable;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDuration(long duration) {
        this.duration = duration;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public Boolean getDuronly() {
		return duronly;
	}
    
    public void setDuronly(Boolean duronly) {
		this.duronly = duronly;
	}

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
		this.pid = project.getId();
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public void setStop(Date stop) {
        this.stop = stop;
    }

    public List<String> getTag_names() {
        return tag_names;
    }

    public void setTag_names(List<String> tag_names) {
        this.tag_names = tag_names;
    }

    public Workspace getWorkspace() {
        return workspace;
    }

    public void setWorkspace(Workspace workspace) {
        this.workspace = workspace;
		this.wid = workspace.getId();
    }

    public String getCreated_with() {
        return created_with;
    }

    public void setCreated_with(String created_with) {
        this.created_with = created_with;
    }

	public Long getWid() {
		return wid;
	}

	public void setWid(Long wid) {
		this.wid = wid;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public Long getTid() {
		return tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

    public JSONObject toJSONObject() {
        JSONObject object = new JSONObject();
        if (billable != null) {
            object.put("billable", billable);
        }
        if (description != null) {
            object.put("description", description);
        }
        if (duration != 0) {
            object.put("duration", duration);
        }
        if (id != null) {
            object.put("id", id);
        }
        if (duronly != null) {
            object.put("duronly", duronly);
        }
        if (start != null) {
            object.put("start", DateUtil.convertDateToString(start));
        }
        if (stop != null) {
            object.put("stop", DateUtil.convertDateToString(stop));
        }
        if (created_with != null) {
            object.put("created_with", created_with);
        }

        if (!this.tag_names.isEmpty()) {
            JSONArray tag_names_arr = new JSONArray();
            tag_names_arr.addAll(this.tag_names);
            object.put("tags", tag_names_arr);
        }

        if (project != null) {
            object.put("project", this.project.toJSONObject());
        }
		if (pid != null) {
			object.put("pid", this.pid);
		}
        if (workspace != null) {
            object.put("workspace", this.workspace.toJSONObject());
        }
		if (wid != null) {
			object.put("wid", this.wid);
		}
		if (tid != null) {
			object.put("tid", this.tid);
		}
        return object;
    }
    
	public abstract String getDuration();

	public abstract String getStart();

	public abstract String getStop();
	
    public String toJSONString() {
        return this.toJSONObject().toJSONString();
    }

    @Override
    public String toString() {
		return "TimeEntry{" + "id=" + id + ", description=" + description + ", project=" + project + ", start=" + start + ", stop=" + stop + ", duration=" + duration + ", billable=" + billable + ", workspace=" + workspace + ", tag_names=" + tag_names + ", duronly=" + duronly + ", tid = " + tid + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final TimeEntry other = (TimeEntry) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 79 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }
}
