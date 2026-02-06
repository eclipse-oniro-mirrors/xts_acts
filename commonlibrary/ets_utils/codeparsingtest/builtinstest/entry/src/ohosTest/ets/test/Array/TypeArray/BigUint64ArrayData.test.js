/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

const generatorSequence = () => {
    let array = BigInt64Array.from({length: 5},(_, i) => (BigInt(i)));
    return array;
}

const generatorSequence1 = () => {
    return 'abc';
}

const generatorSequence2 = () => {
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1n, 2n, 3n));

export class Constants {
    static bigUint64ConstructTestStr1 = 'q';
    static bigUint64ConstructTestStr2 = '56';
    static bigUint64ConstructTestArray1 =
        new BigUint64Array(Array.from([BigInt(Constants.bigUint64ConstructTestStr1.charCodeAt(0))]));
    static bigUint64ConstructTestArray2 = new BigUint64Array([BigInt(Number(Constants.bigUint64ConstructTestStr2))]);
    static bigUint64FromTestArray = Array.from({ length: 5 }, (v, i) => BigInt(i));
    static bigUint64ConstructTestArray3 =
         BigUint64Array.from([BigInt('f'.charCodeAt(0)), BigInt('o'.charCodeAt(0)), BigInt('o'.charCodeAt(0))]);
    static bigUint64ConstructTestArray4 =
         BigUint64Array.from(new Set([BigInt('f'.charCodeAt(0)), BigInt('b'.charCodeAt(0)), BigInt('z'.charCodeAt(0))]));
    static bigUint64ConstructTestArray5 = BigUint64Array.from([BigInt(2), BigInt(4), BigInt(8)]);
    static bigUint64ConstructTestArray7 = BigUint64Array.from(parseInt({0:1,1:2,2:3,3:4,length: 4}));
    static bigUint64ConstructTestArray8 = BigUint64Array.from(parseInt({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4}));
    static bigUint64ConstructTestArray9 = BigUint64Array.from(parseInt(new Map([[1, 2], [2, 4], [4, 8],])));
    static bigUint64ConstructTestArray10 = BigUint64Array.from([]);
    static bigUint64ConstructTestArray11 = BigUint64Array.from([5n]);
    static bigUint64ConstructTestArray12 = BigUint64Array.from(obj);
    static bigUint64ConstructTestArray13 = BigUint64Array.from(args);
    static bigUint64OfTestNumber1 = BigUint64Array.of(BigInt("123"));
    static bigUint64OfTestNumber2 = BigUint64Array.of(BigInt("1"), BigInt("2"), BigInt("3"));
    static bigUint64ArrayNumber = generatorSequence();
    static bigUint64ArrayNumber2 = generatorSequence1();
    static bigUint64ArrayNumber3 = generatorSequence2();
    static bigUint64ArrayCharacter = BigUint64Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
         + 1}, (_, i) => BigInt(i + "A".charCodeAt(0))));

}