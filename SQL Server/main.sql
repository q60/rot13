-- Inspired by Conquer

declare @input nvarchar(max) = 'Hello world!';

declare @output nvarchar(max) = '';
declare @i int = 0;
declare @c char;
while @i < len(@input)
begin
    set @i = @i + 1;
    set @c = substring(@input, @i, 1);

    if ascii('a') <= ascii(@c) and ascii(@c) <= ascii('z')
    begin
        set @c = char((ascii(@c) - ascii('a') + 13) % 26 + ascii('a'));
    end
    else if ascii('A') <= ascii(@c) and ascii(@c) <= ascii('Z')
    begin
        set @c = char((ascii(@c) - ascii('A') + 13) % 26 + ascii('A'));
    end

    set @output = @output + @c;
end

select @output as result;
