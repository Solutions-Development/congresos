class Model {
  List<Conferencistas> conferencistas;
  List<Evento> evento;
  List<Sede> sede;
  List<Congreso> congreso;

  Model({this.conferencistas, this.evento, this.sede, this.congreso});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['conferencistas'] != null) {
      conferencistas = new List<Conferencistas>();
      json['conferencistas'].forEach((v) {
        conferencistas.add(new Conferencistas.fromJson(v));
      });
    }
    if (json['evento'] != null) {
      evento = new List<Evento>();
      json['evento'].forEach((v) {
        evento.add(new Evento.fromJson(v));
      });
    }
    if (json['sede'] != null) {
      sede = new List<Sede>();
      json['sede'].forEach((v) {
        sede.add(new Sede.fromJson(v));
      });
    }
    if (json['congreso'] != null) {
      congreso = new List<Congreso>();
      json['congreso'].forEach((v) {
        congreso.add(new Congreso.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.conferencistas != null) {
      data['conferencistas'] =
          this.conferencistas.map((v) => v.toJson()).toList();
    }
    if (this.evento != null) {
      data['evento'] = this.evento.map((v) => v.toJson()).toList();
    }
    if (this.sede != null) {
      data['sede'] = this.sede.map((v) => v.toJson()).toList();
    }
    if (this.congreso != null) {
      data['congreso'] = this.congreso.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Conferencistas {
  String nombreConferencista;
  String cedula;
  String nacionalidad;
  String movil;
  String trabajo;
  String email;
  String estudioGrado;
  String especialidad;
  String subEspecialidad;
  String practica;
  String membresias;
  String hotelDestino;
  String hotelCheckIn;
  String hotelCheckOut;
  String hotelPersonas;
  String flightRound;
  String flightOne;
  String origin;
  String flightDepartureDate;
  String flightReturnDate;

  Conferencistas(
      {this.nombreConferencista,
      this.cedula,
      this.nacionalidad,
      this.movil,
      this.trabajo,
      this.email,
      this.estudioGrado,
      this.especialidad,
      this.subEspecialidad,
      this.practica,
      this.membresias,
      this.hotelDestino,
      this.hotelCheckIn,
      this.hotelCheckOut,
      this.hotelPersonas,
      this.flightRound,
      this.flightOne,
      this.origin,
      this.flightDepartureDate,
      this.flightReturnDate});

  Conferencistas.fromJson(Map<String, dynamic> json) {
    nombreConferencista = json['nombreConferencista'];
    cedula = json['cedula'];
    nacionalidad = json['nacionalidad'];
    movil = json['movil'];
    trabajo = json['trabajo'];
    email = json['email'];
    estudioGrado = json['estudioGrado'];
    especialidad = json['especialidad'];
    subEspecialidad = json['subEspecialidad'];
    practica = json['practica'];
    membresias = json['membresias'];
    hotelDestino = json['hotelDestino'];
    hotelCheckIn = json['hotelCheckIn'];
    hotelCheckOut = json['hotelCheckOut'];
    hotelPersonas = json['hotelPersonas'];
    flightRound = json['flightRound'];
    flightOne = json['flightOne'];
    origin = json['origin'];
    flightDepartureDate = json['flightDepartureDate'];
    flightReturnDate = json['flightReturnDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreConferencista'] = this.nombreConferencista;
    data['cedula'] = this.cedula;
    data['nacionalidad'] = this.nacionalidad;
    data['movil'] = this.movil;
    data['trabajo'] = this.trabajo;
    data['email'] = this.email;
    data['estudioGrado'] = this.estudioGrado;
    data['especialidad'] = this.especialidad;
    data['subEspecialidad'] = this.subEspecialidad;
    data['practica'] = this.practica;
    data['membresias'] = this.membresias;
    data['hotelDestino'] = this.hotelDestino;
    data['hotelCheckIn'] = this.hotelCheckIn;
    data['hotelCheckOut'] = this.hotelCheckOut;
    data['hotelPersonas'] = this.hotelPersonas;
    data['flightRound'] = this.flightRound;
    data['flightOne'] = this.flightOne;
    data['origin'] = this.origin;
    data['flightDepartureDate'] = this.flightDepartureDate;
    data['flightReturnDate'] = this.flightReturnDate;
    return data;
  }
}

class Evento {
  String nombreEvento;
  String fechaEvento;
  String horaEvento;
  String sedeEvento;
  String locacionEvento;
  String tipoEvento;
  String conferencista;
  String eventoDestinado;

  Evento(
      {this.nombreEvento,
      this.fechaEvento,
      this.horaEvento,
      this.sedeEvento,
      this.locacionEvento,
      this.tipoEvento,
      this.conferencista,
      this.eventoDestinado});

  Evento.fromJson(Map<String, dynamic> json) {
    nombreEvento = json['nombreEvento'];
    fechaEvento = json['fechaEvento'];
    horaEvento = json['horaEvento'];
    sedeEvento = json['sedeEvento'];
    locacionEvento = json['locacionEvento'];
    tipoEvento = json['tipoEvento'];
    conferencista = json['conferencista'];
    eventoDestinado = json['eventoDestinado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreEvento'] = this.nombreEvento;
    data['fechaEvento'] = this.fechaEvento;
    data['horaEvento'] = this.horaEvento;
    data['sedeEvento'] = this.sedeEvento;
    data['locacionEvento'] = this.locacionEvento;
    data['tipoEvento'] = this.tipoEvento;
    data['conferencista'] = this.conferencista;
    data['eventoDestinado'] = this.eventoDestinado;
    return data;
  }
}

class Sede {
  String nombreSede;
  String ubicacionSede;
  String direccionSede;
  String cantidadSalones;

  Sede(
      {this.nombreSede,
      this.ubicacionSede,
      this.direccionSede,
      this.cantidadSalones});

  Sede.fromJson(Map<String, dynamic> json) {
    nombreSede = json['nombreSede'];
    ubicacionSede = json['ubicacionSede'];
    direccionSede = json['direccionSede'];
    cantidadSalones = json['cantidadSalones'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreSede'] = this.nombreSede;
    data['ubicacionSede'] = this.ubicacionSede;
    data['direccionSede'] = this.direccionSede;
    data['cantidadSalones'] = this.cantidadSalones;
    return data;
  }
}

class Congreso {
  String nombreCongreso;
  String fechaCongreso;
  String sede;

  Congreso({this.nombreCongreso, this.fechaCongreso, this.sede});

  Congreso.fromJson(Map<String, dynamic> json) {
    nombreCongreso = json['nombreCongreso'];
    fechaCongreso = json['fechaCongreso'];
    sede = json['sede'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreCongreso'] = this.nombreCongreso;
    data['fechaCongreso'] = this.fechaCongreso;
    data['sede'] = this.sede;
    return data;
  }
}
