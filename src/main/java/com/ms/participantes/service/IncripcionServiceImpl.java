package com.ms.participantes.service;

import org.springframework.stereotype.Service;

import com.ms.participantes.client.EventoClient;
import com.ms.participantes.entities.Inscripcion;
import com.ms.participantes.repository.InscripcionRepository;
import com.ms.participantes.repository.ParticipanteRepository;
import com.ms.participantes.dto.EventoRequest;
import com.ms.participantes.excepciones.ParticipanteException;
import java.util.List;

import feign.FeignException;

@Service
public class IncripcionServiceImpl implements InscripcionService{
    
    private final InscripcionRepository inscripcionRepo;
    private final ParticipanteRepository participanteRepo;
    private final EventoClient eventoClient;

    public IncripcionServiceImpl(InscripcionRepository inscripcionRepo, ParticipanteRepository participanteRepo, EventoClient eventoClient) {
        this.inscripcionRepo = inscripcionRepo;
        this.participanteRepo = participanteRepo;
        this.eventoClient = eventoClient;
    }

    public Inscripcion inscribir(Long idParticipante, Long idEvento) {
        if (!participanteRepo.existsById(idParticipante)) {
            throw new ParticipanteException("Participante no existe");
        } 

        try {
            //eventoClient.existeEvento(idEvento);
            EventoRequest eventoEncontrado = eventoClient.getEvento(idEvento);
            
            if(eventoEncontrado != null){
                int inscritos = inscripcionRepo.countByIdEvento(idEvento);
                if (inscritos >= eventoEncontrado.getCapacidad()) {
                    throw new ParticipanteException("No hay vacantes para este evento");
                }
            }
        } catch (FeignException.NotFound e) {
            throw new ParticipanteException("Evento no existe");
        }


        // Verificar si ya existe la inscripción
        if (inscripcionRepo.existsByIdParticipanteAndIdEvento(idParticipante, idEvento)) {
            throw new ParticipanteException("Participante ya inscrito en este evento");
        }

        Inscripcion inscripcion = new Inscripcion();
        inscripcion.setIdParticipante(idParticipante);
        inscripcion.setIdEvento(idEvento);
 
        return  inscripcionRepo.save(inscripcion);
    }

    @Override
    public List<Inscripcion> obtenerInscripcionesPorParticipante(Long idParticipante){
        return inscripcionRepo.findByIdParticipante(idParticipante);
    }
}
