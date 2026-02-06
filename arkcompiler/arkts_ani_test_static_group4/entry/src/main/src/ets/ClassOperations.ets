/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class Person {
  public static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  public static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  public func(a: int, b: int): int {
    return a + b;
  }

  native foo(): int;

  stringValue: string = "test";
}

class Son extends Person {

}

namespace test001 {
  class TestA001 {
    constructor() {
    }
    public sum(a0: int, a1: int): int
    {
      return a0 + a1;
    }
  }
}

enum Color {
  RED,
  GREEN,
  BLUE
}

interface I {}

class A implements I {}

class TestByte {
    static byte_value: byte = 126;
    static string_value: String = "true";
    static age: byte = 0;
    static special1: string = "";
    static special2: null = null;
    static special3: undefined  = undefined ;
    static special4: string = "\n";
    static special5: string = "\r";
    static special6: string = "\t";
    static special7: string = "\b";
    static special8: string = "\a";
    static special9: string = "\f";
    static special10: string = "\v";
    static special11: string = "\0";
    static byteMin: byte = -128;
    static byteMax: byte = 127;
}

class TestByteA extends TestByte {
    static byte_value: byte = 126;
}

final class TestByteFinal extends TestByte {
    static byte_value: byte = 126;
}

class TestChar {
    static char_value: char = c'c';
    static string_value: String = "c";
    static special1: string = "";
    static special2: null = null;
    static special3: undefined  = undefined ;
    static special4: char = c'\n';
    static special5: char = c'\r';
    static special6: char = c'\t';
    static special7: char = c'\b';
    static special8: char = c'\0';
    static charMin: char = c'\u0000';
    static charMax: char = c'\uFFFF';
}

class TestCharA extends TestChar {
    static char_value: char = c'c';
}

final class TestCharFinal extends TestChar {
    static char_value: char = c'c';
}

class TestDouble {
    static double_value: double = 18.0;
    static string_value: String = "18.0";
    static special1: int = 0;
    static special2: string = "";
    static special3: null = null;
    static special4: undefined  = undefined ;
    static doubleMin: double = -1.7976931348623157e+308;
    static minpositive: double = 2.2250738585072014e-308;
    static doubleMax: double = 1.7976931348623157e+308;
}

class TestDoubleA extends TestDouble {
    static double_value: double = 18.0;
}

final class TestDoubleFinal extends TestDouble {
    static double_value: double = 18.0;
}

class TestFloat {
    static float_value: float = 18.0f;
    static string_value: String = "18.0";
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static floatMin: float = -3.40282346638528860e+38f;
    static minpositive: float =  1.17549435e-38f;
    static floatMax: float = 3.40282346638528860e+38f;
}

class TestFloatA extends TestFloat {
    static float_value: float = 18.0f;
}

final class TestFloatFinal extends TestFloat {
    static float_value: float = 18.0f;
}

class TestInt {
    static int_value: int = 3;
    static string_value: String = "1024";
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static min: int = -2147483648;
    static max: int = 2147483647;
}

class TestIntA extends TestInt {
    static int_value: int = 3;
}

final class TestIntFinal extends TestInt {
    static int_value: int = 3;
}

class TestLong {
    static long_value: long = 24;
    static string_value: String = "24";
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static min: long = -9223372036854775808;
    static max: long = 9223372036854775807;
}

class TestLongA extends TestLong {
    static long_value: long = 24;
}

final class TestLongFinal extends TestLong {
    static long_value: long = 24;
}

class TestRef {
    static int_value: int = 0;
    static string_value: String = "testString";
}

class TestRefA extends TestRef {
    static int_value: int = 0;
    static string_value: String = "testString";
}

final class TestRefFinal extends TestRef {
    static int_value: int = 0;
    static string_value: String = "testString";
}

class TestShort {
    static short_value: short = 3;
    static string_value: String = "testString";
    static special2: string = "";
    static special3: null = null;
    static special4: undefined  = undefined ;
    static special5: int = 0;
    static shortMin: short = -32768;
    static shortMax: short = 32767;
}

class TestShortA extends TestShort {
    static short_value: short = 3;
}

final class TestShortFinal extends TestShort {
    static short_value: short = 3;
}

class TestBoolean {
    static boolean_value: boolean = true;
    static string_value: String = "true";
    static special1: int = 0;
    static special3: String = "";
    static special4: null = null;
    static special5: undefined  = undefined ;
    static special6: boolean = !'s';
    static special7: boolean = !0;
    static special8: boolean = true;
    static special9: boolean = false;
}

class TestBooleanA extends TestBoolean {
    static boolean_value: boolean = false;
}

final class TestBooleanFinal extends TestBoolean {
    static boolean_value: boolean = false;
}

class Point {
    x: int;
    y: int;
    getRadius: (p: Point) => double = (p: Point) => Math.sqrt(p.x * p.x + p.y * p.y);
}

class ExtendedPoint extends Point {
    public z: int;
}

class Vector {
    private p1: Point | ExtendedPoint | null = null;
    private p2: Point | ExtendedPoint | null = null;
    readonly length: number;
}

interface IFigure {
    points: ExtendedPoint[];
    vectors: Vector[];
}

class Circle implements IFigure {
    points: ExtendedPoint[] = [];
    vectors: Vector[] = [];
    protected radius: Vector = new Vector();
    protected center: Point | ExtendedPoint = new Point();
}

class Sphere extends Circle {}

class Space {
    objects: [Circle, Sphere, Vector, ExtendedPoint, Point];
    dimension: int;
    constructor(objects: [Circle, Sphere, Vector, ExtendedPoint, Point]) {
        this.objects = objects
    }
    name?: string;
}

class UniversalFigureHandler {
    figure: Partial<IFigure>;
    constructor(figure: Partial<IFigure>) {
        this.figure = figure;
    }
}

class NamedSpaceHandler {
    space: Required<Space>;
    constructor(space: Required<Space>) {
        this.space = space;
    }
}

class MyA {
    $_get(index: number): MyA {
        return this
    }

    $_set(index: number, value: string) {}

    $_set(index: number, value: boolean) {}
}

namespace ops {
class Singleton {
    constructor() {
        this.weight = 0;
    }
    weight: int;
    data: int[] = [1, 2, 3]
    $_iterator() { // Function type is inferred from its body
        return new SingletonIterator(this)
    }
}

class SingletonIterator implements Iterator<int> {
    index = 0
    base: Singleton
    constructor (base: Singleton) {
        this.base = base
    }
    next(): IteratorResult<int> {
        return {
            done: this.index >= this.base.data.length,
            value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
        }
    }
}
};

// test out of namespace ops
class Singleton {
     constructor() {
        this.weight = 1;
    }
    weight: int;
    data: int[] = [2, 4, 6]
    $_iterator() { // Function type is inferred from its body
        return new SingletonIterator(this)
    }
}

class SingletonIterator implements Iterator<int> {
    index = 0
    age = 0
    base: Singleton
    constructor (base: Singleton) {
        this.base = base
        this.age = 1
    }
    next(): IteratorResult<int> {
        return {
            done: this.index >= this.base.data.length,
            value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
        }
    }
 }

namespace nsa {
    class A {
        public func(a: int, b: int): int {
            return a + b;
        }
    }
}

interface Style {
    color : string
}

class StyledRectangle implements Style {
    color: string = ""
}

class ExplicitMethods {
    private age_: number = 0
    set age(x: number) {
    }
    get age(): number {
        return this.age_
    }
}

class ImplicitMethods {
    field: number
}

class OnlyGet {
    public field_: boolean = true
    get field(): boolean {
        return this.field_
    }
}

class OnlySet {
    public field_: boolean = true
    set field(x: number) {
    }
}

class SingletonTwo {
    static instance: int = 0;
}

class TestSetBoolean {
    static bool_value: boolean = false;
    static string_value: string = "";
}

class TestSetBooleanA extends TestSetBoolean {
    static bool_value: boolean = false;
}

final class TestSetBooleanFinal extends TestSetBoolean {
    static bool_value: boolean = false;
}

class TestSetByte {
    static byte_value: byte = 126;
    static string_value: string = "";
}

class TestSetByteA extends TestSetByte {
    static byte_value: byte = 126;
}

final class TestSetByteFinal extends TestSetByte {
    static byte_value: byte = 126;
}

class TestSetChar {
    static char_value: char = c'a';
    static string_value: string = "";
}

class TestSetCharA extends TestSetChar {
    static char_value: char = c'a';
}

final class TestSetCharFinal extends TestSetChar {
    static char_value: char = c'a';
}

class TestSetDouble {
    static double_value: double = 18.0;
    static string_value: string = "";
}

class TestSetDoubleA extends TestSetDouble {
    static double_value: double = 18.0;
}

final class TestSetDoubleFinal extends TestSetDouble {
    static double_value: double = 18.0;
}

class TestSetFloat {
    static float_value: float = 18.0f;
    static string_value: string = "";
}

class TestSetFloatA extends TestSetFloat {
    static float_value: float = 18.0f;
}

final class TestSetFloatFinal extends TestSetFloat {
    static float_value: float = 18.0f;
}

class TestSetInt {
    static int_value: int = 3;
    static string_value: string = "";
}

class TestSetIntA extends TestSetInt {
    static int_value: int = 3;
}

final class TestSetIntFinal extends TestSetInt {
    static int_value: int = 3;
}

class TestSetLong {
    static long_value: long = 24;
    static string_value: string = "";
}

class TestSetLongA extends TestSetLong {
    static long_value: long = 24;
}

final class TestSetLongFinal extends TestSetLong {
    static long_value: long = 24;
}

class TestSetRef {
    static int_value: int = 0;
    static string_value: String = "";
}

class TestSetRefA extends TestSetRef {
    static int_value: int = 0;
    static string_value: String = "";
}

final class TestSetRefFinal extends TestSetRef {
    static int_value: int = 0;
    static string_value: String = "";
}

class TestSetShort {
    static short_value: short = 3;
    static string_value: string = "";
}

class TestSetShortA extends TestSetShort {
    static short_value: short = 3;
}

final class TestSetShortFinal extends TestSetShort {
    static short_value: short = 3;
}