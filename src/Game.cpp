#include "Game.hpp"
#include "TextureManager.hpp"
#include "Map.hpp"
#include "Components.hpp"
#include "ECS.hpp"

Map *map;
Manager manager;

SDL_Renderer *Game::renderer = nullptr;
auto &player(manager.addEntity());

Game::Game()
{
}

Game::~Game()
{
}

void Game::init(const char *title, int xpos, int ypos, int width, int height, bool fullscreen)
{
    int flags = 0;
    if (fullscreen)
    {
        flags = SDL_WINDOW_FULLSCREEN;
    }

    if (SDL_Init(SDL_INIT_EVERYTHING) == 0)
    {
        std::cout << "Subsystems Initialised..." << std::endl;

        window = SDL_CreateWindow(title, xpos, ypos, width, height, flags);
        if (window)
        {
            std::cout << "Window created!" << std::endl;
        }

        renderer = SDL_CreateRenderer(window, -1, 0);
        if (renderer)
        {
            SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
            std::cout << "Renderer created!" << std::endl;
        }

        isRunning = true;
    }
    else
    {
        isRunning = false;
    }

    map = new Map();

    player.addComponent<PositionComponent>();
    player.addComponent<SpriteComponent>("assets/player.png");
}

void Game::handleEvents()
{
    SDL_Event event;
    SDL_PollEvent(&event);
    switch (event.type)
    {
    case SDL_QUIT:
        isRunning = false;
        break;

    default:
        break;
    }
}

void Game::update()
{
    manager.refresh();
    manager.update();

    // print x and y positions
    std::cout << player.getComponent<PositionComponent>().x() << ", " << player.getComponent<PositionComponent>().y() << std::endl;

    if (player.getComponent<PositionComponent>().x() > 300)
    {
        player.getComponent<SpriteComponent>().setTex("assets/enemy.png");
    }
}

void Game::render()
{
    SDL_RenderClear(renderer);

    map->DrawMap();
    manager.draw();

    SDL_RenderPresent(renderer);
}

void Game::clean()
{
    SDL_DestroyWindow(window);
    SDL_DestroyRenderer(renderer);
    SDL_Quit();
    std::cout << "Game Cleaned..." << std::endl;
}