First test - generic programming.

A set can be represented as a boolean array indexed by the type of the 
elements. If an element is included in the set, then on the respective 
index position the value is true, otherwise false.

Write a generic package to operate with sets represented as boolean arrays
as described above. The generic parameter is an element type,
which must be a discrete type.

The package should contain the following operations:
generic
type Elem ...
package PSet is
type Set is private;
type TArray is (Positive range <>) of Elem;

function Make_Set (L: TArray) return Set; -- creates a Set from an array
function Make_Set (E: Elem) return Set; -- creates a Set from an element
function Decompose (S: Set) return TArray; -- turns a Set into an array

function "+" (S, T: Set) return Set; -- union
function "*" (S, T: Set) return Set; -- intersection
function "<" (E: Elem; S: Set) return Boolean; -- inclusion
function Contains (S, T: Set) return Boolean; -- checks if T contains S
function Size (S: Set) return Natural; -- the size of a Set
procedure print_Set(S: in Set); -- prints the set

private
type Set is ...
end PSet;
For demo use the test file to check all the operations of the package, 
instansiation is made for the type Character.
