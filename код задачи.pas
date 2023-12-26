function f(x: Real): Real;
begin
  f := 2*x*x*x - x*x - x + 17;
end;

function RectangleMethod(a, b, n: Integer): Real;
var
  h, x, area: Real;
  i: Integer;
begin
  h := (b - a) / n;
  area := 0;
  x := a + h;
  
  for i := 1 to n do
  begin
    area := area + f(x);
    x := x + h;
  end;
  
  area := area * h;
  RectangleMethod := area;
end;

function GetError(area, a, b: Real): Real;
begin
  GetError := (b - a) * abs(b - a) / 24;
end;

var
  a, b, n: Integer;
  area, error: Real;
  choice: Integer;

begin
  writeln('1. Ввести пределы интегрирования');
  writeln('2. Ввести количество отрезков разбиения');
  writeln('3. Вычислить площадь');
  writeln('4. Оценить погрешность');
  writeln('5. Выйти');

  repeat
    write('Выберите пункт: ');
    readln(choice);

    case choice of
      1: begin
           write('Введите пределы интегрирования (a и b): ');
           readln(a, b);
         end;
      2: begin
           write('Введите количество отрезков разбиения (n): ');
           readln(n);
         end;
      3: begin
           if (a < b) and (n > 0) then
           begin
             area := RectangleMethod(a, b, n);
             writeln('Площадь фигуры: ', area:0:2);
           end
           else
             writeln('Ошибка: некорректные значения пределов или количества отрезков.');
         end;
      4: begin
           if (a < b) and (n > 0) then
           begin
             error := GetError(area, a, b);
             writeln('Оценка погрешности: ', error:0:2);
           end
           else
             writeln('Ошибка: некорректные значения пределов или количества отрезков.');
         end;
      5: writeln('Выход');
      else writeln('Ошибка: некорректный пункт меню.');
    end;

    writeln;
  until choice = 5;
end.
