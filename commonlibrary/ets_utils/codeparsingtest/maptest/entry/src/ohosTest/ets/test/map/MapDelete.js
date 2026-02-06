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


export function symbol(str){
    return Symbol(str);
}


export function NewObject(obj){
    return obj;
}
export function emptyObject(){
    return {};
}

export function MapDeleteTest016(){
    let inner = new Map();
    let map = new Map([[inner, 'inner']]);
    let result = map.delete(inner);
    return result
}

export function MapDeleteTest024(){
    let map = new Map([[1, 'one'], [2, 'two']]);
    map.delete(1);
    return [...map.entries()].length;
}

export function MapDeleteTest025(){
    let map = new Map([[1, 'one'], [2, 'two']]);
    map.delete(2);
    return [...map.keys()].length;
}

export function MapDeleteTest026(){
    let map = new Map([[1, 'one'], [2, 'two']]);
    map.delete(1);
    return [...map.values()].length;
}

export function MapDeleteTest027(){
    let map = new Map([[{x:1}, 'obj']]);
    let result = map.delete({x:1});
    return result;
}

export function MapDeleteTest028(){
    let map = new Map([[1, 'one']]);
    let result = map.delete('1');
    return result;
}

export function MapDeleteTest036(){
    return new Map([['a', {x:1}]]);
}

export function MapDeleteTest049(){
    let map = new Map([['a', 1], ['b', 2], ['c', 3]]);
    for (let [k] of map) {
        if (k === 'b') {
            map.delete('b');
        }
    }
    return map;
}

export function MapDeleteTest054(){
    let map = new Map([['1', 'string'], [1, 'number']]);
    map.delete('1');
    return map;
}

export function MapDeleteTest057(){
    return Object.freeze({x:1});
}

export function MapDeleteTest058(){
    return Object.seal({y:2});
}

export function MapDeleteTest059(){
    return Object.preventExtensions({z:3})
}

export function MapDeleteTest091(){
    return {
        [Symbol.toPrimitive]() {
            return 'x';
        }
    };
}

export function MapDeleteTest092(){
    let key1 = {x: 1, toString() { return 'same'; }};
    let key2 = {x: 2, toString() { return 'same'; }};
    let map = new Map([[key1, 'val']]);
    let result = map.delete(key2);
    return result;
}

export function MapDeleteTest094(){
    return Object.freeze({a: 1});
}

export function MapDeleteTest095(){
    return Object.seal({a: 1})
}

export function MapDeleteTest096(){
    return Object.preventExtensions({a: 1});
}

export function MapDeleteTest098(){
    let key = Object.create(null);
    let map = new Map([[key, 'val']]);
    let result = map.delete(key);
    return result;
}