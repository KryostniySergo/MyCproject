#include <raylib.h>

typedef struct Box
{
    Vector2 pos;
    Vector2 circle_pos;
    int size;
    Color color;
    Color circle_color;
    int circle_size;
} Box;

Box CreateBox(Vector2 box_pos, int size, Color box_color, Color circle_color)
{
    // Vector2 box_pos = {screenWidth / 2, screenHeight / 2};
    Vector2 circle_pos = {box_pos.x + size, box_pos.y + size / 2};

    Box new_box = {box_pos, circle_pos, size, box_color, circle_color, size / 4};
    return new_box;
}

void DrawMyBox(Box *box)
{
    DrawRectangle(
        box->pos.x,
        box->pos.y,
        box->size,
        box->size,
        box->color);

    box->circle_pos = (Vector2){box->pos.x + box->size, box->pos.y + box->size / 2};
    DrawCircleV(box->circle_pos, box->circle_size, box->circle_color);
}