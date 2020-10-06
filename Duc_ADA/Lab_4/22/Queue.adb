package body Queue is

   procedure Push(Q: in out Queue; E: in Elem) is
   begin
      if Q.Size < Q.Arr'Length then
         Q.Size := Q.Size + 1;
         Q.Arr(Q.Size) := E;
      end if;
   end;

   function Pop(Q: in out Queue) return Elem is
   E: Elem := Q.Arr(1);
   begin
      for I in 2..Q.Size loop
         Q.Arr(Integer'Pred(I)) := Q.Arr(I);
      end loop;
      Q.Size := Q.Size - 1;
      return E;
   end;

end Queue;