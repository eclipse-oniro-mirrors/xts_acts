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

export class FooTwo {
}

namespace AnynsTwo {
}


namespace Aops {}
namespace Bops {}
namespace Cops {}
namespace Dops {}
namespace Eops {}
namespace Fops {}
namespace Gops {}
namespace Hops {}
namespace Iops {}
namespace Jops {}

enum ETWO { R }

function sumTwo(a0: int, a1: int): int {
  return a0 + a1;
}

let moduleTwo: int = 3;

export class ATest {};
class BTest {};
namespace ops {
    class C {} 
};
abstract class Person {
    public abstract addMethod(a0: int, a1: int): int;
};

class Student extends Person {
    static b: int = 1;
    static readonly c: int = 0;
    public override addMethod(a0: int, a1: int): int {
        return a0 + a1;
    }
};

final class Child extends Person {
    public override addMethod(a0: int, a1: int): int {
        return a0 + a1;
    }
};

interface Foo {
    foo(x: double): double;
};

interface Eat {
    eat(x: int): int;
};
export class BB implements Foo, Eat {
    foo(x: double): double { return x; }
    eat(x: int): int { return x; }
};

class A {}
class B {}
class C {}
class D {}
class E {}
class F {}
class G {}
class H {}
class I {}
class J {}

namespace aaa_test {
    class BBBTest {}
}

class AT {}
class BT extends AT {}
class CT extends BT {}

interface Container<T> {
  add(item: T): void;
}

class ContainerTest<T> implements Container<T>{
    items: (T | undefined)[];
    index: int = 0;
    length: int = 0;
    constructor(length:int) {
        this.items = new (T | undefined)[length];
        this.length = length;
    }
    override add(item: T): void {
        if (this.index >= this.length) {
            return;
        }
        this.items[this.index++] = item;
    }
}

function setIntValueA(i: int): void {}
function setIntValueB(i: int): void {}
function setIntValueC(i: int): void {}
function setIntValueD(i: int): void {}
function setIntValueE(i: int): void {}
function setIntValueF(i: int): void {}
function setIntValueG(i: int): void {}
function setIntValueH(i: int): void {}
function setIntValueI(i: int): void {}
function setIntValueJ(i: int): void {}

export let moduleA: int = 3;
export let moduleB: int = 3;
export let moduleC: int = 3;
export let moduleD: int = 3;
export let moduleE: int = 3;
export let moduleF: int = 3;
export let moduleG: int = 3;
export let moduleH: int = 3;
export let moduleI: int = 3;
export let moduleJ: int = 3;

enum ColorA {
    RED,
    BLUE,
    GREEN
}
enum ColorB {
    RED,
    BLUE,
    GREEN
}
enum ColorC {
    RED,
    BLUE,
    GREEN
}
enum ColorD {
    RED,
    BLUE,
    GREEN
}
enum ColorE {
    RED,
    BLUE,
    GREEN
}
enum ColorF {
    RED,
    BLUE,
    GREEN
}
enum ColorG {
    RED,
    BLUE,
    GREEN
}
enum ColorH {
    RED,
    BLUE,
    GREEN
}
enum ColorI {
    RED,
    BLUE,
    GREEN
}
enum ColorJ {
    RED,
    BLUE,
    GREEN
}

enum Color {
    RED,
    BLUE,
    GREEN
}

enum ColorInt {
    RED = 5,
    BLUE = 77,
    GREEN = 9999
}

enum ColorString {
    RED = "str_red",
    BLUE = "str_blue",
    GREEN = "str_green"
}

namespace ops {
    enum ColorAA {
    RED = 5,
    BLUE,
    GREEN
}
  function getIntValueOps(): int {
      return 0;
  }
}

export function getInitialIntValue(): int {
    return 0;
}

function getIntValue(i: int): int {
    return 0;
}
function getIntValue(i: String): int {
    return 1;
}
function getIntValue(): int {
    return 2;
}

export function getInitialStringValue(): String {
    return "a";
}

function overloaded(i: int): int {
    return 0
}
function overloaded(): int {
    return 1
}


function getIntValueA(i: int): void {}
function getIntValueB(i: int): void {}
function getIntValueC(i: int): void {}
function getIntValueD(i: int): void {}
function getIntValueE(i: int): void {}
function getIntValueF(i: int): void {}
function getIntValueG(i: int): void {}
function getIntValueH(i: int): void {}
function getIntValueI(i: int): void {}
function getIntValueJ(i: int): void {}

class Test
{
    public getIntValue(): int {
        return 0;
    }
    public getIntValueA(): int {
        return 0;
    }
};
class TestA extends Test {
    public static addIntValue(a: int, b: int): int {
        return a + b;
    }
    public getIntValueA(): int {
        return 0;
    }
};

async function async_f(a: int): Promise<int> {
    return a;
}

function SetIntValueJ(i: int): void {}

export let moduleX: int = 3;
export let moduleXS: String = "abc";
let moduleS: String = "abc";

export let moduleK: boolean = false;
export let moduleL: char = c'G';
export let moduleM: byte = 2;
export let moduleN: short = 10;
export let moduleO: long = 100;
export let moduleP: float = 3.14f;
export let moduleQ: double = 6.28;

namespace ops {
    let moduleT: int = 3;
}
const moduleXB = 1;

interface FoodAction {
    foo(x: double): double;
};

interface EatingAction {
    eat(x: int): int;
};

export class Actionor implements FoodAction, EatingAction {
    foo(x: double): double {
        return x;
    }

    eat(x: int): int {
        return x;
    }
}