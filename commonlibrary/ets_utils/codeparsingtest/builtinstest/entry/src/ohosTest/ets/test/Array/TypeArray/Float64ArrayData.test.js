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
    let array = Float64Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return array;
}

const generatorSequence1 = (start, end, step) => {
    let array = Float64Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return 'abc';
}

const generatorSequence2 = (start, end, step) => {
    let array = Float64Array.from({length: (end - start) / step + 1},(_, i) => start + (i * step));
    return true;
}

const obj = {a: 1, b: 2, c: 3};

let args = (function() { return arguments; }(1, 2, 3));
export class Constants {
    static float64ConstructTestStr1 = 'q';
    static float64ConstructTestStr2 = '56';
    static float64ConstructTestArray1 = new Float64Array(Constants.float64ConstructTestStr1);
    static float64ConstructTestArray2 = new Float64Array(Constants.float64ConstructTestStr2);
    static float64FromTestArray = Array.from({ length: 5 }, (v, i) => i);
    static float64ConstructTestArray3 = Float64Array.from('foo');
    static float64ConstructTestArray4 = Float64Array.from(new Set(["foo", "bar", "baz", "foo"]));
    static float64ConstructTestArray5 = Float64Array.from(new Map([[1, 2], [2, 4], [4, 8],]));
    static float64ConstructTestArray6 = Float64Array.from('123');
    static float64ConstructTestArray7 = Float64Array.from({0:1,1:2,2:3,3:4,length: 4});
    static float64ConstructTestArray8 = Float64Array.from({0:1.1,1:2.2,2:3.333,3:4.44444,length: 4});
    static float64ConstructTestArray9 = Float64Array.from(new Set([1.1, 2.2]));
    static float64ConstructTestArray10 = Float64Array.from([]);
    static float64ConstructTestArray11 = Float64Array.from([5]);
    static float64ConstructTestArray12 = Float64Array.from(obj);
    static float64ConstructTestArray13 = Float64Array.from(args);
    static float64OfTestUndefined = Float64Array.of(undefined);
    static float64OfTestStr = Float64Array.of("test");
    static float64OfTestNumber1 = Float64Array.of("123");
    static float64OfTestNumber2 = Float64Array.of("1", "2", "3");
    static float64OfTestNumber3 = Float64Array.of(null);
    static float64ArrayNumber = generatorSequence(0, 4, 1);
    static float64ArrayNumber1 = generatorSequence(1.1, 4.22, 1);
    static float64ArrayNumber2 = generatorSequence1(1, 3, 1);
    static float64ArrayNumber3 = generatorSequence2(1, 3, 1);
    static float64ArrayCharacter = Float64Array.from(Array.from({length: "Z".charCodeAt(0) - "A".charCodeAt(0)
        + 1}, (_, i) => i + "A".charCodeAt(0)));
}