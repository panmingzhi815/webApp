package org.pan.bean;

import javax.persistence.Entity;
import java.util.Date;

/**
 * Created by Administrator on 2016/6/5.
 */
@Entity
public class SystemUser extends AbstractObject{

    private String username;
    private String nikeName;
    private String email;
    private String password;
    private Date date;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNikeName() {
        return nikeName;
    }

    public void setNikeName(String nikeName) {
        this.nikeName = nikeName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
