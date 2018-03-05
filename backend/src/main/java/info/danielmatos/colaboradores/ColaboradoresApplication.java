package info.danielmatos.colaboradores;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class ColaboradoresApplication {

	public static void main(String[] args) {
		SpringApplication.run(ColaboradoresApplication.class, args);
	}
}
