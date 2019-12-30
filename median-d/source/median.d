import std.range.primitives: isInputRange, ElementType;
import std.traits: Unqual;


double median(R)(R numbers)
    if(isInputRange!R && is(Unqual!(ElementType!R) == int))
{
    import std.array: empty;
    import std.algorithm: sort;

    if(numbers.empty)
        throw new Exception("No median for empty range");

    sort(numbers);

    const bool isOdd = numbers.length % 2;
    const auto length = numbers.length;

    return isOdd
        ? numbers[length / 2]
        : (numbers[length / 2 - 1] + numbers[length / 2]) / 2.0;
}
