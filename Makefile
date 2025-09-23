info: menu select

menu:
	echo "1 make reset           - flutter clean && flutter pub get"
	echo "2 make format          - dart format source code"
	echo "3 make test            - flutter test (all tests)"
	echo "4 make analyze         - flutter analyze"
	echo "5 make build           - flutter build web"
	echo "6 make run             - flutter run --debug"
	echo "7 make generate        - generate annotations.g.dart & builder.g.dart"
	echo "8 make update_phony    - update .PHONY in Makefile"

select:
	read -p ">>> " P ; make menu | grep "^$$P " | cut -d ' ' -f2-3 ; make menu | grep "^$$P " | cut -d ' ' -f2-3 | bash

.SILENT:

.PHONY: info menu select reset format test analyze build run generate update_phony 

reset:
	flutter clean && flutter pub get

format:
	dart format lib/ test/

test:
	flutter test

analyze:
	flutter analyze

build: lib/annotations.g.dart lib/builder.g.dart
	echo "##### Clean build #####"
	flutter clean
	rm -fvr build
	echo "##### Build for web #####"
	flutter build web

run: lib/annotations.g.dart lib/builder.g.dart
	flutter run --debug -d chrome

builder/builder.exe:
	cd builder && dart compile exe builder.dart

lib/annotations.g.dart lib/builder.g.dart:
	make generate

generate: builder/builder.exe
	builder/builder.exe lib
	make format

update_phony:
	@echo "##### Updating .PHONY targets #####"
	@targets=$$(grep -E '^[a-zA-Z_][a-zA-Z0-9_-]*:' Makefile | grep -v '=' | cut -d: -f1 | tr '\n' ' '); \
	sed -i.bak "s/^\.PHONY:.*/.PHONY: $$targets/" Makefile && \
	echo "Updated .PHONY: $$targets" && \
	rm -f Makefile.bak
