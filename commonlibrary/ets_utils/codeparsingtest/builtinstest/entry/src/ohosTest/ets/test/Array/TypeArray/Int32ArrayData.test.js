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
    let array = Int32Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Int8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Int8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));

export class Constants {
    static int32ConstructTestStr1 = 'q';
    static int32ConstructTestStr2 = '56';
    static int32ConstructTestArray1 = new Int32Array(Constants.int32ConstructTestStr1);
    static int32ConstructTestArray2 = new Int32Array(Constants.int32ConstructTestStr2);
    static int32FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static int32ConstructTestArray3 = Int32Array.from('foo');
    static int32ConstructTestArray4 = Int32Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static int32ConstructTestArray5 = Int32Array.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static int32ConstructTestArray6 = Int32Array.from('123');
    static int32ConstructTestArray7 = Int32Array.from({0:1,1:2,2:3,3:4,length: 4});
    static int32ConstructTestArray8 = Int32Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static int32ConstructTestArray9 = Int32Array.from(new Set([1.1, 2.2]));
    static int32ConstructTestArray10 = Int32Array.from([]);
    static int32ConstructTestArray11 = Int32Array.from([5]);
    static int32ConstructTestArray12 = Int32Array.from(obj);
    static int32ConstructTestArray13 = Int32Array.from(args);
    static int32OfTestUndefined = Int32Array.of(undefined);
    static int32OfTestStr = Int32Array.of("test");
    static int32OfTestNumber1 = Int32Array.of("123");
    static int32OfTestNumber2 = Int32Array.of("1", "2", "3");
    static int32OfTestNumber3 = Int32Array.of(null);
    static int32ArrayNumber = generatorSequence(0, 4, 1);
    static int32ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static int32ArrayNumber2 = generatorSequence1(1, 3, 1);
    static int32ArrayNumber3 = generatorSequence2(1, 3, 1);
    static int32ArrayCharacter = Int32Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));
}
