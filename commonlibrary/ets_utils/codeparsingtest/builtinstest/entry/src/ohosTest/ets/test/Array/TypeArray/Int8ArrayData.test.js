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
    let array = Int8Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
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
    static int8ConstructTestStr1 = 'q';
    static int8ConstructTestStr2 = '56';
    static int8ConstructTestArray1 = new Int8Array(Constants.int8ConstructTestStr1);
    static int8ConstructTestArray2 = new Int8Array(Constants.int8ConstructTestStr2);
    static int8FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static int8ConstructTestArray3 = Int8Array.from('foo');
    static int8ConstructTestArray4 = Int8Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static int8ConstructTestArray5 = Int8Array.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static int8ConstructTestArray6 = Int8Array.from('123');
    static int8ConstructTestArray7 = Int8Array.from({0:1,1:2,2:3,3:4,length: 4});
    static int8ConstructTestArray8 = Int8Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static int8ConstructTestArray9 = Int8Array.from(new Set([1.1, 2.2]));
    static int8ConstructTestArray10 = Int8Array.from([]);
    static int8ConstructTestArray11 = Int8Array.from([5]);
    static int8ConstructTestArray12 = Int8Array.from(obj);
    static int8ConstructTestArray13 = Int8Array.from(args);
    static int8OfTestUndefined = Int8Array.of(undefined);
    static int8OfTestStr = Int8Array.of("test");
    static int8OfTestNumber1 = Int8Array.of("123");
    static int8OfTestNumber2 = Int8Array.of("1", "2", "3");
    static int8OfTestNumber3 = Int8Array.of(null);
    static int8ArrayNumber = generatorSequence(0, 4, 1);
    static int8ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static int8ArrayNumber2 = generatorSequence1(1, 3, 1);
    static int8ArrayNumber3 = generatorSequence2(1, 3, 1);
    static int8ArrayCharacter = Int8Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));
}
