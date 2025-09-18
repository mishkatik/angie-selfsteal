.PHONY: start stop restart logs domain

start:
	docker compose up -d && docker compose logs -f -t

stop:
	docker compose down

restart:
	docker compose down && docker compose up -d

logs:
	docker compose logs -f -t

domain:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "❌ Укажи домен: make domain mysite.com"; \
		exit 1; \
	fi
	sed -i 's/server_name .*/server_name $(filter-out $@,$(MAKECMDGOALS));/' angie.conf
	@echo "✅ Домен заменён на: $(filter-out $@,$(MAKECMDGOALS))"
