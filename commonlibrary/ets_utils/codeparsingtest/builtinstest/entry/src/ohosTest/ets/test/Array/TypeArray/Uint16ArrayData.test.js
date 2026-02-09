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
    let array = Uint16Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Uint16Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Uint16Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));

export class Constants {
    static uint16ConstructTestStr1 = 'q';
    static uint16ConstructTestStr2 = '56';
    static uint16ConstructTestArray1 = new Uint16Array(Constants.uint16ConstructTestStr1);
    static uint16ConstructTestArray2 = new Uint16Array(Constants.uint16ConstructTestStr2);
    static uint16FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static uint16ConstructTestArray3 = Uint16Array.from('foo');
    static uint16ConstructTestArray4 = Uint16Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static uint16ConstructTestArray5 = Uint16Array.from(new Map([[1, 2], [2, 4], [4, 16],]));
    static uint16ConstructTestArray6 = Uint16Array.from('123');
    static uint16ConstructTestArray7 = Uint16Array.from({0:1,1:2,2:3,3:4,length: 4});
    static uint16ConstructTestArray8 = Uint16Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static uint16ConstructTestArray9 = Uint16Array.from(new Set([1.1, 2.2]));
    static uint16ConstructTestArray10 = Uint16Array.from([]);
    static uint16ConstructTestArray11 = Uint16Array.from([5]);
    static uint16ConstructTestArray12 = Uint16Array.from(obj);
    static uint16ConstructTestArray13 = Uint16Array.from(args);
    static uint16OfTestUndefined = Uint16Array.of(undefined);
    static uint16OfTestStr = Uint16Array.of("test");
    static uint16OfTestNumber1 = Uint16Array.of("123");
    static uint16OfTestNumber2 = Uint16Array.of("1", "2", "3");
    static uint16OfTestNumber3 = Uint16Array.of(null);
    static uint16ArrayNumber = generatorSequence(0, 4, 1);
    static uint16ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static uint16ArrayNumber2 = generatorSequence1(1, 3, 1);
    static uint16ArrayNumber3 = generatorSequence2(1, 3, 1);
    static uint16ArrayCharacter = Uint16Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));

}