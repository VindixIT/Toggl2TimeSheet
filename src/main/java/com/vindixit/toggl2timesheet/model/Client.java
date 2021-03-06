package com.vindixit.toggl2timesheet.model;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class Client {

    private Long id;
    private String name;
    private String hourly_rate;
    private String currency;
    private Workspace workspace;
    private String notes;

    public Client() {
    }

    public Client(String jsonString) {
        JSONObject object = (JSONObject) JSONValue.parse(jsonString);
        this.id = (Long) object.get("id");
        this.name = (String) object.get("name");
        Object hrate = object.get("hrate");
        if (hrate != null) {
        	this.hourly_rate = hrate.toString();
        }
        this.currency = (String) object.get("cur");
        this.notes = (String) object.get("notes");

        JSONObject workspaceObject = (JSONObject) object.get("workspace");
        if (workspaceObject != null) {
            this.workspace = new Workspace(workspaceObject.toJSONString());
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getHourly_rate() {
        return hourly_rate;
    }

    public void setHourly_rate(String hourly_rate) {
        this.hourly_rate = hourly_rate;
    }
    
    public String getNotes() {
		return notes;
	}
    
    public void setNotes(String notes) {
		this.notes = notes;
	}

    public Workspace getWorkspace() {
        return workspace;
    }

    public void setWorkspace(Workspace workspace) {
        this.workspace = workspace;
    }

    public JSONObject toJSONObject() {
        JSONObject object = new JSONObject();
        if (id != null) {
            object.put("id", id);
        }
        if (name != null) {
            object.put("name", name);
        }
        if (hourly_rate != null) {
            object.put("hrate", hourly_rate);
        }
        if (currency != null) {
            object.put("cur", currency);
        }
        if (notes != null) {
        	object.put("notes", notes);
        }

        if (workspace != null) {
            object.put("workspace", this.workspace.toJSONObject());
            object.put("wid", this.workspace.getId());
        }

        return object;
    }

    public String toJSONString() {
        return this.toJSONObject().toJSONString();
    }

    @Override
    public String toString() {
        return "Client{" + "id=" + id + ", name=" + name + ", hourly_rate=" + hourly_rate + ", currency=" + currency + ", notes=" + notes + ", workspace=" + workspace + '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Client other = (Client) obj;
        if (this.id != other.id && (this.id == null || !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 71 * hash + (this.id != null ? this.id.hashCode() : 0);
        return hash;
    }
}
