-module(geometry).
-export([test/0, area/1, perimeter/1]).

test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    314.159 = area({circle, 10}),
    true = 25 == area({right_angle_triangle, 10, 5}),
    
    14 = perimeter({rectangle, 3, 4}),
    31.4159 = perimeter({circle, 5}),
    true = 12 == perimeter({right_angle_triangle, 3, 4}),
    16 = area({square, 4}),
    tests_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14159 * Radius * Radius;
area({right_angle_triangle, Base, Height}) -> 0.5 * Base * Height;
area({square, Side}) -> Side * Side.

perimeter({rectangle, Width, Height}) -> 2 * Width + 2 * Height;
perimeter({circle, Radius}) -> 2 * 3.14159 * Radius;
perimeter({right_angle_triangle, Base, Height}) -> 
    Base + Height + math:sqrt(Base * Base + Height * Height);
perimeter({square, Side}) -> 4 * Side.
