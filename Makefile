clean:
	@echo "Cleaning the project"
	@flutter clean

format:
	@echo "Formatting the code"
	@dart fix --apply .
	@dart format -l 120 --fix .

get:
	@echo "Getting dependencies"
	@flutter pub get

rebuild: clean get

codegen: get
	@echo "Running code generation"
	@flutter pub run build_runner build

codegen-dco: clean get
	@echo "Running code generation"
	@flutter pub run build_runner build --delete-conflicting-outputs
