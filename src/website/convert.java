package website;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class convert{
	public static java.sql.Timestamp normalizedate(String a) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("MM dd, yyyy HH:mm");
		
		switch (a.substring(0,3)) {
		case "Jan" : a="01 "+a.substring(4,a.length()); break;
		case "Feb" : a="02 "+a.substring(4,a.length()); break;
		case "Mar" : a="03 "+a.substring(4,a.length()); break;
		case "Apr" : a="04 "+a.substring(4,a.length()); break;
		case "May" : a="05 "+a.substring(4,a.length()); break;
		case "Jun" : a="06 "+a.substring(4,a.length()); break;
		case "Jul" : a="07 "+a.substring(4,a.length()); break;
		case "Aug" : a="08 "+a.substring(4,a.length()); break;
		case "Sep" : a="09 "+a.substring(4,a.length()); break;
		case "Oct" : a="10 "+a.substring(4,a.length()); break;
		case "Nov" : a="11 "+a.substring(4,a.length()); break;
		case "Dec'": a="12 "+a.substring(4,a.length()); break;
		default:
			break;
		}
		if(a.substring(a.length()-2,a.length()).equals("PM")) {
			a = a.substring(0, a.length()-3);
			int b = (Integer.parseInt(a.substring(a.length()-5,a.length()-3))+12);
			int c = (Integer.parseInt(a.substring(a.length()-2, a.length())));
			System.out.println(c);
			if(Math.abs(c-30)<15) c=30;
			else if(c<=15) c=0;
			else {
				b+=1;
				c=0;
			}
			if(b==12)b--;
			a = a.substring(0, a.length()-6)+" "+b+":"+c;
		}else {
			a = a.substring(0, a.length()-3);
			int b = Integer.parseInt(a.substring(a.length()-5,a.length()-3));
			int c = (Integer.parseInt(a.substring(a.length()-2,a.length())));
			System.out.println(c);
			if(Math.abs(c-30)<=15) c=30;
			else if(c<15) c=0;
			else {
				b+=1;
				c=0;
			}
			a = a.substring(0, a.length()-6)+" "+b+":"+c;
		}
		java.sql.Timestamp time = new Timestamp(formatter.parse(a).getTime());
		return time;
	}
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws ParseException {
		System.out.println(normalizedate("Mar 18, 2019 10:50 PM").toString());
	}
}