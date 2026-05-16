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
export function MapHasTest003(){
    const map = new Map([[100, 'primitive number']]);
    const hasWrapper = map.has(new Number(100));
    const hasPrimitive = map.has(100);
    return { hasWrapper, hasPrimitive }
}

export function MapHasTest004(){
    const obj1 = { id: 1 };
    const obj2 = { id: 1 };
    const map = new Map([[obj1, 'target object']]);
    const hasObj2 = map.has(obj2);
    const hasObj1 = map.has(obj1);
    return { hasObj2, hasObj1 }
}

export function MapHasTest007(){
    const sym1 = Symbol('key');
    const sym2 = Symbol('key');
    const map = new Map([[sym1, 'symbol value']]);
    const hasSym1 = map.has(sym1);
    const hasSym2 = map.has(sym2);
    return {hasSym1,hasSym2}
}


export function MapHasTest009(){
    const user = { name: 'lisi' };
    const map = new Map([[user, 'user info']]);
    user.name = 'wangwu'; // Modify the internal properties of the object, the reference remains unchanged
    const hasUser = map.has(user);
    return hasUser;
}

export function MapHasTest015(){
    const map = new Map([[true, 'boolean']]);
    return map.has(1);
}

export function MapHasTest016(){
    const map = new Map([[false, 'boolean']]);
    return map.has(0);
}

export function MapHasTest018(){
    const map = new Map([['123', 'string']])
    return map.has(123);
}

export function MapHasTest021(){
    const map = new Map([[42n, 'bigint']]);
    const has42n = map.has(42n)
    const has42 = map.has(42)
    return {has42n,has42}
}

export function MapHasTest026(){
    const map = new Map([
        ['string', 1],
        [123, 'number'],
        [true, false]
    ]);
    const hasString = map.has('string')
    const has123 = map.has(123)
    const hasTrue = map.has(true)
    const hasFalse = map.has(false)
    return {hasString,has123,hasTrue,hasFalse}
}

export function MapHasTest030(){
    const sym = Symbol.for('shared');
    const map = new Map([[sym, 'shared symbol']]);
    const map1 = map.has(Symbol.for('shared'))
    const map2 = map.has(Symbol('sahred'))
    return {map1,map2}
}

export function MapHasTest038(){
    const map = new Map([[null, 'null value']]);
    const map1 = map.has(null)
    const map2 = map.has(undefined)
    return {map1,map2}
}

export function MapHasTest039(){
    const map = new Map([[undefined, 'undefined value']]);
    const map1 = map.has(undefined)
    const map2 = map.has(null)
    return {map1,map2}
}

export function MapHasTest042(){
    const obj = {};
    const map = new Map([[obj, 'empty object']]);
    const map1 = map.has(obj)
    const map2 = map.has({})
    return {map1,map2}
}

export function MapHasTest043(){
    const obj = { a: { b: 1 } };
    const map = new Map([[obj, 'nested object']]);
    const map1 = map.has(obj)
    const map2 = map.has({ a: { b: 1 } })
    return {map1,map2}
}

export function MapHasTest044(){
    const obj = { a: { b: 1 } };
    const map = new Map([[obj, 'nested object']]);
    obj.a.b = 2;
    const map1 = map.has(obj)
    return map1;
}

export function MapHasTest045(){
    const obj = { a: { b: 1 } };
    const map = new Map([[obj, 'nested object']]);
    obj.a.b = 2;
    const map1 = map.has(obj)
    return map1;
}

export function MapHasTest046(){
    const obj = { prop: 'value' };
    Object.freeze(obj);
    const map = new Map([[obj, 'frozen object']]);
    const map1 = map.has(obj)
    return map1;
}

export function MapHasTest047(){
    const obj = { prop: 'value' };
    Object.seal(obj);
    const map = new Map([[obj, 'sealed object']]);
    const map1 = map.has(obj)
    return map1;
}

export function MapHasTest048(){
    const sym = Symbol('unique');
    const map1 = new Map([[sym, 'map1']]);
    const map2 = new Map();
    const hasSym1 = map1.has(sym);
    const hasSym2 = map2.has(sym);
    map2.set(sym,'map2')
    const hasSym3 = map2.has(sym)
    return { hasSym1,hasSym2,hasSym3 };
}

export function MapHasTest057(){
    function* generator() { yield 1; }
    const map = new Map([[generator, 'generator as key']]);
    const map1 = map.has(generator)
    const map2 = map.has(function* generator() { yield 1; })
    return {map1,map2}
}

export function MapHasTest058(){
    const map1 = new Map();
    return map1.has(class AnotherClass {});
}

export function MapHasTest063(){
    const sym1 = Symbol('description');
    const sym2 = Symbol('description');
    const map = new Map([[sym1, 'symbol as key']]);
    const map1 = map.has(sym1)
    const map2 = map.has(sym2)
    return {map1,map2}
}

export function MapHasTest066(){
    const map = new Map([['123', 'string number']]);
    const map1 = map.has('123')
    const map2 = map.has(Number('123'))
    return {map1,map2}
}

export function MapHasTest067(){
    const map = new Map([[123, 'number']]);
    const map1 = map.has(123)
    const map2 = map.has(String(123))
    return {map1,map2}
}

export function MapHasTest068(){
    const map = new Map([[true, 'boolean true']]);
    const map1 = map.has(true)
    const map2 = map.has(1)
    return {map1,map2}
}

export function MapHasTest069(){
    const map = new Map([[false, 'boolean false']]);
    const map1 = map.has(false)
    const map2 = map.has(0)
    return {map1,map2}
}

export function MapHasTest070(){
    const map = new Map([[1, 'number one']]);
    const map1 = map.has('1' == 1)
    const map2 = map.has(1)
    return {map1,map2};
}

export function MapHasTest075(){
    const obj = Object.create(null);
    obj.prop = 'value';
    const map = new Map([[obj, 'null prototype']]);
    obj.prop = 'new value';
    const map1 = map.has(obj);
    return map1;
}

export function MapHasTest076(){
    const proto = {};
    const obj = Object.create(proto);
    const map = new Map([[proto, 'prototype']]);
    const map1 = map.has(proto);
    const map2 = map.has(obj)
    return {map1,map2};
}



export function MapHasTest085(){
    const keyWeakMap = new WeakMap();
    const obj = {};
    const map = new Map([[keyWeakMap, 'weakmap key']]);
    keyWeakMap.set(obj, 'value'); // Modify the weakmap used as key
    const map1 = map.has(keyWeakMap)
    return map1;
}

export function MapHasTest086(){
    const keyWeakSet = new WeakSet();
    const obj = {};
    const map = new Map([[keyWeakSet, 'weakmap key']]);
    keyWeakSet.add(obj);
    const map1 = map.has(keyWeakSet)
    return map1;
}

export function MapHasTest087(){
    const target = {};
    const proxy = new Proxy(target, {});
    const map = new Map([[proxy, 'proxy key']]);
    const map1 = map.has(proxy)
    const map2 = map.has(target)
    return {map1,map2}
}

export function MapHasTest088(){
    const map = new Map([[Reflect, 'reflect']]);
    const map1 = map.has(Reflect)
    return map1;
}


export function MapHasTest093(){
  function func(){};
  const boundFunc = func.bind({});
  const map = new Map([[boundFunc, 'bound function']]);
  const map1 = map.has(boundFunc);
  const map2 = map.has(func())
  return{map1,map2}
}

export function MapHasTest094(){
    function* generator() { yield 1; }
    const genObj = generator();
    const map = new Map([[genObj, 'generator object']]);
    const map1 = map.has(genObj)
    const map2 = map.has(generator())
    return{map1,map2}
}

export function MapHasTest096(){
    async function* asyncGenerator() { yield 1; }
    const map = new Map([[asyncGenerator, 'async generator']]);
    const map1 = map.has(asyncGenerator)
    const map2 = map.has(async function* asyncGenerator() { yield 1; })
    return{map1,map2}
}

export function MapHasTest097(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    const map = new Map([[proxy, 'revocable proxy']]);
    const map1 = map.has(proxy)
    revoke();
    const map2 = map.has(proxy)
    return{map1,map2}
}

export function MapHasTest099(){
    const key = Symbol.toStringTag;
    const map = new Map([[key, 'toStringTag']]);
    const map1 = map.has(key);
    const map2 = map.has(Symbol.toStringTag)
    return {map1,map2 }
}