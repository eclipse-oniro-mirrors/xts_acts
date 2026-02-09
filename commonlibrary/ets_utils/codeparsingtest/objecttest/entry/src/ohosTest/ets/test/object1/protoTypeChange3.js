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

export function protoTypeChange3Test() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Int32Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test1() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);

    console.log('--- Before prototype change ---');
    let result = [];
    result.push(x.map.__proto__ === Function.prototype ? 'Int8Array.prototype' : '');
    const resultNormal = x.map(v => v * 2);
    result.push(resultNormal);
    result.push(resultNormal.constructor.name);

    x.__proto__ = y;

    console.log('--- After prototype change ---');
    result.push(x.map === Array.prototype.map ? 'Array.prototype' : '');

    const resultPolluted = x.map(v => v * 2);
    result.push(resultPolluted);
    result.push(resultPolluted.constructor.name);

    x.map(function (v, i, array) {
        result.push(this === x);
        result.push(array === x);
    });
    return result;
}

export function protoTypeChange3Test2() {
    const smallArr = new Array(10);
    const mediumArr = new Array(500);
    const largeArr = new Array(1000);

    function timedTailRecursive(args) {
        if (args.length === 0) {
            return;
        }

        const nextArgs = args.slice(1);
        if (nextArgs.length % 100 === 0) {
            console.log(`Recursing with ${nextArgs.length} arguments left...`);
        }

        return timedTailRecursive(nextArgs);
    }

    console.log('--- Testing large argument list (Tail Recursion) ---');
    console.time('Large args (Tail)');
    timedTailRecursive(largeArr);
    console.timeEnd('Large args (Tail)');

    console.log('--- Testing medium argument list ---');
    console.time('Medium args');
    timedTailRecursive(mediumArr);
    console.timeEnd('Medium args');

    console.log('--- Testing large argument list ---');
    console.time('Large args');
    timedTailRecursive(smallArr);
    console.timeEnd('Large args');
    return true;
}

export function protoTypeChange3Test3() {
    const arr = new Array(10000);
    let catchOverflow = false;

    function tailRecursive(index) {
        if (index >= arr.length) {
            return;
        }
        return tailRecursive(index + 1);
    }

    function iterative() {
        for (let i = 0; i < arr.length; i++) {
        }
    }

    function chunkedProcessing(index = 0, chunkSize = 1000) {
        const end = Math.min(index + chunkSize, arr.length);
        for (let i = index; i < end; i++) {
        }
        if (end < arr.length) {
            setTimeout(() => chunkedProcessing(end, chunkSize), 0);
        }
    }

    console.log('--- Testing safe tail recursion ---');
    console.time('Tail Recursion');
    try {
        tailRecursive(0);
    } catch (e) {
        console.error('Tail recursion still overflowed:', e.message);
    }
    console.timeEnd('Tail Recursion');

    console.log('--- Testing simple loop ---');
    console.time('Loop');
    iterative();
    console.timeEnd('Loop');

    console.log('--- Testing chunked processing ---');
    console.time('Chunked');
    chunkedProcessing();
    console.timeEnd('Chunked');
    console.log('Chunked processing started.');
    return true;
}

export function protoTypeChange3Test4() {
    const x = new Int8Array(1);
    const y = new Int32Array(1);
    const z = new Int8Array(1);
    let result = [];

    console.log('--- Before modifying x\'s proto ---');
    result.push(x.map === Int8Array.prototype.map);
    result.push(z.map === Int8Array.prototype.map);
    x.__proto__ = y;

    console.log('--- After modifying x\'s proto ---');
    result.push(x.map === Array.prototype.map);
    result.push(z.map === Int8Array.prototype.map);
    result.push(Int8Array.prototype.map === Array.prototype.map);
    return result;
}

export function protoTypeChange3Test5() {
    const x = new Int8Array([10, 20, 30]);
    const y = new Int32Array(3);
    x.__proto__ = y;

    console.log('--- Testing map callback parameters ---');
    x.map((value, index, array) => {
        console.log(`Callback at index ${index}:`);
        console.log(`  - Value: ${value} (type: ${typeof value})`);
        console.log(`  - Index: ${index}`);
        console.log(`  - Array: ${array} (type: ${array.constructor.name})`);
        console.log(`  - Is 'array' the same as 'x'? ${array === x}`);
    });
    return true;
}

export function protoTypeChange3Test6() {
    const x = new Int8Array([1, 2, 3]);

    const xProxy = new Proxy(x, {
        get(target, prop, receiver) {
            const value = Reflect.get(target, prop);

            if (typeof value === 'function') {
                console.log(`--- Proxy: Method '${prop}' is being accessed, binding 'this' to the original target ---`);
                return value.bind(target);
            }

            if (prop === '__proto__') {
                console.log(`--- Proxy: Someone is trying to access the prototype of the Int8Array ---`);
            }

            return value;
        }
    });

    console.log('--- Testing the FIXED monitoring proxy ---');
    let result = [];
    result.push(xProxy.length);
    const mappedArray = xProxy.map(v => v * 2);
    console.log('Result of xProxy.map:', mappedArray);
    result.push(xProxy.__proto__ === Int8Array.prototype);
    return result;
}

export function protoTypeChange3Test7() {
    const size = 10000;
    const x = new Int8Array(size);
    const y = new Int32Array(size);

    for (let i = 0; i < size; i++) {
        x[i] = i % 128;
    }

    console.log(`--- Testing performance with ${size.toLocaleString()} elements ---`);

    console.time('Native map');
    x.map(v => v * 2);
    console.timeEnd('Native map');

    x.__proto__ = y;

    console.time('Polluted map');
    x.map(v => v * 2);
    console.timeEnd('Polluted map');
    return true;
}

export function protoTypeChange3Test8() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array(3);
    x.__proto__ = y.prototype;

    const contextObject = { multiplier: 10 };

    console.log('--- Testing explicit this binding in map ---');

    const result = x.map(function (v) {
        return v * this.multiplier;
    }, contextObject);

    console.log('Result using explicit this:', result);
    return true;
}

export function protoTypeChange3Test9() {
    const x = new Int8Array([1, 2, 3]);

    const xProxy = new Proxy(x, {
        get(target, prop, receiver) {
            console.log(`Proxy: Accessing property '${prop}'`);

            const value = Reflect.get(target, prop);

            if (typeof value === 'function') {
                console.log(`Proxy: Found method '${prop}', binding 'this' to original target.`);
                return value.bind(target);
            }

            return value;
        }
    });

    console.log('--- Testing this in map with FIXED Proxy ---');

    xProxy.map(function (value, index, array) {
        console.log(`Callback at index ${index}:`);
        console.log(`  - this is original x? ${this === x}`);
        console.log(`  - array is original x? ${array === x}`);
    });
    return true;
}

export function protoTypeChange3Test10() {
    const x = new Int8Array([100, 150]);

    console.log('Original Int8Array:', x);

    console.log('--- Using Int8Array.prototype.map ---');
    const nativeResult = x.map(v => v * 2);
    console.log('Native map result:', nativeResult);
    console.log('Native map result type:', nativeResult.constructor.name);

    const y = new Int32Array(2);
    x.__proto__ = y;

    console.log('--- Using Array.prototype.map ---');
    const arrayResult = x.map(v => v * 2);
    console.log('Array map result:', arrayResult);
    console.log('Array map result type:', arrayResult.constructor.name);

    const x2 = new Int8Array([10, 20]);
    x2.__proto__ = y;
    const arrayResult2 = x2.map(v => v * 2);
    console.log('Array map result without overflow:', arrayResult2);
    return true;
}

export function protoTypeChange3Test11() {
    const buffer = new ArrayBuffer(16);

    const int32View = new Int32Array(buffer);
    const float64View = new Float64Array(buffer);
    const uint8View = new Uint8Array(buffer);
    let result = [];
    console.log('--- Testing TypedArray buffer sharing ---');
    result.push(int32View.length);
    result.push(float64View.length);
    result.push(uint8View.length);

    int32View[0] = 100;
    result.push(float64View[0]);
    result.push(uint8View.subarray(0, 4));

    function processDataFast(uint8Array) {
        const buffer = uint8Array.buffer;
        const view = new DataView(buffer);
        let sum = 0;
        for (let i = 0; i < uint8Array.length; i += 2) {
            sum += view.getUint16(i, true);
        }
        return sum;
    }
    result.push(processDataFast(uint8View));
    return result;
}

export function protoTypeChange3Test12() {
    const size = 100000;
    const iterations = 100;

    console.time('Creating new arrays');
    for (let i = 0; i < iterations; i++) {
        const tempArray = new Int32Array(size);
        tempArray[0] = i;
    }
    console.timeEnd('Creating new arrays');

    console.time('Reusing single array');
    const reusableArray = new Int32Array(size);
    for (let i = 0; i < iterations; i++) {
        reusableArray[0] = i;
    }
    console.timeEnd('Reusing single array');
    return true;
}

export function protoTypeChange3Test13() {
    const x = new Int8Array(1);
    const y = new Int32Array(1);

    console.log('--- Testing Reflect for prototype operations ---');
    let result = [];

    result.push(Reflect.getPrototypeOf(x).constructor.name);

    Reflect.setPrototypeOf(x, y);
    result.push(Reflect.getPrototypeOf(x).constructor.name);
    result.push(Reflect.isExtensible(x));

    const frozenObj = Object.freeze({});
    result.push(Reflect.isExtensible(frozenObj));

    try {
        Reflect.setPrototypeOf(frozenObj, Array.prototype);
    } catch (e) {
        console.error('Error setting prototype of frozen object:', e.name, e.message);
    }
    return result;
}

export function protoTypeChange3Test14() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    y.customProp = 'I am a property of y instance';
    let result = [];

    console.log('--- Before prototype change ---');
    result.push(x.customProp);
    x.__proto__ = y;

    console.log('--- After prototype change ---');
    result.push(x.customProp);

    y.customProp = 'I have been modified';
    result.push(x.customProp);

    x.customProp = 'Trying to overwrite';
    result.push(x.customProp);
    result.push(y.customProp);
    return result;
}

export function protoTypeChange3Test15() {
    const x = new Int8Array([1, 2, 3]);
    let result = [];
    console.log('--- Before prototype change ---');
    result.push(x.includes(2));
    const y = new Int32Array(3);
    x.__proto__ = y;

    console.log('--- After prototype change ---');
    try {
        result.push(x.includes(2));
    } catch (e) {
        console.error('Error calling x.includes:', e.name, e.message);
    }

    result.push(x.constructor.name);
    return result;
}

export function protoTypeChange3Test16() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array(3);
    let result = [];
    console.log('--- Before prototype change ---');
    result.push(x instanceof Int8Array);
    result.push(x instanceof Int32Array);

    x.__proto__ = y;

    console.log('--- After prototype change ---');
    result.push(x instanceof Int8Array);
    result.push(x instanceof Int32Array);
    return result;
}

export function protoTypeChange3Test17() {
    const y = new Int32Array([10, 11, 12]);

    const objCreatedFromY = Object.create(y);
    let result = [];

    console.log('--- Testing Object.create ---');
    result.push(Object.getPrototypeOf(objCreatedFromY) === y);
    result.push(objCreatedFromY instanceof Int32Array);
    return result;
}

export function protoTypeChange3Test18() {
    const x = new Int8Array(1);
    const y = new Int32Array(1);

    console.time('Direct prototype access');
    for (let i = 0; i < 1000; i++) {
        const mapFunc = x.map;
    }
    console.timeEnd('Direct prototype access');

    x.__proto__ = y;

    console.time('Dynamic prototype access');
    for (let i = 0; i < 1000; i++) {
        const mapFunc = x.map;
    }
    console.timeEnd('Dynamic prototype access');
    return true;
}

export function protoTypeChange3Test19() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);

    x.__proto__ = y;

    console.log('--- Testing `this` binding ---');
    let result = [];

    x.map(function (value, index) {
        console.log(`In map callback at index ${index}:`);
        result.push(this === x);
        result.push(this === y);
    });

    const joinedString = x.join(', ');
    result.push(joinedString);
    return result;
}

export function protoTypeChange3Test20() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    y.customProp = 'I am enumerable';
    let result = [];

    console.log('--- Before prototype change ---');
    console.log('for...in on x (before):');
    for (const key in x) {
        console.log(`  - ${key}`);
    }

    x.__proto__ = y;

    console.log('--- After prototype change ---');
    console.log('for...in on x (after):');
    for (const key in x) {
        console.log(`  - ${key}`);
    }

    result.push(Object.keys(x));
    result.push(Object.getOwnPropertyNames(x));
    return result;
}

export function protoTypeChange3Test21() {
    const x = new Int8Array(0);
    const y = new Int32Array(0);
    Object.freeze(y);
    Object.freeze(Int32Array.prototype);
    console.log('--- Trying to modify a frozen object ---');
    try {
        y.newProp = 'test';
    } catch (e) {
        console.error('Error modifying frozen y:', e.name, e.message);
    }
    console.log('--- Trying to set prototype to a frozen object ---');
    try {
        x.__proto__ = y;
        console.log('Successfully set x\'s proto to a frozen y.');
    } catch (e) {
        console.error('Error setting prototype to frozen y:', e.name, e.message);
        return false
    }
    try {
        x.__proto__.customMethod = () => console.log('hacked');
    } catch (e) {
        console.error('Error adding method to frozen prototype:', e.name, e.message);
    }
    return true;
}

export function protoTypeChange3Test22() {
    'use strict';
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    x.__proto__ = y;
    console.log('--- Testing this binding in strict mode ---');
    x.map(function (value, index) {
        console.log(`In strict mode map callback at index ${index}:`);
        console.log(`  - this is x? ${this === x}`); // 输出: true
        console.log(`  - this is a primitive? ${typeof this !== 'object' && typeof this !== 'function'}`); // 输出: false
    });

    function strictFunction() {
        console.log(`Inside strict function, this is: ${this}`);
    }

    y.strictMethod = strictFunction;
    x.strictMethod();
    return true;
}

export function protoTypeChange3Test23() {
    const sym = Symbol('my_unique_symbol');
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    y[sym] = 'This is a symbol property';
    console.log('--- Before prototype change ---');
    console.log('x has symbol property?', sym in x);
    x.__proto__ = y.prototype;
    console.log('--- After prototype change ---');
    console.log('x has symbol property now?', sym in x);
    console.log('x[sym]:', x[sym]);
    console.log('for...in on x (looking for symbol):');
    for (const key in x) {
        console.log(`  - ${key}`);
    }
    console.log('Object.keys(x):', Object.keys(x));
    console.log('Object.getOwnPropertySymbols(x):', Object.getOwnPropertySymbols(x));
    console.log('Object.getOwnPropertySymbols(Object.getPrototypeOf(x)):',
        Object.getOwnPropertySymbols(Object.getPrototypeOf(x)));
    return true;
}

export function protoTypeChange3Test24() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    console.log('--- Borrowing methods correctly ---');
    const resultWithCall = Array.prototype.map.call(x, v => v * 2);
    console.log('Result using Array.prototype.map.call:', resultWithCall);
    console.log('Type of result:', resultWithCall.constructor.name);
    const resultWithApply = Array.prototype.map.apply(x, [v => v * 3]);
    console.log('Result using Array.prototype.map.apply:', resultWithApply);
    const resultWithReflect = Reflect.apply(Array.prototype.map, x, [v => v * 4]);
    console.log('Result using Reflect.apply:', resultWithReflect);
    console.log('x.map is still from Int8Array.prototype:', x.map === Int8Array.prototype.map);
    return true;
}

export function protoTypeChange3Test25() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array([10, 11, 12]);
    y.customProp = 'I am from y';
    const xProxy = new Proxy(x, {
        get(target, prop, receiver) {
            console.log(`Proxy GET trap: accessing '${prop}'`);

            const value = Reflect.get(target, prop);
            if (typeof value === 'function') {
                return value.bind(target);
            }
            return value;
        }
    });
    console.log('--- Before prototype change ---');
    let result = [];
    result.push(xProxy.length);
    console.log('\n--- Changing x\'s prototype ---');
    x.__proto__ = y;

    console.log('\n--- After prototype change ---');
    result.push(xProxy.customProp);
    console.log('\n--- Calling a stolen method on the proxy ---');
    const mapped = xProxy.map(v => v * 2);
    result.push(mapped.length);
    return result;
}

function simulateReactSetState(state, newState) {
    console.log('--- Simulating React setState ---');
    console.log('Old state:', state);
    const stateHasChanged = Object.keys(newState).some(key => state[key] !== newState[key]);
    if (stateHasChanged) {
        console.log('State has changed. Triggering re-render...');
        for (const key in newState) {
            state[key] = newState[key];
        }
    } else {
        console.log('State has not changed. No re-render.');
    }
    console.log('New state:', state);
    return state;
}

export function protoTypeChange3Test26() {
    const myComponentState = { count: 0, message: 'Hello' };
    const maliciousObject = { isAdmin: true };
    console.log('--- Before prototype pollution ---');
    simulateReactSetState(myComponentState, { count: 1 });
    console.log('\n--- Performing prototype pollution on state ---');
    Object.setPrototypeOf(myComponentState, maliciousObject);
    console.log('\n--- After prototype pollution ---');
    simulateReactSetState(myComponentState, { message: 'Hi' });
    return true;
}

export function protoTypeChange3Test27() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array(3);
    const xProxy = new Proxy(x, {
        set(target, prop, value, receiver) {
            if (prop === '__proto__') {
                throw new TypeError('Modifying __proto__ of x is not allowed');
            }
            return Reflect.set(target, prop, value, receiver);
        }
    });
    try {
        xProxy.__proto__ = y;
    } catch (e) {
        console.log('Error changing prototype (Proxy intercepted):', e.message);
    }
    xProxy[0] = 10;
    return xProxy[0];
}

export function protoTypeChange3Test28() {
    const grandparent = { gpProp: 'grandparent' };
    const parent = Object.create(grandparent);
    parent.pProp = 'parent';
    const child = Object.create(parent);
    child.cProp = 'child';
    const x = { ownProp: 'x-own' };
    console.log('--- Testing Prototype Chain Lookup Performance ---');
    console.time('Short chain (x -> Object.prototype)');
    for (let i = 0; i < 10_00; i++) {
        const own = x.ownProp;
        const hasOwn = x.hasOwnProperty('ownProp');
    }
    console.timeEnd('Short chain (x -> Object.prototype)');
    x.__proto__ = child;
    console.time('Long chain (x -> child -> parent -> grandparent)');
    for (let i = 0; i < 10_00; i++) {
        const own = x.ownProp;
        const gp = x.gpProp;
    }
    console.timeEnd('Long chain (x -> child -> parent -> grandparent)');
    console.time('Non-existent property lookup');
    for (let i = 0; i < 1000; i++) {
        const nonExistent = x.noSuchProp;
    }
    console.timeEnd('Non-existent property lookup');
    return true;
}

export function protoTypeChange3Test29() {
    const x = new Int8Array([10, 20, 30]);
    const y = new Int32Array([100, 200]);
    let result = [];
    console.log('--- Before prototype change (x is Int8Array) ---');
    console.log('x.buffer (Int8Array buffer):', x.buffer);
    result.push(x.buffer.byteLength);
    result.push(x.byteOffset);
    result.push(x.byteLength);
    result.push(x.hasOwnProperty('buffer'));
    x.__proto__ = y;
    console.log('\n--- After prototype change (x.__proto__ = y) ---');
    result.push(x.buffer.byteLength);
    result.push(x.byteOffset);
    result.push(x.byteLength);
    result.push(x.constructor === Int32Array);
    result.push(x.set === Int32Array.prototype.set);
    try {
        x.set([400]);
    } catch (e) {
        console.error('Error calling x.set (Int32Array method):', e.message);
    }
    return result;
}

export function protoTypeChange3Test30() {
    const x = new Int8Array([1, 2]);
    const y = new Int32Array([3, 4]);

    function logPrototypeChain(obj, name) {
        const chain = [];
        let current = obj;
        while (current !== null) {
            const typeStr = Object.prototype.toString.call(current);
            const type = typeStr.slice(8, -1);
            const valueStr = Array.isArray(current) || ArrayBuffer.isView(current) ? Array.from(current).toString() :
            JSON.stringify(current);
            chain.push(`[${type}] ${valueStr}`);
            current = Reflect.getPrototypeOf(current);
        }
        console.log(`${name} prototype chain:`, chain.join(' -> '));
    }

    console.log('--- Initial State ---');
    logPrototypeChain(x, 'x');
    const isChanged = Reflect.setPrototypeOf(x, y);
    console.log('\n--- After Reflect.setPrototypeOf(x, y) ---');
    console.log('Prototype change successful?', isChanged);
    logPrototypeChain(x, 'x');
    y.yProp = 'from y';
    console.log('\nx.yProp (from y\'s own property):', x.yProp);

    const nonExtensibleX = Object.preventExtensions(x);
    console.log('\n--- Trying to change prototype of non-extensible x ---');
    const isChangedAgain = Reflect.setPrototypeOf(nonExtensibleX, Object.prototype);
    console.log('Second prototype change successful?', isChangedAgain);
    logPrototypeChain(nonExtensibleX, 'non-extensible x');
    return true;
}

export function protoTypeChange3Test31() {
    const x = new Int8Array([1, 2, 3]);
    const y = new Int32Array(3);
    let result = [];
    try {
        x.__proto__ = y;
        result.push(x.__proto__ === y);
    } catch (e) {
        console.error('❌ Error changing prototype:', e.message);
    }
    const buffer = x.buffer;
    try {
        Object.seal(buffer);
        result.push(Object.isSealed(buffer));
    } catch (e) {
        console.error('❌ Error sealing buffer:', e.message);
    }
    try {
        x[0] = 100;
    } catch (e) {
        console.error('\n❌ Cannot modify element (buffer sealed):', e.message);
    }
    const z = new Int8Array(5);
    try {
        x.__proto__ = z;
        result.push(x.__proto__ === z);
    } catch (e) {
        console.error('❌ Error changing prototype again:', e.message);
    }
    return result;
}

export function protoTypeChange3Test32() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Uint8Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test33() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Uint8ClampedArray(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test34() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Int16Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test35() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Uint16Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test36() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Uint32Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test37() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Float32Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test38() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new Float64Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test39() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new BigInt64Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}

export function protoTypeChange3Test40() {
    let arr = new Array(1000);
    let catchOverflow = false;

    function recursive(...args) {
        const x = new Int8Array(5);
        const y = new BigUint64Array(5);
        x.__proto__ = y;
        x.map((v) => {
            v = 0;
        });
        return recursive(...args);
    }

    try {
        recursive(...arr);
    } catch (e) {
        console.log(e.message)
        catchOverflow = true;
    }
    return catchOverflow;
}
