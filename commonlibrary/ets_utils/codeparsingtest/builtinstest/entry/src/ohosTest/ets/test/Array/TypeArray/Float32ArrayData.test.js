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
    let array = Float32Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Float32Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Float32Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));
export class Constants {
    static float32ConstructTestStr1 = 'q';
    static float32ConstructTestStr2 = '56';
    static float32ConstructTestArray1 = new Float32Array(Constants.float32ConstructTestStr1);
    static float32ConstructTestArray2 = new Float32Array(Constants.float32ConstructTestStr2);
    static float32FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static float32ConstructTestArray3 = Float32Array.from('foo');
    static float32ConstructTestArray4 = Float32Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static float32ConstructTestArray5 = Float32Array.from(new Map([[1, 2], [2, 4], [4, 16],]));
    static float32ConstructTestArray6 = Float32Array.from('123');
    static float32ConstructTestArray7 = Float32Array.from({0:1,1:2,2:3,3:4,length: 4});
    static float32ConstructTestArray8 = Float32Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static float32ConstructTestArray9 = Float32Array.from(new Set([1.1, 2.2]));
    static float32ConstructTestArray10 = Float32Array.from([]);
    static float32ConstructTestArray11 = Float32Array.from([5]);
    static float32ConstructTestArray12 = Float32Array.from(obj);
    static float32ConstructTestArray13 = Float32Array.from(args);
    static float32OfTestUndefined = Float32Array.of(undefined);
    static float32OfTestStr = Float32Array.of("test");
    static float32OfTestNumber1 = Float32Array.of("123");
    static float32OfTestNumber2 = Float32Array.of("1", "2", "3");
    static float32OfTestNumber3 = Float32Array.of(null);
    static float32ArrayNumber = generatorSequence(0, 4, 1);
    static float32ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static float32ArrayNumber2 = generatorSequence1(1, 3, 1);
    static float32ArrayNumber3 = generatorSequence2(1, 3, 1);
    static float32ArrayCharacter = Float32Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));

}