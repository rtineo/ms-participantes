package com.ms.participantes.client;

import org.springframework.cloud.openfeign.FeignClient;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.ms.participantes.dto.EventoRequest;

//@FeignClient(name = "eventos", url = "http://ms-eventos:9081") // URL del microservicio de eventos
@FeignClient(name = "ms-eventos") // URL del microservicio de eventos
public interface EventoClient { 
     

    @GetMapping("/eventos/{id}")
    public EventoRequest getEvento(@PathVariable("id") Long idEvento);
}
