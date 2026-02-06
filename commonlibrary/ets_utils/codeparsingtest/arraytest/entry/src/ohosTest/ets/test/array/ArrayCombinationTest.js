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

export function Fn004_ArrayCombinationTest() {
    const nestedArr = [1, [2, 3], [4, 5], 6];

    const result = [].concat.apply([], nestedArr)
        .filter(num => num % 2 !== 0)
        .sort((a, b) => a - b)
        .concat(7);

    return result;
}


export function Fn016_ArrayCombinationTest() {
    const nestedArr = [[[3], 12], [15, 8], [7, [11]]];

    const flatOnce = [].concat.apply([], nestedArr);
    const flatTwice = [].concat.apply([], flatOnce);
    const result = flatTwice
        .filter(num => num > 10)
        .sort((a, b) => a - b);
    result[1] = 20;

    return result;
}

export function Fn019_ArrayCombinationTest() {
    const baseNums = [4, 6, 8, 9];

    const withPrimes = baseNums.slice();
    withPrimes.splice(2, 0, 3, 5);
    const isPrime = num => num > 1 && [...Array(num).keys()].slice(2).every(i => num % i !== 0);
    const result = withPrimes
        .filter(num => isPrime(num))
        .sort((a, b) => a - b)
        .slice(0, -2);

    return result;
}


export function Fn024_ArrayCombinationTest() {

    function getArrayLike() {
        return arguments;
    }

    const arrayLike = getArrayLike(6, 2, 8);

    const arr = Array.from(arrayLike);
    const sorted = arr.sort((a, b) => a - b);
    const withoutMiddle = sorted.slice(0, 1).concat(sorted.slice(2));
    const avg = Math.round((withoutMiddle[0] + withoutMiddle[1]) / 2);
    withoutMiddle.push(avg);

    return withoutMiddle;
}


export function Fn073_ArrayCombinationTest() {
    const nested = [[2, 5], [1, 3], [4, 6]];
    const flat = [].concat.apply([], nested);
    const result = flat.slice()
        .sort((a, b) => a - b)
        .filter(num => num % 2 === 0)
        .concat(3)
        .slice(1)
        .sort((a, b) => a - b);

    return result;
}


export function Fn080_ArrayCombinationTest() {
    const deepNested = [[[1], 3], [2, [4]], 5];
    const flat1 = [].concat.apply([], deepNested);
    const flat2 = [].concat.apply([], flat1);
    const result = flat2.slice()
        .sort((a, b) => a - b)
        .filter(num => num > 2)
        .concat(6)
        .slice(0, -1);
    result[1] = 0;

    return result;
}


export function Fn084_ArrayCombinationTest() {

    function getArgs() {
        return arguments;
    }

    const arrayLike = getArgs(5, 2, 7, 3);
    const arr = Array.from(arrayLike);
    const sorted = arr.slice().sort((a, b) => a - b);
    const withoutMax = sorted.slice(0, -1);
    const sum = withoutMax.reduce((acc, curr) => acc + curr, 0);
    const result = withoutMax.concat(sum).sort((a, b) => a - b);

    return result;
}


export function Fn102_ArrayCombinationTest() {
    const threeD = [[[3, 1], 4], [2, [5]], [6]];
    const flat1 = [].concat.apply([], threeD);
    const flat2 = [].concat.apply([], flat1);
    const squared = flat2.map(num => num**2);
    const sorted = squared.slice().sort((a, b) => a - b);
    const filtered = sorted.filter(num => num > 10);
    const with49 = filtered.concat(49);
    const result = with49.slice(1).sort((a, b) => a - b);

    return result;
}

export function Fn105_ArrayCombinationTest() {
    const fromArr = Array.from({ length: 5 }, (_, i) => i * 2);
    const oddIndex = fromArr.filter((_, index) => index % 2 === 0);
    const sorted = oddIndex.slice().sort((a, b) => a - b);
    const with12 = sorted.concat(12);
    const withoutIndex1 = with12.slice(0, 1).concat(with12.slice(2));
    const result = withoutIndex1.concat();
    result[result.length - 1] = 10;

    return result;
}