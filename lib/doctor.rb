class Doctor
  
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def new_appointment(date, patient)
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