/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export function MapGetTest0008(){
    const symKey = Symbol('key');
    const map = new Map();
    map.set(symKey, 42);
    let map1 = map.get(symKey);
    return { map1 }
}

export function MapGetTest0009(){
    const sym1 = Symbol('key');
    const sym2 = Symbol('key');
    const map = new Map();
    map.set(sym1, 'value1');
    let map1 = map.get(sym2);
    return { map1 }
}

export function MapGetTest0010(){
    const symKey = Symbol.for('shared');
    const map = new Map();
    map.set(symKey, true);
    let map1 = map.get(Symbol.for('shared'));
    return { map1 }
}

export function MapGetTest0021(){
    const nestedKey = { a: { b: 1 } };
    const map = new Map();
    map.set(nestedKey, 'nested');
    let map1 = map.get(nestedKey);
    return { map1 }
}

export function MapGetTest0030(){
    const specialKey = Symbol('special');
    const map = new Map();
    map.set(specialKey, 'special value');
    for (let i = 0; i < 100; i++) {
        map.set(i, `value${i}`);
    }
    for (let i = 0; i < 50; i++) {
        map.delete(i);
    }
    let map1 = map.get(specialKey);
    return { map1 }
}

export function MapGetTest0031(){
    const keyObj = { prop: 'initial' };
    const map = new Map();
    map.set(keyObj, 10);
    keyObj.prop = 'modified';
    let map1 = map.get(keyObj);
    return { map1 }
}


export function MapGetTest0048(){
    const keyObj = Object.create(null);
    keyObj.id = 1;
    const map = new Map();
    map.set(keyObj, 'no prototype');
    let map1 = map.get(keyObj);
    return { map1 }
}

export function MapGetTest0049(){
    const keyObj = Object.freeze({ id: 1 });
    const map = new Map();
    map.set(keyObj, 'frozen');
    let map1 = map.get(keyObj);
    return { map1 }
}

export function MapGetTest0050(){
    const keyObj = { id: 1 };
    Object.seal(keyObj);
    const map = new Map();
    map.set(keyObj, 'sealed');
    let map1 = map.get(keyObj);
    return { map1 }
}

export function MapGetTest0054(){
    const keyObj = {
        value: 10,
        valueOf() { return this.value; }
    };
    const map = new Map();
    map.set(keyObj, 'valueOf key');
    let map1 = map.get(keyObj);
    return { map1 }
}

export function MapGetTest0055(){
    const keyObj = {
        [Symbol.toPrimitive](hint) {
        return hint === 'number' ? 100 : '100';
    }
    };
    const map = new Map();
    map.set(keyObj, 'primitive key');
    let map1 = map.get(keyObj);
    return { map1 }
}

export function MapGetTest0070(){
    function* generator() {
        yield 1;
        yield 2;
    }

    const genObj = generator();
    const map = new Map();
    map.set(genObj, 'generator value');
    let map1 = map.get(genObj);
    return { map1 }
}

export function MapGetTest0082(){
    const target = { id: 1 };
    const proxyKey = new Proxy(target, {});
    const map = new Map();
    map.set(proxyKey, 'proxy value');
    let map1 = map.get(proxyKey);
    return { map1 }
}

export function MapGetTest0083(){
    const target = { id: 1 };
    const proxyKey = new Proxy(target, {});
    const map = new Map();
    map.set(proxyKey, 'proxy value');
    let map1 = map.get(proxyKey);
    return { map1 }
}

export function MapGetTest0084(){
    const map = new Map();
    map.set(Reflect, 'reflect value');
    let map1 = map.get(Reflect);
    return { map1 }
}

export function MapGetTest0085(){
    const map = new Map();
    map.set(Math, 'math value');
    let map1 = map.get(Math);
    return { map1 }
}

export function MapGetTest0086(){
    const map = new Map();
    map.set(Symbol.iterator, 'iterator symbol');
    let map1 = map.get(Symbol.iterator) === 'iterator symbol';
    return { map1 }
}

export function MapGetTest0087(){
    const map = new Map();
    map.set(Symbol.toStringTag, 'toStringTag symbol');
    let map1 = map.get(Symbol.toStringTag) === 'toStringTag symbol';
    return { map1 }
}

export function MapGetTest0088(){
    const moduleKey = { exports: {} };
    const map = new Map();
    map.set(moduleKey, 'module value');
    let map1 = map.get(moduleKey);
    return { map1 }
}
export function MapGetTest0091(){
    function MyFunction(){}
    MyFunction.prototype.method = () => {};
    const map = new Map();
    map.set(MyFunction, 'function with prototype');
    let map1 = map.get(MyFunction);
    return { map1 }
}

export function MapGetTest0092(){
    const asyncFunc = async () => {};
    const map = new Map();
    map.set(asyncFunc, 'async function');
    let map1 = map.get(asyncFunc);
    return { map1 }
}

export function MapGetTest0093(){
    function* genFunc() { yield 1; }
    const map = new Map();
    map.set(genFunc, 'generator function');
    let map1 = map.get(genFunc);
    return { map1 }
}

export function MapGetTest0094(){
    const arrowFunc = () => {};
    const map = new Map();
    map.set(arrowFunc, 'arrow function');
    let map1 = map.get(arrowFunc);
    return { map1 }
}

export function MapGetTest0095(){
    const key = { a: { b: { c: 'deep' } } };
    const map = new Map();
    map.set(key, 42);
    let map1 = map.get(key);
    return { map1 }
}

export function MapGetTest0096(){
    const key = { name: 'circular' };
    key.self = key;
    const map = new Map();
    map.set(key, 'circular value');
    let map1 = map.get(key);
    return { map1 }
}

export function MapGetTest0100(){
    const symKey = Symbol('special');
    const map = new Map();
    map.set('string', 1);
    map.set(symKey, 2);
    map.set('another', 3);
    let map1 = map.get(symKey) === 2;
    return { map1 }
}