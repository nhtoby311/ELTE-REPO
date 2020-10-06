package Queue is
   subtype Elem is Integer;
   type Queue(Max: Positive) is limited private;

   procedure Push(Q: in out Queue; E: in Elem);
   function Pop(Q: in out Queue) return Elem;
   
   private
      type TArray is array(Integer range <>) of Elem;
      type Queue(Max: Positive) is record
         Arr: TArray(1..Max);
         Size: Natural := 0;
      end record;
end Queue;