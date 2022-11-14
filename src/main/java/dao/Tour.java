import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Tour {
	Dao dao =null;

	String type = "";
	int index =0;
	List<String> name_data;
	List<String> address_data;
	
	public Tour()
	{
		if(this.dao==null)
		{
			this.dao = new Dao();
		}	
	}
	
	public void create_data_table()
	{
		if(this.dao==null)
		{
			this.dao = new Dao();

		}	
		dao.create_tour_list();
	}

	
	public void all_data_to_table()
	{
		data_to_table_by_type("전시관");
		data_to_table_by_type("동물원");
		data_to_table_by_type("식물원");
		data_to_table_by_type("생태관광지");

	}
	
	public void data_to_table_by_type(String type)
	{
		this.type = type;
		this.index=1;
		while(Data_manage())
		{
			this.index++;
		}
	}

	public boolean Data_manage()
	{

		if(index<0)
		{
			System.out.println("index값이 잘못 설정되어 있습니다");
		}
		else if(type.equals(""))
		{
			System.out.println("type값이 잘못 설정되어 있습니다");
		}
		
		String name_vname = "";
		String address_vname ="";

		switch(type)
		{
		case "전시관":
			name_vname="명칭";
			address_vname="소재지";
			break;
		case "동물원":
			name_vname="동물원명";
			address_vname="소재지";
			break;
		case "식물원":
			name_vname="명칭";
			address_vname="소재지";
			break;
		case "생태관광지":
			name_vname="생태관광지명";
			address_vname="주소";
			break;
		default:
			System.out.println("type값이 잘못 설정되어 있습니다");
			return false;
		}


		String Json_str = Json_get();

		System.out.println(Json_str);

		try {
			JSONParser json_parser =new JSONParser();
			JSONObject json_obj = (JSONObject)json_parser.parse(Json_str);

			JSONArray arrs = (JSONArray) json_obj.get("data");


			if(arrs.size()==0)
			{
				return false;

			}

			if(name_data!=null)
			{
				this.name_data.clear();
				this.address_data.clear();
			}
			else
			{
				this.name_data =new ArrayList<String>();
				this.address_data =new ArrayList<String>();
			}
			

			
			

			for(int i=0;i<arrs.size();i++)
			{
				JSONObject index_cursor =	(JSONObject) arrs.get(i) ;
				name_data.add(index_cursor.get(name_vname).toString());	
				address_data.add(index_cursor.get(address_vname).toString());		
			}
			
		
			// 데이터 테이블에 넣어 주기
			if(this.dao==null)
			{
				this.dao = new Dao();

			}	
			dao.insert_tour_list(name_data,address_data);
			return true;


			//boolean 넣어준게 있냐 없냐
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		    System.out.println("예기치 못한 오류로 중단 되었습니다");
			return false;

		}
	}




	public String Json_get()
	{
		String return_val ="" ;




		try {
			StringBuilder urlBuilder = new  StringBuilder("https://api.odcloud.kr/api/");
			switch(type)
			{
			case "전시관":
				urlBuilder.append("15056260/v1/uddi:20cfca5c-3a7d-4d57-be66-fb630586498a"); 

				break;
			case "동물원":
				urlBuilder.append("15103124/v1/uddi:5f4f991c-82d0-43fa-9162-e72b8e6fbaca");

				break;
			case "식물원":
				urlBuilder.append("15056259/v1/uddi:ad6b52df-04ff-40b1-9f82-c5b648c029ba");

				break;
			case "생태관광지":
				urlBuilder.append("3082755/v1/uddi:b6583002-70ef-4374-a3bc-f4f73ac78e53"); 

				break;
			}
			urlBuilder.append("?" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(index+"", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*페이지 번호*/
			urlBuilder.append("&" + URLEncoder.encode("serviceKey","UTF-8") +"="+ "0Cqbm49R2xOkEgBZbtvHoHzSm90gr7KfXX%2BO3iDvI2LSVPkbbrAV8BWdseHx8Egn12mmx8iYbmhgUgnK9de9JA%3D%3D"); /*Service Key*/

			URL url;


			url = new URL(urlBuilder.toString());
			System.out.println("url="+urlBuilder.toString());

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			return_val = sb.toString();
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return return_val;
	}


}
