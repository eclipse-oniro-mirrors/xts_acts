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

class Car {
    constructor(manufacturer: String, model: String, ecoFriendly: boolean, highPerformance: boolean) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): boolean {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: boolean) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: boolean;
    public highPerformance: boolean;
}

function newCarObject() {
    return new Car('Porsche', 'Porsche 911', false, false);
}

interface Iface {
    prop: boolean
}

class C1 implements Iface {
    public prop: boolean = false
}

class C2 implements Iface {
    public classprop: boolean = false

    public get prop(): boolean {
        return this.classprop
    }

    public set prop(p: boolean) {
        this.classprop = p
    }
}

function newC1() {
    return new C1();
}

function newC2() {
    return new C2();
}

class Car1 {
    constructor(manufacturer: String, model: String, ecoFriendly: byte, highPerformance: byte) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): byte {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: byte) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: byte;
    public highPerformance: byte;
}

function newCarObject1() {
    let var1: byte = 0
    let var2: byte = 0
    return new Car1('Porsche', 'Porsche 911', var1, var2);
}

interface Iface1 {
    prop: byte
}

class ClassByte implements Iface1 {
    public prop: byte = 0
}

class ClassByte2 implements Iface1 {
    public classprop: byte = 0

    public get prop(): byte {
        return this.classprop
    }

    public set prop(p: byte) {
        this.classprop = p
    }
}

function newClassByte() {
    return new ClassByte();
}

function newClassByte2() {
    return new ClassByte2();
}

class Car2 {
    constructor(manufacturer: String, model: String, ecoFriendly: char, highPerformance: char) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): char {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: char) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: char;
    public highPerformance: char;
}

function newCarObject2() {
    let var1: char = c'\0'
    let var2: char = c'\0'
    return new Car2('Porsche', 'Porsche 911', var1, var2);
}

interface Iface2 {
    prop: char
}

class ClassChar implements Iface2 {
    public prop: char = c'\0'
}

class ClassChar2 implements Iface2 {
    public classprop: char = c'\0'

    public get prop(): char {
        return this.classprop
    }

    public set prop(p: char) {
        this.classprop = p
    }
}

function newClassChar() {
    return new ClassChar();
}

function newClassChar2() {
    return new ClassChar2();
}

class Car3 {
    constructor(manufacturer: String, model: String, ecoFriendly: double, highPerformance: double) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): double {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: double) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: double;
    public highPerformance: double;
}

function newCarObject3() {
    let var1: double = 0
    let var2: double = 0
    return new Car3('Porsche', 'Porsche 911', var1, var2);
}

interface Iface3 {
    prop: double
}

class ClassDouble implements Iface3 {
    public prop: double = 0
}

class ClassDouble2 implements Iface3 {
    public classprop: double = 0

    public get prop(): double {
        return this.classprop
    }

    public set prop(p: double) {
        this.classprop = p
    }
}

function newClassDouble() {
    return new ClassDouble();
}

function newClassDouble2() {
    return new ClassDouble2();
}

class Car4 {
    constructor(manufacturer: String, model: String, ecoFriendly: float, highPerformance: float) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): float {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: float) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: float;
    public highPerformance: float;
}

function newCarObject4() {
    let var1: float = 0
    let var2: float = 0
    return new Car4('Porsche', 'Porsche 911', var1, var2);
}

interface Iface4 {
    prop: float
}

class ClassFloat implements Iface4 {
    public prop: float = 0
}

class ClassFloat2 implements Iface4 {
    public classprop: float = 0

    public get prop(): float {
        return this.classprop
    }

    public set prop(p: float) {
        this.classprop = p
    }
}

function newClassFloat() {
    return new ClassFloat();
}

function newClassFloat2() {
    return new ClassFloat2();
}

class Car5 {
    constructor(manufacturer: String, model: String, ecoFriendly: int, highPerformance: int) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): int {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: int) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: int;
    public highPerformance: int;
}

function newCarObject5() {
    let var1: int = 0
    let var2: int = 0
    return new Car5('Porsche', 'Porsche 911', var1, var2);
}

interface Iface5 {
    prop: int
}

class ClassInt implements Iface5 {
    public prop: int = 0
}

class ClassInt2 implements Iface5 {
    public classprop: int = 0

    public get prop(): int {
        return this.classprop
    }

    public set prop(p: int) {
        this.classprop = p
    }
}

function newClassInt() {
    return new ClassInt();
}

function newClassInt2() {
    return new ClassInt2();
}

class Car6 {
    constructor(manufacturer: String, model: String, ecoFriendly: long, highPerformance: long) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): long {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: long) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: long;
    public highPerformance: long;
}

function newCarObject6() {
    let var1: long = 0
    let var2: long = 0
    return new Car6('Porsche', 'Porsche 911', var1, var2);
}

interface Iface6 {
    prop: long
}

class ClassLong implements Iface6 {
    public prop: long = 0
}

class ClassLong2 implements Iface6 {
    public classprop: long = 0

    public get prop(): long {
        return this.classprop
    }

    public set prop(p: long) {
        this.classprop = p
    }
}

function newClassLong() {
    return new ClassLong();
}

function newClassLong2() {
    return new ClassLong2();
}

class Car7 {
    constructor(manufacturer: String, model: String, ecoFriendly: short, highPerformance: short) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: String) {
        this.model2 = model;
    }

    get ecoFriendly(): short {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: short) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: String;
    private model2: String;
    private ecoFriendly2: short;
    public highPerformance: short;
}

function newCarObject7() {
    let var1: short = 0
    let var2: short = 0
    return new Car7('Porsche', 'Porsche 911', var1, var2);
}

interface Iface7 {
    prop: short
}

class ClassShort implements Iface7 {
    public prop: short = 0
}

class ClassShort2 implements Iface7 {
    public classprop: short = 0

    public get prop(): short {
        return this.classprop
    }

    public set prop(p: short) {
        this.classprop = p
    }
}

function newClassShort() {
    return new ClassShort();
}

function newClassShort2() {
    return new ClassShort2();
}

class Car8 {
    constructor(manufacturer: int, model: int, ecoFriendly: String, highPerformance: String) {
        this.manufacturer = manufacturer;
        this.model2 = model;
        this.ecoFriendly2 = ecoFriendly;
        this.highPerformance = highPerformance;
    }

    set model(model: int) {
        this.model2 = model;
    }

    get ecoFriendly(): String {
        return this.ecoFriendly2;
    }

    set ecoFriendly(ecoFriendly: String) {
        this.ecoFriendly2 = ecoFriendly;
    }

    public manufacturer: int;
    private model2: int;
    private ecoFriendly2: String;
    public highPerformance: String;
}

function newCarObject8() {
    let var1: String = 'Porsche';
    let var2: String = 'Porsche 911';
    return new Car8(0, 0, var1, var2);
}

interface Iface8 {
    prop: String
}

class ClassRef implements Iface8 {
    public prop: String = 'Default'
}

class ClassRef2 implements Iface8 {
    public classprop: String = 'Default';

    public get prop(): String {
        return this.classprop
    }

    public set prop(p: String) {
        this.classprop = p
    }
}

function newClassRef() {
    return new ClassRef();
}

function newClassRef2() {
    return new ClassRef2();
}