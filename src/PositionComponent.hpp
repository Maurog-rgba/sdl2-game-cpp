#pragma once

#include "Components.hpp"

class PositionComponent : public Component
{
private:
    int xpos;
    int ypos;

public:
    PositionComponent()
    {
        xpos = ypos = 0;
    }

    PositionComponent(int x, int y)
    {
        xpos = x;
        ypos = y;
    }

    void update() override
    {
        xpos++;
        ypos++;
    }

    int x() { return xpos; }
    void x(int x) { xpos = x; }
    int y() { return ypos; }
    void y(int y) { ypos = y; }

    void setPos(int x, int y)
    {
        xpos = x;
        ypos = y;
    }
};