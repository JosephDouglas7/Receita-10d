abstract class JsonObject {
  void fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}

class Beer implements JsonObject {
  String name, style, ibu;
  Beer({this.name = '', this.style = '', this.ibu = ''});
  
  Beer.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        style = json['style'] ?? '',
        ibu = json['ibu'] ?? '';
        
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['style'] = this.style;
    data['ibu'] = this.ibu;
    return data;
  }
  
  @override
  void fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? name;
    style = json['style'] ?? style;
    ibu = json['ibu'] ?? ibu;
  }
}

class Coffee implements JsonObject {
  String blendName, origin, variety;
  Coffee({this.blendName = '', this.origin = '', this.variety = ''});
  
  Coffee.fromJson(Map<String, dynamic> json)
      : blendName = json['blend_name'] ?? '',
        origin = json['origin'] ?? '',
        variety = json['variety'] ?? '';
        
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['blend_name'] = this.blendName;
    data['origin'] = this.origin;
    data['variety'] = this.variety;
    return data;
  }
  
  @override
  void fromJson(Map<String, dynamic> json) {
    blendName = json['blend_name'] ?? blendName;
    origin = json['origin'] ?? origin;
    variety = json['variety'] ?? variety;
  }
}

class Nation implements JsonObject {
  String nationality, capital, language, nationalSport;
  Nation({this.nationality = '', this.capital = '', this.language = '', this.nationalSport = ''});
  
  Nation.fromJson(Map<String, dynamic> json)
      : nationality = json['nationality'] ?? '',
        capital = json['capital'] ?? '',
        language = json['language'] ?? '',
        nationalSport = json['national_sport'] ?? '';
        
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['nationality'] = this.nationality;
    data['capital'] = this.capital;
    data['language'] = this.language;
    data['national_sport'] = this.nationalSport;
    return data;
  }
  
  @override
  void fromJson(Map<String, dynamic> json) {
    nationality = json['nationality'] ?? nationality;
    capital = json['capital'] ?? capital;
    language = json['language'] ?? language;
    nationalSport = json['national_sport'] ?? nationalSport;
  }
}

class DataService {
  // Simulação de requisição à API
  Future<List<T>> fetchData<T extends JsonObject>(String endpoint, T Function(Map<String, dynamic>) create) async {
    // Aqui você faria a requisição à API e obteria a resposta em JSON
    final response = [
      {'name': 'Lager', 'style': 'Pilsner', 'ibu': '20'},
      {'blend_name': 'Espresso', 'origin': 'Brazil', 'variety': 'Arabica'},
      {'nationality': 'Brazilian', 'capital': 'Brasilia', 'language': 'Portuguese', 'national_sport': 'Football'}
    ];
    
    return response.map((json) => create(json)).toList();
  }
  
  // Exemplos de uso
  Future<List<Beer>> fetchBeers() async {
    return fetchData<Beer>('beers', (json) => Beer.fromJson(json));
  }

  Future<List<Coffee>> fetchCoffees() async {
    return fetchData<Coffee>('coffees', (json) => Coffee.fromJson(json));
  }

  Future<List<Nation>> fetchNations() async {
    return fetchData<Nation>('nations', (json) => Nation.fromJson(json));
  }
}
