# Definindo variáveis para facilitar a manutenção
CXX = g++
CXXFLAGS = -L src/lib -Dmain=SDL_main  
LIBS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_image
SRCS = src/main.cpp src/Game.cpp src/GameObject.cpp src/TextureManager.cpp src/Map.cpp
OBJS = build/main.o build/Game.o build/GameObject.o build/TextureManager.o build/Map.o
TARGET = build/main

# Criar o diretório de build se não existir
all: $(TARGET)

# Como gerar o executável
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(CXXFLAGS) $(LIBS)

# Regra para compilar main.cpp e colocar o objeto na pasta build
build/main.o: src/main.cpp src/Game.hpp | build
	$(CXX) $(CXXFLAGS) -c src/main.cpp -o build/main.o

# Regra para compilar Game.cpp e colocar o objeto na pasta build
build/Game.o: src/Game.cpp src/Game.hpp | build
	$(CXX) $(CXXFLAGS) -c src/Game.cpp -o build/Game.o

# Regra para compilar GameObject.cpp e colocar o objeto na pasta build
build/GameObject.o: src/GameObject.cpp src/GameObject.hpp | build
	$(CXX) $(CXXFLAGS) -c src/GameObject.cpp -o build/GameObject.o

# Regra para compilar TextureManager.cpp e colocar o objeto na pasta build
build/TextureManager.o: src/TextureManager.cpp src/TextureManager.hpp | build
	$(CXX) $(CXXFLAGS) -c src/TextureManager.cpp -o build/TextureManager.o

# Regra para compilar Map.cpp e colocar o objeto na pasta build
build/Map.o: src/Map.cpp src/Map.hpp | build
	$(CXX) $(CXXFLAGS) -c src/Map.cpp -o build/Map.o

# Regra para criar a pasta build
build:
	mkdir -p build

# Limpeza dos arquivos objeto e executável
clean:
	rm -rf build
