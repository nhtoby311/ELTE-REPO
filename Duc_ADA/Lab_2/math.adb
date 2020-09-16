package body math is

   function AddDigitNumber(N: Natural) return Natural is
        S: Natural := 0;
        T: Natural := N;
   begin
        while ( T /= 0 ) loop
            S := S + ( T mod 10 );
            T := T / 10;            
        end loop;
        return S;
   end AddDigitNumber;


    function CheckIfDividedByNine (N: Natural) return Boolean is
        A: Natural := AddDigitNumber(N);
    begin
        if (A mod 9 = 0) then
            return True;
        else return False;
        end if;
    end CheckIfDividedByNine;

    function FindPerfectNumber (N: Natural) return Boolean is
        S: Natural := 0;
    begin
        --Find sum of divisor
        for i in 1..N-1 loop
           if (N mod i = 0) then
                S:= S + i;
           end if;           
        end loop;
        if (N = S) then 
            return True;
        else return False;
        end if;
    end FindPerfectNumber;

    function Factorial ( N: Natural ) return Natural is
    begin
        if N > 1 then return N * Factorial (N-1);
            else return 1;
        end if;
    end Factorial;
    
    function Sin(x: Float) return Float is
        res: Float := x;
        current: Float := x;
        sign: Float := -1.0;
    begin
        for i in 1..10000000 loop
            current := (current * x * x) / (Float(2 * i) * Float(2*i + 1));
            res := res + sign * current;
            sign := -sign;
        end loop;
        return res;
    end Sin;

    function StringReverse(S: String) return String is
    begin
    if S'Length <= 1 then
      return S;
    else
      return StringReverse(S(S'First+1..S'Last)) & S(S'First);
    end if;
    end StringReverse;

    function ReverseNumber(X: Natural) return Natural is
        M: Natural := 0;
        N: Natural:= X;
    begin
        while (N/=0) loop
            M:= M*10 + (N mod 10);
            N:= N/10;
        end loop;
        return M;
    end ReverseNumber;

    function Power(N: Positive; X: Positive) return Positive is
    begin
        if (N=1) then return 1; end if;
        if X=0 then return 1; end if;
        if (X mod 2 = 0) then
            if (X = 2) then return N*N; end if;    
            return Power(Power(N,X/2),2);        
        else return N*Power(N, X-1);
        end if;
    end Power;

    function RecursiveFact(N: Positive) return Positive is
    begin
        if (N=1) then return N;
        else return N*RecursiveFact(N-1);
        end if;
    end RecursiveFact;
end math;