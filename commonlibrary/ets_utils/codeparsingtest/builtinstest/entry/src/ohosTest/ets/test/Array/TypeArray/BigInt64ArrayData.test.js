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
     static bigInt64ConstructTestStr1 = 'q';
     static bigInt64ConstructTestStr2 = '56';
     static bigInt64ConstructTestArray1 =
         new BigInt64Array([BigInt(Constants.bigInt64ConstructTestStr1.charCodeAt(0))]);
     static bigInt64ConstructTestArray2 = new BigInt64Array([BigInt(parseInt(Constants.bigInt64ConstructTestStr2))]);
     static bigInt64FromTestArray = BigInt64Array.from(Array.from({ length: 5 }, (v, i) => BigInt(i)));
     static bigInt64ConstructTestArray3 = BigInt64Array.from(Array.from('foo').map(char => BigInt(char.charCodeAt(0))));
     static bigInt64ConstructTestArray4 =
         BigInt64Array.from(Array.from(new Set(["foo", "bar", "baz"]).keys()).map(str => BigInt(str.charCodeAt(0))));
     static bigInt64ConstructTestArray9 = BigInt64Array.from(parseInt(new Map([[1, 2], [2, 4], [4, 8],])));
     static bigInt64ConstructTestArray7 = BigInt64Array.from(parseInt(Array.from({0:1,1:2,2:3,3:4,length: 4})));
     static bigInt64ConstructTestArray8 = BigInt64Array.from(parseInt({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4}));
     static bigInt64ConstructTestArray5 = BigInt64Array.from([BigInt(2), BigInt(4), BigInt(8)]);
     static bigInt64ConstructTestArray10 = BigInt64Array.from([]);
     static bigInt64ConstructTestArray11 = BigInt64Array.from([5n]);
     static bigInt64ConstructTestArray12 = BigInt64Array.from(obj);
     static bigInt64ConstructTestArray13 = BigInt64Array.from(args);
     static bigInt64OfTestNumber1 = BigInt64Array.of(BigInt(123));
     static bigInt64OfTestNumber2 = BigInt64Array.of(BigInt(1), BigInt(2), BigInt(3));
     static bigInt64ArrayNumber = generatorSequence();
     static bigInt64ArrayNumber2 = generatorSequence1();
     static bigInt64ArrayNumber3 = generatorSequence2();
     static bigInt64ArrayCharacter = BigInt64Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
         + 1}, (_, i) => BigInt(i + "A".charCodeAt(0))));

 }