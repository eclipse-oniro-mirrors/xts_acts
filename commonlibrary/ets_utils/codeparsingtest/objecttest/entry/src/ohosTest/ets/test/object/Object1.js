/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export const result1 = Object();

export const result2 = Object(null);

export const result3 = Object(undefined);

export const originalObj4 = { name: 'test', age: 20 };

export const result4 = Object(originalObj4);

export const originalArr5 = [10, 20, 30];

export const result5 = Object(originalArr5);

export function originalFn6(a, b) {
    return a + b;
}

export const result6 = Object(originalFn6);


export const originalBigInt7 = 456n;

export const result7 = Object(originalBigInt7);

export const originalSymbol8 = Symbol('demo');

export const result8 = Object(originalSymbol8);

export const result8_1 = result8.valueOf();

export const originalNum9 = 789;

export const result9 = Object(originalNum9);

export const originalStr10 = 'javascript';

export const result10 = Object(originalStr10);

export const originalBool11 = true;

export const result11 = Object(originalBool11);

export const originalBool12 = false;

export const result12 = Object(originalBool12);

export const originalDate13 = new Date('2024-01-01');

export const result13 = Object(originalDate13);

export const originalRegExp14 = /test/g;

export const result14 = Object(originalRegExp14);

export const originalMap15 = new Map([['key1', 'val1']]);

export const result15 = Object(originalMap15);

export const originalSet16 = new Set(['val1']);

export const result16 = Object(originalSet16);

export const originalTypedArr17 = new Uint8Array([1, 2]);

export const result17 = Object(originalTypedArr17);

export const originalObj18 = Object.create(null);

export function Fn18() {
    originalObj18.prop = 'test';
}

export const result18 = Object(originalObj18);

export const originalObj19 = { a: { b: 10 } };

export const result19 = Object(originalObj19);

export const originalArr20 = [];

export const result20 = Object(originalArr20);

export function Fn21() {
}

export function Fn21_1() {
    Fn21.prototype.method = () => 'test';
}

export const result21 = Object(Fn21);


export const originalNumObj22 = new Number(123);

export const result22 = Object(originalNumObj22);


export const originalStrObj23 = new String('test');

export const result23 = Object(originalStrObj23);

export const originalBoolObj24 = new Boolean(true);

export const result24 = Object(originalBoolObj24);

const originalBigInt25 = 987n;

export const wrappedBigInt25 = Object(originalBigInt25);

export const result25 = Object(wrappedBigInt25);

export const originalSymbol26 = Symbol('sym26');

export const wrappedSymbol26 = Object(originalSymbol26);

export const result26 = Object(wrappedSymbol26);

export const obj127 = { x: 1 };

export const obj227 = { y: 2 };

export const originalArr27 = [obj127, obj227];

export const result27 = Object(originalArr27);

export function getObj28() {
    return { prop: 'val' };
}

export const result28 = Object(getObj28);

export const originalObj29 = Object.freeze({ a: 1 });

export const result29 = Object(originalObj29);

export const result29_1 = Object.isFrozen(result29);

export const originalObj30 = Object.seal({ b: 2 });

export const result30 = Object(originalObj30);

export const result30_1 = Object.isSealed(result30);

export const originalObj31 = {};

export function Fn31() {
    Object.defineProperty(originalObj31, 'nonEnum', { value: 3, enumerable: false });
}

export const result31 = Object(originalObj31);


export const originalObj32 = {};

export function Fn32() {
    Object.defineProperty(originalObj32, 'readOnly', { value: 4, writable: false });
}

export const result32 = Object(originalObj32);

export const symKey33 = Symbol('key33');

export const originalObj33 = { [symKey33]: 'symVal' };

export const result33 = Object(originalObj33);

export const result3_1 = Object.getOwnPropertySymbols(result33).includes(symKey33)

export const originalNum34 = 999999999999999;

export const result34 = Object(originalNum34);

export const originalNum35 = -456;

export const result35 = Object(originalNum35);

export const originalNum36 = 3.1415;

export const result36 = Object(originalNum36);

export const originalStr37 = '';

export const result37 = Object(originalStr37);

export const originalStr38 = '!@#$%^&*()';

export const result38 = Object(originalStr38);

export const originalMap39 = new Map([['k1', 'v1'], ['k2', 'v2'], ['k3', 'v3']]);

export const result39 = Object(originalMap39);

export const originalSet40 = new Set(['v1', 'v2', 'v1', 'v3']);

export const result40 = Object(originalSet40);

export const originalTypedArr41 = new Uint32Array([100, 200, 300]);

export const result41 = Object(originalTypedArr41);

export const originalArr42 = [1, [2, 3], [4, [5]]];

export const result42 = Object(originalArr42);

export function Fn43() {
}

export function Fn43_1() {
    Fn43.staticProp = 'staticVal';
}

export const result43 = Object(Fn43);

export const originalDate44 = new Date();

export const result44 = Object(originalDate44);

export const originalRegExp45 = /abc/gi;

export const result45 = Object(originalRegExp45);


export const keyObj46 = {};

export const originalWeakMap46 = new WeakMap();

export function Fn46() {
    originalWeakMap46.set(keyObj46, 'weakVal');
}

export const result46 = Object(originalWeakMap46);


export const elemObj47 = {};

export const originalWeakSet47 = new WeakSet();

export function Fn47() {
    originalWeakSet47.add(elemObj47);
}

export const result47 = Object(originalWeakSet47);


export const parentObj48 = { parentProp: 'parentVal' };

export const originalObj48 = Object.create(parentObj48);

export function Fn48() {
    originalObj48.childProp = 'childVal';
}

export const result48 = Object(originalObj48);


export function calculate49(a, b, c) {
    return a + b * c;
}

export const result49 = Object(calculate49);

export const originalBigInt50 = 98765432109876543210n;

export const result50 = Object(originalBigInt50);

export const originalSymbol51 = Symbol('');

export const result51 = Object(originalSymbol51);

export const originalBoolObj52 = new Boolean(false);

export const result52 = Object(originalBoolObj52);

export const originalObj53 = {
    _num: 10,
    get doubleNum() {
        return this._num * 2;
    }
};

export function Fn53() {
    originalObj53._num = 20;
}

export const result53 = Object(originalObj53);


export const originalObj54 = {
    _name: '',
    set fullName(name) {
        this._name = name;
    }
};

export const result54 = Object(originalObj54);

export function Fn54() {
    result54.fullName = 'Test User';
}


export const originalTypedArr55 = new Float32Array([1.1, 2.2, 3.3]);

export const result55 = Object(originalTypedArr55);

export const originalTypedArr56 = new Float64Array([0.1, 0.2, 0.3]);

export const result56 = Object(originalTypedArr56);

export const originalStr57 = '🌍 Unicode 测试';

export const result57 = Object(originalStr57);

export const key1 = { id: 1 };

export const key2 = { id: 2 };

export const originalMap58 = new Map([[key1, 'val1'], [key2, 'val2']]);

export const result58 = Object(originalMap58);

export const elem159 = { id: 1 };

export const elem259 = { id: 2 };

export const originalSet59 = new Set([elem159, elem259]);

export const result59 = Object(originalSet59);

export const timestamp61 = 1620000000000;

export const originalDate61 = new Date(timestamp61);

export const result61 = Object(originalDate61);

export const originalRegExp62 = /\d+/;

export const result62 = Object(originalRegExp62);

export const keyA63 = {};

export const keyB63 = {};

export const originalWeakMap63 = new WeakMap();

export function Fn63() {
    originalWeakMap63.set(keyA63, 'valA');
    originalWeakMap63.set(keyB63, 'valB');
}

export const result63 = Object(originalWeakMap63);

export const elemX = {};

export const elemY = {};


export function Fn64() {
    let list = new Array();
    const originalWeakSet64 = new WeakSet();
    originalWeakSet64.add(elemX);
    originalWeakSet64.add(elemY);
    const result64 = Object(originalWeakSet64);
    const result64_1 = result64.has(elemX);
    const result64_2 = result64.has(elemY);
    list.push(result64_1);
    list.push(result64_2);
    list.push(result64);
    return list;
}


export const propName65 = 'computedProp';

export const originalObj65 = { [propName65]: 'computedVal' };

export const result65 = Object(originalObj65);

export const result65_1 = result65[propName65];

export const originalArr66 = [123, 'test', true, null, undefined, 456n];

export const result66 = Object(originalArr66);

export function sum67(...nums) {
    return nums.reduce((a, b) => a + b, 0);
}

export const result67 = Object(sum67);

export const originalBigInt68 = 123n * 456n;

export const result68 = Object(originalBigInt68);

export const originalSymbol69 = Symbol.for('sharedSym');

export const result69 = Object(originalSymbol69);

export const result69_2 = Symbol.keyFor(result69.valueOf());

export const result69_1 = Symbol.for('sharedSym');

export const originalArr71 = Object.freeze([1, 2, 3]);

export const result71 = Object(originalArr71);


export const result71_1 = Object.isFrozen(result71);


export const originalArr72 = Object.seal([4, 5, 6]);

export const result72 = Object(originalArr72);

export const result72_1 = Object.isSealed(result72)


export const originalStr73 = '  leading and trailing spaces  ';

export const result73 = Object(originalStr73);

export const originalNum74 = Infinity;

export const result74 = Object(originalNum74);

export const originalNum75 = NaN;

export const result75 = Object(originalNum75);


export const originalMap76 = new Map([['k1', 'v1'], ['k2', 'v2']]);

export function fn76() {
    originalMap76.clear();
}

export const result76 = Object(originalMap76);

export const originalSet77 = new Set(['v1', 'v2', 'v3']);

export function fn77() {
    originalSet77.clear();
}

export const result77 = Object(originalSet77);

export const originalTypedArr78 = new Uint16Array([256, 512, 1024]);

export const result78 = Object(originalTypedArr78);

export function* numberGenerator79() {
    yield 1;
    yield 2;
    yield 3;
}

export const result79 = Object(numberGenerator79);

export const generator = result79();

export const futureTimestamp80 = 1717200000000;

export const originalDate80 = new Date(futureTimestamp80);

export const result80 = Object(originalDate80);

export const originalRegExp81 = /[\.\*\?\+\(\)]/;

export const result81 = Object(originalRegExp81);

export const originalObj82 = {
    name: 'Test',
    greet() {
        return `Hello, ${this.name}`;
    }
};

export const result82 = Object(originalObj82);

export const originalArr83 = [1, , 3];

export const result83 = Object(originalArr83);

export const originalBigInt84 = -789n;

export const result84 = Object(originalBigInt84);

export const symKey85 = Symbol('key85');

export const originalObj85 = { [symKey85]: 'symVal85' };

export const result85 = Object(originalObj85);

export const result85_1 = Object.getOwnPropertySymbols(result85);

export const originalTypedArr87 = new Float32Array([-1.5, -2.75, 3.125]);

export const result87 = Object(originalTypedArr87);

export const originalStr88 = '12345';

export const result88 = Object(originalStr88);

export const result88_1 = result88.valueOf();


export const obj192 = { val: 10 };

export const obj292 = { val: 20 };

export const originalArr92 = [obj192, obj292];

export const result92 = Object(originalArr92);


export function greet93(name = 'Guest') {
    return `Hello, ${name}`;
}

export const result93 = Object(greet93);

export const originalDate94 = new Date('invalid-date-string');

export const result94 = Object(originalDate94);

export const originalSymbol95 = Symbol.iterator;

export const result95 = Object(originalSymbol95);

export const originalTypedArr96 = new Uint8ClampedArray([256, -1, 128]);

export const result96 = Object(originalTypedArr96);

export const bigIntKey98 = 12345n;

export const originalMap98 = new Map([[bigIntKey98, 'bigIntVal']]);

export const result98 = Object(originalMap98);

export function createWeakMap99() {
    const wm = new WeakMap();
    wm.set({}, 'weakVal');
    return wm;
}

export const result99 = Object(createWeakMap99);

export const weakMapResult99 = result99();

export const originalStr100 = 'line1\nline2\r\nline3';

export const result100 = Object(originalStr100);