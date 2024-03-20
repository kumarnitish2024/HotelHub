
void main(){
  Map<String, dynamic> allStatesName = {
    "allstates": [
      "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
      "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka",
      "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram",
      "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana",
      "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal"
    ],
    "Andhra Pradesh": ["Visakhapatnam", "Vijayawada", "Guntur", "Nellore", "Kurnool", "Rajahmundry",],

    "Arunachal Pradesh": [
      "Itanagar", "Tawang", "Naharlagun", "Ziro", "Pasighat", "Other Cities in Arunachal Pradesh"
    ],

    "Assam": [
      "Guwahati", "Dibrugarh", "Silchar", "Tezpur", "Jorhat", "Other Cities in Assam"
    ],

    "Bihar": [
      "Patna", "Chapra", "Gaya", "Muzaffarpur", "Darbhanga", "Other Cities in Bihar"
    ],

    "Chhattisgarh": [
      "Raipur", "Bhilai", "Bilaspur", "Korba", "Durg", "Raigarh", "Jagdalpur",
      "Ambikapur", "Rajnandgaon", "Champa", "Baloda Bazar", "Bhilai Charoda", "Mahasamund",
      "Kanker", "Baikunthpur", "Kawardha", "Dhamtari", "Bemetara", "Mungeli", "Janjgir",
      "Chirmiri", "Dongargarh", "Dalli-Rajhara", "Khairagarh", "Naila Janjgir",],

    "Goa": [
      "Panaji", "Vasco da Gama", "Margao", "Mapusa", "Ponda", "Curchorem", "Cuncolim",
      "Bicholim", "Sanquelim",],

    "Gujarat": [
      "Ahmedabad", "Surat", "Vadodara", "Rajkot", "Gandhinagar", "Bhavnagar",
      "Jamnagar",  "Anand", "Bharuch", "Mehsana",
      "Porbandar", "Other Cities in Gujarat"
    ],

    "Haryana": [
      "Chandigarh", "Faridabad", "Gurgaon", "Hisar", "Panipat", "Ambala",
      "Rohtak", "Karnal", "Sonipat", "Panchkula", "Yamunanagar", "Kurukshetra",
      "Other Cities in Haryana"
    ],

    "Himachal Pradesh": [
      "Shimla", "Mandi", "Dharamshala", "Solan", "Kullu", "Chamba", "Bilaspur",
      "Nahan", "Una", "Other Cities in Himachal Pradesh"
    ],

    "Jharkhand": [
      "Ranchi", "Jamshedpur", "Dhanbad", "Bokaro", "Deoghar", "Hazaribagh",
      "Dumka", "Giridih", "Ramgarh", "Other Cities in Jharkhand"
    ],

    "Karnataka": [
      "Bangalore", "Mysore", "Hubli-Dharwad", "Mangalore", "Belgaum", "Gulbarga",
      "Davanagere", "Bellary", "Bijapur", "Shimoga", "Tumkur", "Other Cities in Karnataka"
    ],
    "Kerala": [
      "Thiruvananthapuram", "Kochi", "Kozhikode", "Kollam", "Thrissur", "Alappuzha",
      "Kottayam", "Palakkad", "Malappuram", "Kannur", "Other Cities in Kerala"
    ],

    "Madhya Pradesh": [
      "Bhopal", "Indore", "Jabalpur", "Gwalior", "Ujjain",
      "Satna", "Ratlam", "Rewa", "Other Cities in Madhya Pradesh"
    ],

    "Maharashtra": [
      "Mumbai", "Pune", "Nagpur", "Thane", "Nashik", "Kalyan-Dombivali",
      "Vasai-Virar", "Aurangabad", "Solapur", "Bhiwandi", "Amravati", "Other Cities in Maharashtra"
    ],

    "Manipur": [
      "Imphal", "Thoubal", "Bishnupur", "Churachandpur", "Senapati", "Ukhrul",
      "Other Cities in Manipur"
    ],

    "Meghalaya": [
      "Shillong", "Tura", "Jowai", "Nongstoin", "Williamnagar", "Other Cities in Meghalaya"
    ],

    "Mizoram": [
      "Aizawl", "Lunglei", "Saiha", "Champhai", "Kolasib", "Serchhip",
      "Other Cities in Mizoram"
    ],

    "Nagaland": [
      "Kohima", "Dimapur", "Mokokchung", "Tuensang", "Wokha", "Mon",
      "Other Cities in Nagaland"
    ],

    "Odisha": [
      "Bhubaneswar", "Cuttack", "Rourkela", "Berhampur", "Sambalpur", "Puri",
      "Balasore", "Bhadrak", "Baripada", "Jharsuguda", "Other Cities in Odisha"
    ],

    "Punjab": [
      "Ludhiana", "Amritsar", "Jalandhar", "Patiala", "Bathinda", "Hoshiarpur",
      "Mohali", "Batala", "Pathankot", "Moga", "Other Cities in Punjab"
    ],

    "Rajasthan": [
      "Jaipur", "Jodhpur", "Kota", "Bikaner", "Ajmer", "Udaipur", "Bhilwara",
      "Alwar", "Bharatpur", "Sikar", "Other Cities in Rajasthan"
    ],

    "Sikkim": [
      "Gangtok", "Namchi", "Mangan", "Gyalshing", "Singtam", "Other Cities in Sikkim"
    ],

    "Tamil Nadu": [
      "Chennai", "Coimbatore", "Madurai", "Tiruchirappalli", "Salem", "Tirunelveli",
      "Thoothukudi", "Nagercoil", "Other Cities in Tamil Nadu"
    ],

    "Telangana": [
      "Hyderabad", "Warangal", "Nizamabad", "Khammam", "Karimnagar", "Ramagundam",
      "Other Cities in Telangana"
    ],

    "Tripura": [
      "Agartala", "Udaipur", "Dharmanagar", "Kailasahar", "Ambassa",
      "Other Cities in Tripura"
    ],

    "Uttar Pradesh": [
      "Lucknow", "Kanpur", "Ghaziabad", "Agra", "Varanasi", "Meerut", "Allahabad",
      "Bareilly", "Aligarh", "Moradabad", "Other Cities in Uttar Pradesh"
    ],

    "Uttarakhand": [
      "Dehradun", "Haridwar", "Roorkee", "Haldwani", "Rudrapur", "Kashipur",
      "Rishikesh", "Nainital", "Other Cities in Uttarakhand"
    ],

    "West Bengal": [
      "Kolkata", "Howrah", "Asansol", "Siliguri", "Durgapur", "Bardhaman",
      "Malda", "Baharampur", "Other Cities in West Bengal"
    ]

  };
  List length =allStatesName["allstates"].length;
  print(length);
}


