# Definindo variáveis para facilitar a manutenção
CXX = g++
CXXFLAGS = -I src/include -L src/lib -Dmain=SDL_main
LIBS = -lmingw32 -lSDL2main -lSDL2
SRCS = main.cpp Game.cpp
OBJS = build/main.o build/Game.o
TARGET = build/main

# Criar o diretório de build se não existir
all: $(TARGET)

# Como gerar o executável
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(CXXFLAGS) $(LIBS)

# Regra para compilar main.cpp e colocar o objeto na pasta build
build/main.o: main.cpp Game.hpp | build
	$(CXX) $(CXXFLAGS) -c main.cpp -o build/main.o

# Regra para compilar Game.cpp e colocar o objeto na pasta build
build/Game.o: Game.cpp Game.hpp | build
	$(CXX) $(CXXFLAGS) -c Game.cpp -o build/Game.o

# Regra para criar a pasta build
build:
	mkdir -p build

# Limpeza dos arquivos objeto e executável
clean:
	rm -rf build
