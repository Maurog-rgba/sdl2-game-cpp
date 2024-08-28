all: 
	g++ -I src/include -L src/lib main.cpp -lmingw32 -lSDL2main -lSDL2 -o main
