package cf.yul.apoint.function;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class GetClientComputerInfo {
	public String[] findClientComputerName(HttpServletRequest request) {
	    String computerName = null;
	    String remoteAddress = request.getRemoteAddr();
	    String [] userinfo = new String [3];
//	    System.out.println("remoteAddress: " + remoteAddress);
	    userinfo[0] = remoteAddress;
	    try {
	        InetAddress inetAddress = InetAddress.getByName(remoteAddress);
//	        System.out.println("inetAddress: " + inetAddress);
	        userinfo[1] = inetAddress.toString();
	        computerName = inetAddress.getHostName();
//	        System.out.println("computerName: " + computerName);
	        userinfo[2] = computerName;
	        if (computerName.equalsIgnoreCase("localhost")) {
	            computerName = java.net.InetAddress.getLocalHost().getCanonicalHostName();
	            System.out.println(computerName);
	        } 
	        return userinfo;
	    } catch (UnknownHostException e) {
	    	return null;
	    }
	}
	
	private String getHostName (InetAddress inaHost) throws UnknownHostException
    {
       try
       {
           Class clazz = Class.forName("java.net.InetAddress");
           Constructor[] constructors = clazz.getDeclaredConstructors();
           constructors[0].setAccessible(true);
           InetAddress ina = (InetAddress) constructors[0].newInstance();

           Field[] fields = ina.getClass().getDeclaredFields();
           for (Field field: fields)
           {
               if (field.getName().equals("nameService"))
               {
                   field.setAccessible(true);
                   Method[] methods = field.get(null).getClass().getDeclaredMethods();
                   for (Method method: methods)
                   {
                        if (method.getName().equals("getHostByAddr"))
                        {
                            method.setAccessible(true);
                            return (String) method.invoke(field.get (null), inaHost.getAddress());
                        }
                   }
               }
           }
       } catch (Exception e) {
       } 
       return null;
    }
	
	
}
