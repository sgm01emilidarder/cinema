package com.cinema.dto;

import java.time.LocalTime;
import java.util.Objects;

public class Session {
    private Film id;
    private LocalTime horaInici;
    private LocalTime horaFin;

    public Session(Film id, LocalTime horaInici, LocalTime horaFin) {
        this.id = id;
        this.horaInici = horaInici;
        this.horaFin = horaFin;
    }

    public Film getId() {
        return id;
    }

    public void setId(Film id) {
        this.id = id;
    }

    public LocalTime getHoraInici() {
        return horaInici;
    }

    public void setHoraInici(LocalTime horaInici) {
        this.horaInici = horaInici;
    }

    public LocalTime getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(LocalTime horaFin) {
        this.horaFin = horaFin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Session)) return false;
        Session session = (Session) o;
        return id.equals(session.id) &&
                horaInici.equals(session.horaInici);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, horaInici);
    }
}
