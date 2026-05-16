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
    let array = Int16Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
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
    static int16ConstructTestStr1 = 'q';
    static int16ConstructTestStr2 = '56';
    static int16ConstructTestArray1 = new Int16Array(Constants.int16ConstructTestStr1);
    static int16ConstructTestArray2 = new Int16Array(Constants.int16ConstructTestStr2);
    static int16FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static int16ConstructTestArray3 = Int16Array.from('foo');
    static int16ConstructTestArray4 = Int16Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static int16ConstructTestArray5 = Int16Array.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static int16ConstructTestArray6 = Int16Array.from('123');
    static int16ConstructTestArray7 = Int16Array.from({0:1,1:2,2:3,3:4,length: 4});
    static int16ConstructTestArray8 = Int16Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static int16ConstructTestArray9 = Int16Array.from(new Set([1.1, 2.2]));
    static int16ConstructTestArray10 = Int16Array.from([]);
    static int16ConstructTestArray11 = Int16Array.from([5]);
    static int16ConstructTestArray12 = Int16Array.from(obj);
    static int16ConstructTestArray13 = Int16Array.from(args);
    static int16OfTestUndefined = Int16Array.of(undefined);
    static int16OfTestStr = Int16Array.of("test");
    static int16OfTestNumber1 = Int16Array.of("123");
    static int16OfTestNumber2 = Int16Array.of("1", "2", "3");
    static int16OfTestNumber3 = Int16Array.of(null);
    static int16ArrayNumber = generatorSequence(0, 4, 1);
    static int16ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static int16ArrayNumber2 = generatorSequence1(1, 3, 1);
    static int16ArrayNumber3 = generatorSequence2(1, 3, 1);
    static int16ArrayCharacter = Int16Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));
}
