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
    let array = Uint8ClampedArray.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Uint8ClampedArray.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Uint8ClampedArray.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));

export class Constants {
    static uint8ClampedConstructTestStr1 = 'q';
    static uint8ClampedConstructTestStr2 = '56';
    static uint8ClampedConstructTestArray1 = new Uint8ClampedArray(Constants.uint8ClampedConstructTestStr1);
    static uint8ClampedConstructTestArray2 = new Uint8ClampedArray(Constants.uint8ClampedConstructTestStr2);
    static uint8ClampedFromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static uint8ClampedConstructTestArray3 = Uint8ClampedArray.from('foo');
    static uint8ClampedConstructTestArray4 = Uint8ClampedArray.from(new Set(["foo", "bar", "baz", "foo"]));
    static uint8ClampedConstructTestArray5 = Uint8ClampedArray.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static uint8ClampedConstructTestArray6 = Uint8ClampedArray.from('123');
    static uint8ClampedConstructTestArray7 = Uint8ClampedArray.from({0:1,1:2,2:3,3:4,length: 4});
    static uint8ClampedConstructTestArray8 = Uint8ClampedArray.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static uint8ClampedConstructTestArray9 = Uint8ClampedArray.from(new Set([1.1, 2.2]));
    static uint8ClampedConstructTestArray10 = Uint8ClampedArray.from([]);
    static uint8ClampedConstructTestArray11 = Uint8ClampedArray.from([5]);
    static uint8ClampedConstructTestArray12 = Uint8ClampedArray.from(obj);
    static uint8ClampedConstructTestArray13 = Uint8ClampedArray.from(args);
    static uint8ClampedOfTestUndefined = Uint8ClampedArray.of(undefined);
    static uint8ClampedOfTestStr = Uint8ClampedArray.of("test");
    static uint8ClampedOfTestNumber1 = Uint8ClampedArray.of("123");
    static uint8ClampedOfTestNumber2 = Uint8ClampedArray.of("1", "2", "3");
    static uint8ClampedOfTestNumber3 = Uint8ClampedArray.of(null);
    static uint8ClampedArrayNumber = generatorSequence(0, 4, 1);
    static uint8ClampedArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static uint8ClampedArrayNumber2 = generatorSequence1(1, 3, 1);
    static uint8ClampedArrayNumber3 = generatorSequence2(1, 3, 1);
    static uint8ClampedArrayCharacter = Uint8ClampedArray.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));
}