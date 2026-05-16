/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class Operations {
    static or(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }
}

namespace na {
class A {
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }
    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }
}
}

namespace nb {
namespace nc {
class A {
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }
}
}
}

namespace nd {
class A {
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }
}

class B extends A{
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 && a1;
    }
}
}

class A {
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }

    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcB(a0: boolean, a1: boolean): boolean {
        return A.funcA(a0, a1);
    }
}

class B extends A{
    static funcB(a0: boolean, a1: boolean): boolean {
        return a0 && a1;
    }
}

class C extends A{
}

class D extends A{
    static funcA(a0: boolean, a1: boolean): boolean {
        return a0 && a1;
    }
}

class E extends A{
    static funcA(a0: boolean, a1: boolean): boolean {
        return A.funcA(a0, a1);
    }
}

class F {
    static increment(a0: boolean, a1: boolean): void {
        F.count &= a0;
        F.count &= a1;
    }

    static getCount(): boolean {
        return F.count;
    }

    static count: boolean = false;
}

class G {
    public static publicMethod(a0: boolean, a1: boolean): boolean {
        return a0 || a1;
    }

    private static privateMethod(a0: boolean, a1: boolean): boolean {
        return a0 && a1;
    }

    static callPrivateMethod(a0: boolean, a1: boolean): boolean {
        return G.privateMethod(a0, a1);
    }
}

class Operations1 {
    static sum(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }
}

namespace na {
class A1 {
    static funcA(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
}
}

namespace nb {
namespace nc {
class A1 {
    static funcA(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }
}
}
}

namespace nd {
class A1 {
    static funcA(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }
}

class B1 extends A1{
    static funcA(a0: byte, a1: byte): byte {
        return (a1 - a0).toByte();
    }
}
}

class A1 {
    static funcA(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }

    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcB(a0: byte, a1: byte): byte {
        return A1.funcA(a0, a1);
    }
}

class B1 extends A1{
    static funcB(a0: byte, a1: byte): byte {
        return (a1 - a0).toByte();
    }
}

class C1 extends A1{
}

class D1 extends A1{
    static funcA(a0: byte, a1: byte): byte {
        return (a1 - a0).toByte();
    }
}

class E1 extends A1{
    static funcA(a0: byte, a1: byte): byte {
        return A1.funcA(a0, a1);
    }
}

class F1 {
    static increment(a0: byte, a1: byte): void {
        F1.count += a0;
        F1.count += a1;
    }

    static getCount(): byte {
        return F1.count;
    }

    static count: byte = 0;
}

class G1 {
    public static publicMethod(a0: byte, a1: byte): byte {
        return (a0 + a1).toByte();
    }

    private static privateMethod(a0: byte, a1: byte): byte {
        return (a1 - a0).toByte();
    }

    static callPrivateMethod(a0: byte, a1: byte): byte {
        return G1.privateMethod(a0, a1);
    }
}

class Operations3 {
    static sub(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt()  - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }
}

namespace na {
class A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt() - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }
    static funcA(c0: int, c1: int): int {
        return c1 - c0 as int;
    }
}
}

namespace nb {
namespace nc {
class A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt() - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }
}
}
}

namespace nd {
class A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt() - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }
}

class B3 extends A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        c = (c0.toInt() + c1.toInt()).toChar();
        return c as char;
    }
}
}

class A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt() - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }

    static funcA(a0: int, a1: int): int {
        return a1 + a0 as int;
    }

    static funcB(c0: char, c1: char): char {
        return A3.funcA(c0, c1);
    }
}

class B3 extends A3 {
    static funcB(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        c = (c0.toInt() + c1.toInt()).toChar();
        return c as char;
    }
}

class C3 extends A3 {
}

class D3 extends A3 {
    static funcA(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        c = (c0.toInt() + c1.toInt()).toChar();
        return c as char;
    }
}

class E3 extends A3 {
    static funcA(c0: char, c1: char): char {
        return A3.funcA(c0, c1);
    }
}

class F3 {
    static increment(c0: char, c1: char): void {
        F3.count = (F3.count.toInt() + c0.toInt()).toChar();
        F3.count = (F3.count.toInt() + c1.toInt()).toChar();
    }

    static getCount(): char {
        return F3.count;
    }

    static count: char = c'\0';
}

class G3 {
    public static publicMethod(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        c = (c0.toInt() + c1.toInt()).toChar();
        return c as char;
    }

    private static privateMethod(c0: char, c1: char): char {
        let c: Char = new Char(c'0');
        if (c0 > c1) {
            c = (c0.toInt() - c1.toInt()).toChar();
        } else {
            c = (c1.toInt() - c0.toInt()).toChar();
        }
        return c as char;
    }

    static callPrivateMethod(c0: char, c1: char): char {
        return G3.privateMethod(c0, c1);
    }
}

class Operations4 {
    static sum(a0: double, a1: double): double {
        return a0 + a1 as double;
    }
}

namespace na {
class A4 {
    static funcA(a0: double, a1: double): double {
        return a0 + a1 as double;
    }
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
}
}

namespace nb {
namespace nc {
class A4 {
    static funcA(a0: double, a1: double): double {
        return a0 + a1 as double;
    }
}
}
}

namespace nd {
class A4 {
    static funcA(a0: double, a1: double): double {
        return a0 + a1 as double;
    }
}

class B4 extends A4{
    static funcA(a0: double, a1: double): double {
        return a1 - a0 as double;
    }
}
}

class A4 {
    static funcA(a0: double, a1: double): double {
        return a0 + a1 as double;
    }

    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcB(a0: double, a1: double): double {
        return A4.funcA(a0, a1);
    }
}

class B4 extends A4{
    static funcB(a0: double, a1: double): double {
        return a1 - a0 as double;
    }
}

class C4 extends A4{
}

class D4 extends A4{
    static funcA(a0: double, a1: double): double {
        return a1 - a0 as double;
    }
}

class E4 extends A4{
    static funcA(a0: double, a1: double): double {
        return A4.funcA(a0, a1);
    }
}

class F4 {
    static increment(a0: double, a1: double): void {
        F4.count += a0;
        F4.count += a1;
    }

    static getCount(): double {
        return F4.count;
    }

    static count: double = 0;
}
class G4 {
    public static publicMethod(a0: double, a1: double): double {
        return a0 + a1 as double;
    }

    private static privateMethod(a0: double, a1: double): double {
        return a1 - a0 as double;
    }

    static callPrivateMethod(a0: double, a1: double): double {
        return G4.privateMethod(a0, a1);
    }
}

class Operations5 {
    static sum(a0: float, a1: float): float {
        return a0 + a1 as float;
    }
}

namespace na {
class A5 {
    static funcA(a0: float, a1: float): float {
        return a0 + a1 as float;
    }
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
}
}

namespace nb {
namespace nc {
class A5 {
    static funcA(a0: float, a1: float): float {
        return a0 + a1 as float;
    }
}
}
}

namespace nd {
class A5 {
    static funcA(a0: float, a1: float): float {
        return a0 + a1 as float;
    }
}

class B5 extends A5{
    static funcA(a0: float, a1: float): float {
        return a1 - a0 as float;
    }
}
}

class A5 {
    static funcA(a0: float, a1: float): float {
        return a0 + a1 as float;
    }

    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcB(a0: float, a1: float): float {
        return A5.funcA(a0, a1);
    }
}

class B5 extends A5{
    static funcB(a0: float, a1: float): float {
        return a1 - a0 as float;
    }
}

class C5 extends A5{
}

class D5 extends A5{
    static funcA(a0: float, a1: float): float {
        return a1 - a0 as float;
    }
}

class E5 extends A5{
    static funcA(a0: float, a1: float): float {
        return A5.funcA(a0, a1);
    }
}

class F5 {
    static increment(a0: float, a1: float): void {
        F5.count += a0;
        F5.count += a1;
    }

    static getCount(): float {
        return F5.count;
    }

    static count: float = 0;
}

class G5 {
    public static publicMethod(a0: float, a1: float): float {
        return a0 + a1 as float;
    }

    private static privateMethod(a0: float, a1: float): float {
        return a1 - a0 as float;
    }

    static callPrivateMethod(a0: float, a1: float): float {
        return G5.privateMethod(a0, a1);
    }
}

class Operations6 {
    static sum(a0: int, a1: int): int {
        return a0 + a1;
    }
};

namespace na {
class A6 {
    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }
    static funcA(a0: double, a1: double): double {
        return a1 - a0 as double;
    }
};
}

namespace nb {
namespace nc {
class A6 {
    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }
};
}
}

namespace nd {
class A6 {
    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }
};
class B6 extends A6{
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
};
}

class A6 {
    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcA(a0: double, a1: double): double {
        return a0 + a1 as double;
    }

    static funcB(a0: int, a1: int): int {
        return A6.funcA(a0, a1);
    }
};
class B6 extends A6{
    static funcB(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
};
class C6 extends A6{
};
class D6 extends A6{
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
};
class E6 extends A6{
    static funcA(a0: int, a1: int): int {
        return A6.funcA(a0, a1);
    }
};
class F6 {
    static increment(a0: int, a1: int): void {
        F6.count += a0;
        F6.count += a1;
    }

    static getCount(): int {
        return F6.count;
    }

    static count: int = 0;
}
class G6 {
    public static publicMethod(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    private static privateMethod(a0: int, a1: int): int {
        return a1 - a0 as int;
    }

    static callPrivateMethod(a0: int, a1: int): int {
        return G6.privateMethod(a0, a1);
    }
}

class Operations7 {
    static sum(a0: long, a1: long): long {
        return a0 + a1 as long;
    }
}; 

namespace na {
class A7 {
    static funcA(a0: long, a1: long): long {
        return a0 + a1 as long;
    }
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
};
}

namespace nb {
namespace nc {
class A7 {
    static funcA(a0: long, a1: long): long {
        return a0 + a1 as long;
    }
};
}
}

namespace nd {
class A7 {
    static funcA(a0: long, a1: long): long {
        return a0 + a1 as long;
    }
};
class B7 extends A7{
    static funcA(a0: long, a1: long): long {
        return a1 - a0 as long;
    }
};
}

class A7 {
    static funcA(a0: long, a1: long): long {
        return a0 + a1 as long;
    }

    static funcA(a0: int, a1: int): int {
        return a0 + a1 as int;
    }

    static funcB(a0: long, a1: long): long {
        return A7.funcA(a0, a1);
    }
};
class B7 extends A7{
    static funcB(a0: long, a1: long): long {
        return a1 - a0 as long;
    }
};
class C7 extends A7{
};
class D7 extends A7{
    static funcA(a0: long, a1: long): long {
        return a1 - a0 as long;
    }
};
class E7 extends A7{
    static funcA(a0: long, a1: long): long {
        return A7.funcA(a0, a1);
    }
};
class F7 {
    static increment(a0: long, a1: long): void {
        F7.count += a0;
        F7.count += a1;
    }

    static getCount(): long {
        return F7.count;
    }

    static count: long = 0;
}
class G7 {
    public static publicMethod(a0: long, a1: long): long {
        return a0 + a1 as long;
    }

    private static privateMethod(a0: long, a1: long): long {
        return a1 - a0 as long;
    }

    static callPrivateMethod(a0: long, a1: long): long {
        return G7.privateMethod(a0, a1);
    }
}

class Phone {
    static get_button_names(): string {
        return "UP";
    }

    static get_num_string(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }
};

namespace na {
class A8 {
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }
    static funcA(a0: double, a1: double): double {
        return a1 - a0 as double;
    }
};
}

namespace nb {
namespace nc {
class A8 {
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }
};
}
}

namespace nd {
class A8 {
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }
};
class B8 extends A8{
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "UP"
        }
        return "NO1";
    }
};
}

class A8 {
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }

    static funcA(a0: double, a1: double): double {
        return a1 - a0 as double;
    }

    static funcB(a0: int, a1: int): string {
        return A8.funcA(a0, a1);
    }
};
class B8 extends A8{
    static funcB(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "UP"
        }
        return "NO1";
    }
};
class C8 extends A8{
};
class DT extends A8{
    static funcA(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "UP"
        }
        return "NO1";
    }
};
class E8 extends A8{
    static funcA(a0: int, a1: int): string {
        return A8.funcA(a0, a1);
    }
};
class F8 {
    static increment(a0: int, a1: int): void {
        if (a0 == 5 && a1 == 6) {
            F8.count = "INT5"
        } else {
            F8.count = "NO1";
        }
    }

    static getCount(): string {
        return F8.count;
    }

    static count: string = "";
}
class G8 {
    public static publicMethod(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "INT5"
        }
        return "NO1";
    }

    private static privateMethod(a0: int, a1: int): string {
        if (a0 == 5 && a1 == 6) {
            return "UP"
        }
        return "NO1";
    }

    static callPrivateMethod(a0: int, a1: int): string {
        return G8.privateMethod(a0, a1);
    }
}

class Operations9 {
    static sum(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }
};

namespace na {
class A9 {
    static funcA(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }
    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }
};
}

namespace nb {
namespace nc {
class A9 {
    static funcA(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }
};
}
}

namespace nd {
class A9 {
    static funcA(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }
};

class B9 extends A9{
    static funcA(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }
};
}

class A9 {
    static funcA(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }

    static funcA(a0: int, a1: int): int {
        return a1 - a0 as int;
    }

    static funcB(a0: short, a1: short): short {
        return A9.funcA(a0, a1);
    }
};
class B9 extends A9{
    static funcB(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }
};
class C9 extends A9{
};
class D9 extends A9{
    static funcA(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }
};
class E9 extends A9{
    static funcA(a0: short, a1: short): short {
        return A9.funcA(a0, a1);
    }
};
class F9 {
    static increment(a0: short, a1: short): void {
        F9.count += a0;
        F9.count += a1;
    }

    static getCount(): short {
        return F9.count;
    }

    static count: short = 0;
}
class G9 {
    public static publicMethod(a0: short, a1: short): short {
        return (a0 + a1).toShort();
    }

    private static privateMethod(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }

    static callPrivateMethod(a0: short, a1: short): short {
        return G9.privateMethod(a0, a1);
    }
}

class OperationsV {
    static voidMethod(a0: int, a1: int): void {
        OperationsV.count += a0;
        OperationsV.count += a1;
    }

    static getCount(): int {
        return OperationsV.count;
    }

    static count: int = 0;
}

namespace na {
class AV {
    static funcA(a0: int, a1: int): void {
        AV.count += a0;
        AV.count += a1;
    }

    static getCount(): int {
        return AV.count;
    }

    static funcA(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }

    static count: int = 0;
};
}

namespace nb {
namespace nc {
class AV {
    static funcA(a0: int, a1: int): void {
        AV.count += a0;
        AV.count += a1;
    }
    
    static getCount(): int {
        return AV.count;
    }

    static count: int = 0;
};
}
}

namespace nd {
class AV {
    static funcA(a0: int, a1: int): void {
        AV.count += a0;
        AV.count += a1;
    }
    
    static getCount(): int {
        return AV.count;
    }

    static count: int = 0;
};
class BV extends AV{
    static funcA(a0: int, a1: int): void {
        BV.count += a1;
        BV.count -= a0;
    }
    
    static getCount(): int {
        return BV.count;
    }

    static count: int = 0;
};
}

class AV {
    static funcA(a0: int, a1: int): void {
        AV.count = 0;
        AV.count += a0;
        AV.count += a1;
    }
    
    static getCount(): int {
        return AV.count;
    }

    static funcA(a0: short, a1: short): short {
        return (a1 - a0).toShort();
    }

    static funcB(a0: int, a1: int): void {
        AV.funcA(a0, a1);
    }

    static count: int = 0;
};
class BV extends AV{
    static funcB(a0: int, a1: int): void {
        AV.count = 0;
        AV.count += a1;
        AV.count -= a0;
    }
};
class CV extends AV{
};
class DV extends AV{
    static funcA(a0: int, a1: int): void {
        AV.count = 0;
        AV.count += a1;
        AV.count -= a0;
    }
};
class EV extends AV{
    static funcA(a0: int, a1: int): void {
        AV.funcA(a0, a1);
    }
};
class FV {
    static increment(a0: int, a1: int): void {
        FV.count = 0;
        FV.count += a0;
        FV.count += a1;
    }

    static getCount(): int {
        return FV.count;
    }

    static count: int = 0;
}
class GV {
    public static publicMethod(a0: int, a1: int): void {
        GV.count = 0;
        GV.count += a1;
        GV.count += a0;
    }

    private static privateMethod(a0: int, a1: int): void {
        GV.count = 0;
        GV.count += a1;
        GV.count -= a0;
    }

    static callPrivateMethod(a0: int, a1: int): void {
        GV.privateMethod(a0, a1);
    }

    static getCount(): int {
        return GV.count;
    }

    static count: int = 0;
}

class GetBoolStatic {
    static name: String = "Bob";
    static single: boolean = false;
    static specia1: int = 0;
    static specia3: String = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static specia6: boolean = !'s';
    static specia7: boolean = !0;
    static specia8: boolean = true;
    static specia9: boolean = false;
}

class BoolStaticA extends GetBoolStatic {
    static bool_value: boolean = false;
}

final class BoolStaticFinal extends GetBoolStatic {
    static bool_value: boolean = false;
}

class GetbyteStatic {
    static name: string = "Bob";
    static age: byte = 0;
    static specia2: string = "";
    static specia3: null = null;
    static specia4: undefined  = undefined ;
    static specia5: string = '\n';
    static specia6: string = '\r';
    static specia7: string = '\t';
    static specia8: string = '\b';
    static specia9: string = '\a';
    static specia10: string = '\f';
    static specia11: string = '\v';
    static specia12: string = '\0';
    static byteMin: byte = -128;
    static byteMax: byte = 127;
}

class ByteStaticA extends GetbyteStatic {
    static byte_value: byte = 0;
}

final class ByteStaticFinal extends GetbyteStatic {
    static byte_value: byte = 0;
}

class GetCharStatic {
    static name: char = c'b';
    static age: int = 20;
    static specia2: string = "";
    static specia3: null = null;
    static specia4: undefined  = undefined ;
    static specia5: char = c'\n';
    static specia6: char = c'\r';
    static specia7: char = c'\t';
    static specia8: char = c'\b';
    static specia9: char = c'\a';
    static specia10: char = c'\f';
    static specia11: char = c'\v';
    static specia12: char = c'\0';
    static charMin: char = c'\u0000';
    static charMax: char = c'\uFFFF';
}

class CharStaticA extends GetCharStatic {
    static char_value: char = c'a';
}

final class CharStaticFinal extends GetCharStatic {
    static char_value: char = c'a';
}

class Woman {
    static name: String = "Bob";
    static age: double = 20.0;
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static doubleMin: double = -1.7976931348623157e+308;
    static minpositive: double = 2.2250738585072014e-308;
    static doubleMax: double = 1.7976931348623157e+308;
}

class DoubleStaticA extends Woman {
    static double_value: double = 0.0;
}

final class DoubleStaticFinal extends Woman {
    static double_value: double = 0.0;
}

class GetFloatStatic {
    static name: String = "Bob";
    static age: float = 20.0f;
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static floatMin: float = -3.40282346638528860e+38f;
    static minpositive: float =  1.17549435e-38f;
    static floatMax: float = 3.40282346638528860e+38f;
}

class FloatStaticA extends GetFloatStatic {
    static float_value: float = 0.0f;
}

final class FloatStaticFinal extends GetFloatStatic {
    static float_value: float = 0.0f;
}

class GetIntStatic {
    static name: String = "Bob";
    static age: int = 20;
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static min: int = -2147483648;
    static max: int = 2147483647;
}

class PackstaticA extends GetIntStatic {
    static int_value: int = 0;
}

final class PackstaticFinal extends GetIntStatic {
    static int_value: int = 0;
}

class GetLongStatic {
    static name: String = "Bob";
    static age: long = 20;
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static min: long = -9223372036854775808;
    static max: long = 9223372036854775807;
}

class PackageStaticA extends GetLongStatic {
    static long_value: long = 0;
}

final class PackageStaticFinal extends GetLongStatic {
    static long_value: long = 0;
}

class GetShortStatic {
    static name: String = "Bob";
    static age: short = +20;
    static specia1: int = 0;
    static specia3: string = "";
    static specia4: null = null;
    static specia5: undefined  = undefined ;
    static min: short = -32768;
    static max: short = +32767;
}

class ShortStaticA extends GetShortStatic {
    static short_value: short = 0;
}

final class ShortStaticFinal extends GetShortStatic {
    static short_value: short = 0;
}

class Man {
    static name: String = "Bob";
    static age: int = 2;
}

class BoxStaticA extends Man {
    static int_value: int = 0;
    static string_value: String = "";
}

final class BoxStaticFinal extends Man {
    static int_value: int = 0;
    static string_value: String = "";
}