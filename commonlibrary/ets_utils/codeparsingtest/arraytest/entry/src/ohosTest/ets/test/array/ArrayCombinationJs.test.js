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

export function ArrayCombinationTest4Js149() {
    const arr = Array.from({ length: 100000 }, (_, i) => 100000 - i);
    const arrResult = arr.map(x => x + 1).sort((a, b) => a - b);

    const ta = new Int32Array(arr);
    const taResult = Array.from(ta.map(x => x + 1)).sort((a, b) => a - b);
    return arrResult[0] == 2 && arrResult[arrResult.length - 1] == 100001 && taResult.length == 100000;
}

export function ArrayCombinationTest4Js150() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.map(x => x * 2).reverse();

    const ta = new Int32Array(arr);
    const taResult = Array.from(ta.map(x => x * 2)).reverse();

    return arrResult[0] == (100000 - 1) * 2 && arrResult[arrResult.length - 1] == 0 && taResult[0] == (100000 - 1) * 2;
}

export function ArrayCombinationTest4Js151() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.map(x => x + 1).copyWithin(50000, 0, 1000);

    const ta = new Int32Array(arr);
    const taResult = new Int32Array(Array.from(ta.map(x => x + 1)));
    taResult.copyWithin(50000, 0, 1000);

    return arrResult[50000] == 1 && taResult[50000] == 1;
}

export function ArrayCombinationTest4Js152() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.map(x => x).fill(9, 99900);

    const ta = new Int32Array(arr);
    const taResult = new Int32Array(Array.from(ta.map(x => x)));
    taResult.fill(9, 99900);

    return [arrResult.slice(-3), Array.from(taResult.slice(-3))];
}

export function ArrayCombinationTest4Js153() {
    const arr = Array.from({ length: 100000 }, (_, i) => i % 3 === 0 ? i : null);
    const arrResult = arr.filter(x => x != null).sort((a, b) => b - a);

    const ta = new Int32Array(Array.from({ length: 100000 }, (_, i) => i % 3 === 0 ? i : 0));
    const taResult = Array.from(ta.filter(x => x > 0)).sort((a, b) => b - a);

    return arrResult[0] == 99999 - (99999 % 3) && taResult[0] == 99999 - (99999 % 3);
}

export function ArrayCombinationTest4Js154() {
    const arr = Array.from({ length: 100000 }, (_, i) => i % 2 ? i : undefined);
    const arrResult = arr.filter(x => x !== undefined).reverse();

    const ta = new Int32Array(Array.from({ length: 100000 }, (_, i) => i % 2));
    const taResult = Array.from(ta.filter(x => x === 1)).reverse();

    return arrResult[0] == 99999 - (99999 % 2 === 0 ? 1 : 0) && taResult.length == 50000;
}

export function ArrayCombinationTest4Js155() {
    const arr = Array.from({ length: 100000 }, (_, i) => (i % 5 === 0 ? i : null));
    const arrResult = arr.filter(x => x != null).copyWithin(100, 0, 50);

    const ta = new Int32Array(Array.from({ length: 100000 }, (_, i) => (i % 5 === 0 ? i : 0)));
    const taResult = new Int32Array(Array.from(ta.filter(x => x > 0)));
    taResult.copyWithin(100, 0, 50);

    return arrResult[100] == 0 && taResult[100] == 5;
}

export function ArrayCombinationTest4Js156() {
    const arr = Array.from({ length: 100000 }, (_, i) => (i % 7 === 0 ? i : undefined));
    const arrResult = arr.filter(x => x !== undefined).fill(777, 1000, 1010);

    const ta = new Int32Array(Array.from({ length: 100000 }, (_, i) => (i % 7 === 0 ? i : 0)));
    const taResult = new Int32Array(Array.from(ta.filter(x => x > 0)));
    taResult.fill(777, 1000, 1010);

    return arrResult[1005] == 777 && taResult[1005] == 777;
}

export function ArrayCombinationTest4Js157() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.flatMap(x => [x, -x]).sort((a, b) => a - b);

    const ta = new Int32Array(arr);
    const taResult = Array.from(ta).flatMap(x => [x, -x]).sort((a, b) => a - b);

    return arrResult[0] == -99999 && arrResult[arrResult.length - 1] == 99999 && taResult[0] == -99999;
}

export function ArrayCombinationTest4Js158() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.flatMap(x => [x, x + 1]).reverse();
    const ta = new Int32Array(arr);
    const taResult = Array.from(ta).flatMap(x => [x, x + 1]).reverse();

    return arrResult.length == 200000 && arrResult[0] == 100000 && taResult.length == 200000;
}

export function ArrayCombinationTest4Js159() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.flatMap(x => [x, x * 2]).copyWithin(50000, 1000, 2000);

    const ta = new Int32Array(arr);
    const taResult = new Int32Array(Array.from(ta).flatMap(x => [x, x * 2]));
    taResult.copyWithin(50000, 1000, 2000);

    return arrResult[50000] == 500 && taResult[50000] == 500;
}

export function ArrayCombinationTest4Js160() {
    const arr = Array.from({ length: 100000 }, (_, i) => i);
    const arrResult = arr.flatMap(x => [x, x + 1]).fill(12345, 199990);

    const ta = new Int32Array(arr);
    const taResult = new Int32Array(Array.from(ta).flatMap(x => [x, x + 1]));
    taResult.fill(12345, 199990);

    return [arrResult.slice(-3), Array.from(taResult.slice(-3))];
}