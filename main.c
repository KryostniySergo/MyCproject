#include <stdio.h>
#include <raylib.h>
#include <raymath.h>
#include <mybox.c>

const int screenWidth = 800;
const int screenHeight = 600;

void Update()
{
}

int main()
{
    bool moveStartPoint = false;

    Box mybox = CreateBox((Vector2){screenWidth / 2 - 200, screenHeight / 2}, 60, RED, GREEN);
    Vector2 endPoint = {(float)screenWidth - 30, (float)screenHeight - 30};

    SetConfigFlags(FLAG_MSAA_4X_HINT);
    InitWindow(screenWidth, screenHeight, "raylib [shapes] example - cubic-bezier lines");

    while (!WindowShouldClose())
    {
        Vector2 mouse = GetMousePosition();
        // Update
        if (CheckCollisionPointCircle(
                mouse, mybox.pos,
                (float)(mybox.size)) &&
            IsMouseButtonDown(MOUSE_BUTTON_LEFT))
            moveStartPoint = true;

        if (moveStartPoint)
        {
            mybox.pos = mouse;
            if (IsMouseButtonReleased(MOUSE_BUTTON_LEFT))
                moveStartPoint = false;
        }

        // Drawing
        BeginDrawing();
        ClearBackground(DARKBLUE);

        DrawLineBezier(mybox.circle_pos, endPoint, 4.0f, BLUE);

        DrawMyBox(&mybox);
        DrawCircleV(endPoint, 14.0f, GREEN);

        EndDrawing();
    }

    CloseWindow();

    return 0;
}