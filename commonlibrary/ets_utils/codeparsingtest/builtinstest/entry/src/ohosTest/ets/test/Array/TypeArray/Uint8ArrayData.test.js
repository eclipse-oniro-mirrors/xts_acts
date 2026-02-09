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

const generatorSequence = (start, end, step) => {
    let array = Uint8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Uint8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Uint8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));

export class Constants {
    static uint8ConstructTestStr1 = 'q';
    static uint8ConstructTestStr2 = '56';
    static uint8ConstructTestArray1 = new Uint8Array(Constants.uint8ConstructTestStr1);
    static uint8ConstructTestArray2 = new Uint8Array(Constants.uint8ConstructTestStr2);
    static uint8FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static uint8ConstructTestArray3 = Uint8Array.from('foo');
    static uint8ConstructTestArray4 = Uint8Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static uint8ConstructTestArray5 = Uint8Array.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static uint8ConstructTestArray6 = Uint8Array.from('123');
    static uint8ConstructTestArray7 = Uint8Array.from({0:1,1:2,2:3,3:4,length: 4});
    static uint8ConstructTestArray8 = Uint8Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static uint8ConstructTestArray9 = Uint8Array.from(new Set([1.1, 2.2]));
    static uint8ConstructTestArray10 = Uint8Array.from([]);
    static uint8ConstructTestArray11 = Uint8Array.from([5]);
    static uint8ConstructTestArray12 = Uint8Array.from(obj);
    static uint8ConstructTestArray13 = Uint8Array.from(args);
    static uint8OfTestUndefined = Uint8Array.of(undefined);
    static uint8OfTestStr = Uint8Array.of("test");
    static uint8OfTestNumber1 = Uint8Array.of("123");
    static uint8OfTestNumber2 = Uint8Array.of("1", "2", "3");
    static uint8OfTestNumber3 = Uint8Array.of(null);
    static uint8ArrayNumber = generatorSequence(0, 4, 1);
    static uint8ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static uint8ArrayNumber2 = generatorSequence1(1, 3, 1);
    static uint8ArrayNumber3 = generatorSequence2(1, 3, 1);
    static uint8ArrayCharacter = Uint8Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));

}