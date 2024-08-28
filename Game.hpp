#ifndef Game_hpp
#define Game_hpp

#include <SDL2/SDL.h>
#include <iostream>

class Game
{
public:
    Game();
    ~Game();
    void init(const char *title, int xpos, int ypos, int width, int height, bool fullscreen);

private:
    bool isRunning;
    SDL_Window *window;
    SDL_Renderer *renderer;
};

#endif /* Game_hpp */