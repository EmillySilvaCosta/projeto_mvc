package com.gft.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gft.entities.Atividade;
import com.gft.entities.Evento;
import com.gft.entities.Grupo;
import com.gft.entities.Participante;
import com.gft.repositories.EventoRepository;

@Service
public class EventoService {
    @Autowired
    private EventoRepository eventoRepository;

    //Salvar
    public Evento salvarEvento(Evento evento){
        return eventoRepository.save(evento);
    }

    //Listar todos
    public List<Evento> listarTodosOsEventos(){
        List<Evento> eventos = new ArrayList<>();
        for (Evento evento : eventoRepository.findAll()) {
            if(evento.isStatus() !=false){
                eventos.add(evento);
            }
        }
        return eventos;
    }

    public List<Participante> listarTodosOsParticipantesDosGruposDoEvento(Long id) throws Exception{
        Evento evento = obterEvento(id);
        List<Participante> listaParticipantes = new ArrayList<Participante>();
        List<Grupo> grupos = evento.getGrupos();
        for (Grupo grupo : grupos) {
            if(grupo.getStatus() != false){
                var participantes = grupo.getParticipantes();
                for (Participante participante : participantes) {
                    if(participante.isStatus() != false){
                        listaParticipantes.add(participante);
                    }
                }
            }
        }
        return listaParticipantes;
    }

    public List<Atividade> listarTodosAsAtividadesDoEvento(Long id){
        Optional<Evento> eventos = eventoRepository.findById(id);
        List<Atividade> list = new ArrayList<>();
        var evento = eventos.get();
        for (Atividade atividade : evento.getAtividades()) {
            if(atividade.isStatus() !=false){
                list.add(atividade);
            }
        }
        return list;
    }

    //Listar por Nome
    public List<Evento> listarPorNomeEvento(String nome){
        if(nome!= null){
            return eventoRepository.findByNomeContains(nome);
        }
        return listarTodosOsEventos();
        
    }

    //Obter 
    public Evento obterEvento(Long id) throws Exception{
        Optional<Evento> evento = eventoRepository.findById(id);
        if(evento.isEmpty()){
            throw new Exception("Evento não encontrado");
        }
        return evento.get();
    }

    //Excluir
    public void excluirEvento(Long id) throws Exception{
        //eventoRepository.deleteById(id);
        Evento evento = obterEvento(id);
        for (Grupo grupo : evento.getGrupos()) {
            grupo.setStatus(false);
            for (Participante participante : grupo.getParticipantes()) {
                participante.setStatus(false);
            }
        }
        evento.setStatus(false);
        eventoRepository.save(evento);
    }

    public List<Grupo> listarGrupos(Long id) throws Exception {
        Evento evento = obterEvento(id);
        List<Grupo> grupos = new ArrayList<>();
        for (Grupo grupo : evento.getGrupos()) {
            if(grupo.getStatus() != false){
                grupos.add(grupo);
            }
        }
        return grupos;
    }
}
