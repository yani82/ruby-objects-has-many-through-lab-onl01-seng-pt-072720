class Doctor
  
  @@all = []
  
  attr_reader :name
  
  def initialize(name)
    @name = name
    @patients = []
    @appointments = []
    @@all << self
  end
  
  def new_appointment(patient, date)
    appointment = Appointment.new(date, patient, self)
    appointment
  end
  
    def self.all
    @@all
  end
  
  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end
  
  def patients
    self.appointments.map do |appointment|
      appointment.patient
    end
  end
  
end