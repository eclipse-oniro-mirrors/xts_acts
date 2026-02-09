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

export function getUnionMap(map1, map2){
    return new Map([...map1, ...map2]);
}
export function getUnionMapTh(map1, map2, map3){
    return new Map([...map1, ...map2, ...map3]);
}
export function MapUnionTest004(){
    const objKey = { id: 1 };
    const symbolKey = Symbol('test');

    const map1 = new Map([
        [objKey, 'object value'],
        [symbolKey, 'symbol value']
    ]);
    const map2 = new Map([
        [objKey, 'updated object'],
        [null, 'null value']
    ]);

    const union = new Map([...map1, ...map2]);
    return [union.size, union.get(objKey), union.get(symbolKey), union.get(null)];
}
export function MapUnionTest010(map1, map2){
    return new Map(
        [...map1, ...map2].filter(([_, value]) => value.length >= 5)
    );
}
export function MapUnionTest012(){
    const obj = { x: 'x-value', y: 'y-value' };
    const arr = [['y', 'y-updated'], ['z', 'z-value']];

    const map1 = new Map(Object.entries(obj));
    const map2 = new Map(arr);
    return new Map([...map1, ...map2]);
}
export function MapUnionTest018(){
    const bigIntKey1 = 100n;
    const bigIntKey2 = 200n;
    const symbolKey1 = Symbol('key1');
    const symbolKey2 = Symbol('key2');

    const map1 = new Map([
        [bigIntKey1, 'bigint-100'],
        [symbolKey1, 'symbol-1']
    ]);
    const map2 = new Map([
        [bigIntKey1, 'bigint-100-updated'],
        [bigIntKey2, 'bigint-200'],
        [symbolKey2, 'symbol-2']
    ]);
    const union = new Map([...map1, ...map2]);
    return [union.size, union.get(bigIntKey1), union.get(symbolKey2)];
}
export function MapUnionTest019(map1, map2){
    const transformedUnion = new Map(
        [...map1, ...map2].map(([key, value]) => [key, value * 10])
    );
    return transformedUnion;
}
export function MapUnionTest025(){
    const frozen1 = Object.freeze({ id: 1 });
    const frozen2 = Object.freeze({ id: 2 });
    const frozen3 = Object.freeze({ id: 1 }); // Same content as frozen1

    const map1 = new Map([[frozen1, 'frozen1'], [frozen2, 'frozen2']]);
    const map2 = new Map([[frozen3, 'frozen3'], [frozen2, 'frozen2-updated']]);

    const union = new Map([...map1, ...map2]);
    return [union.size, union.get(frozen1), union.get(frozen3), union.get(frozen2)];
}
export function MapUnionTest026(){
    const cyclic1 = { name: 'cyclic1' };
    cyclic1.self = cyclic1;

    const cyclic2 = { name: 'cyclic2' };
    cyclic2.self = cyclic2;

    const map1 = new Map([[1, cyclic1], [2, 'normal']]);
    const map2 = new Map([[2, cyclic2], [3, cyclic1]]);

    const union = new Map([...map1, ...map2]);
    return [union.size, union.get(1).self === cyclic1, union.get(2).name, union.get(3).self === cyclic1];
}
export function MapUnionTest037(){
    function* gen1() { yield 1; yield 2; }
    function* gen2() { yield 'a'; yield 'b'; }
    function* gen3() { yield true; yield false; }

    const map1 = new Map([[1, gen1], [2, gen2]]);
    const map2 = new Map([[2, gen3], [3, gen1]]);

    const union = new Map([...map1, ...map2]);
    const result = [];
    result.push(union.size);

    const gen2Result = union.get(2)();
    result.push(gen2Result.next().value);
    result.push(gen2Result.next().value);

    const gen3Result = union.get(3)();
    result.push(gen3Result.next().value);
    return result;
}
export function MapUnionTest041(){
    const target1 = { id: 1 };
    const proxy1 = new Proxy(target1, {});
    const proxy2 = new Proxy(target1, {}); // Same target, different proxy

    const map1 = new Map([[proxy1, 'proxy1'], [2, 'value2']]);
    const map2 = new Map([[proxy2, 'proxy2'], [2, 'value2-updated']]);

    const union = new Map([...map1, ...map2]);
    return [union.size, union.get(proxy1), union.get(proxy2), union.get(2)];
}
export function MapUnionTest058(union){
    const context = { multiplier: 2, results: []};

    // Use forEach with thisArg
    union.forEach(function (value) {
        this.results.push(value * this.multiplier);
    }, context);
    return context.results;
}