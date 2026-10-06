% ARTI 303 - Lab 6 - Prolog Programming


% ---- facts: car(Model, Price, Age, Colour, Mileage) -------------
car(chrysler, 130000, 3, red,   12000).
car(ford,      90000, 4, gray,  25000).
car(datsun,    80000, 1, red,   30000).

truck(ford,    80000, 6, blue,   8000).
truck(datsun,  50000, 5, orange,20000).
truck(toyota,  25000, 2, black, 25000).

can_buy(Cost) :-
    car(Model, C1, _, _, _),
    C1 < Cost,
    write('With '), write(C1),
    write(' you can purchase the car '), write(Model), nl.

can_buy(Cost) :-
    truck(Model, C2, _, _, _),
    C2 < Cost,
    write('With '), write(C2),
    write(' you can purchase the truck '), write(Model), nl.

% =================================================================
% LAB TASK 1 - MODEL ANSWER  (also consider the colour)

% can_buy(Cost, Colour): suggests only vehicles of the given colour
% (the original can_buy/1 above is kept unchanged)
can_buy(Cost, Colour) :-
    car(Model, C1, _, Colour, _),
    C1 < Cost,
    write('With '), write(C1),
    write(' you can purchase the '), write(Colour),
    write(' car '), write(Model), nl.

can_buy(Cost, Colour) :-
    truck(Model, C2, _, Colour, _),
    C2 < Cost,
    write('With '), write(C2),
    write(' you can purchase the '), write(Colour),
    write(' truck '), write(Model), nl.

% ---- TEST QUERIES (use ; to get all answers, then fail the rest) ----
% Colour that exists (red):
%   ?- can_buy(100000, red).      % datsun car (80000)
%   ?- can_buy(200000, red).      % chrysler and datsun cars
% Colour that exists (blue):
%   ?- can_buy(100000, blue).     % ford truck (80000)
%   ?- can_buy(50000, blue).      % false (nothing blue under 50000)
% Colour that does not exist (green):
%   ?- can_buy(200000, green).    % false
% Original rule still works:
%   ?- can_buy(100000).