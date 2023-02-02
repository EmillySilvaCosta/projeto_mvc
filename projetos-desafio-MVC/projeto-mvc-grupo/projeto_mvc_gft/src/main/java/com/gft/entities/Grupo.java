package com.gft.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tb_grupo")
public class Grupo implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id_grupo;
	
	private String nome;
	
	@OneToMany
	private List<Participante> participantes = new ArrayList<>();
	
	@ManyToOne
	private Evento evento;

	private int numIntegrantes;

	private boolean status;

	public int getNumIntegrantes() {
		return numIntegrantes;
	}

	public void setNumIntegrantes() {
		this.numIntegrantes +=1;
	}

	public void setMenosNumIntegrantes() {
		this.numIntegrantes -=1;
	}

	public Evento getEvento() {
		return evento;
	}
	
	public void setEvento(Evento evento) {
		this.evento = evento;
	}
	
	public Long getId_grupo() {
		return id_grupo;
	}


	public void setId_grupo(Long id_grupo) {
		this.id_grupo = id_grupo;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Participante> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Participante> participantes) {
		this.participantes = participantes;
	}

	public void setParticipantesNaLista(Participante participante) {
		participantes.add(participante);
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public int calculaQuantidadeDeParticipantesNoGrupo() {
		return participantes.size();
	}
	
}
