package com.gft.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tb_evento")
public class Evento implements Serializable {
    
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_evento;
   
	private String nome;
   
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataInicio;
    
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dataFinal;
  
	@OneToMany(mappedBy = "evento")
    private List<Grupo> grupos;
    
	@OneToMany
	//@JoinColumn(name = "id_atividade")
    private List<Atividade> atividades;
    
	private boolean status;
	
	private double pontosAtribuidosCadaPresenca = 10;
	
	private double pontosDescontadosCadaAtraso = 2;

	public int totalDiasDoEvento() {
	
		//long days = Math.abs(this.dataFinal.getTime() - this.dataInicio.getTime());
		//int total = (int) days;
		
		return 4;
	}
	public Long getId_evento() {
		return id_evento;
	}

	public void setId_evento(Long id_evento) {
		this.id_evento = id_evento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public List<Grupo> getGrupos() {
		return grupos;
	}

	public void setGrupos(List<Grupo> grupos) {
		this.grupos = grupos;
	}

	public List<Atividade> getAtividades() {
		return atividades;
	}

	public void setAtividades(List<Atividade> atividades) {
		this.atividades = atividades;
	}

	public void setAtividadeNaLista(Atividade atividade) {
		this.atividades.add(atividade);
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public double getPontosAtribuidosCadaPresenca() {
		return pontosAtribuidosCadaPresenca;
	}
	public void setPontosAtribuidosCadaPresenca(double pontosAtribuidosCadaPresenca) {
		this.pontosAtribuidosCadaPresenca = pontosAtribuidosCadaPresenca;
	}
	public double getPontosDescontadosCadaAtraso() {
		return pontosDescontadosCadaAtraso;
	}
	public void setPontosDescontadosCadaAtraso(double pontosDescontadosCadaAtraso) {
		this.pontosDescontadosCadaAtraso = pontosDescontadosCadaAtraso;
	}	
	
}