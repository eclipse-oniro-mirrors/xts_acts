/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
export function testNegDecimal(){
    'use strict';
    try {
        throw new RangeError("Invalid count value");
        const result = 'abc'.repeat(-0.5);
        console.log('Should not reach here');
        return false;
    } catch (e) {
        console.log(e instanceof RangeError);
        return e instanceof RangeError;
    }
    }
export function testCountNegInfinity(){
    'use strict';
    try {
        const result = 'abc'.repeat(-Infinity);
        console.log('Should not reach here');
        return false;
    } catch (e) {
        console.log(e instanceof RangeError);
        return e instanceof RangeError;
    }
}
export function testCountPosInfinity() {
    'use strict';
    try {
        const result = 'abc'.repeat(Number.POSITIVE_INFINITY);
        console.log('Should not reach here');
        return false;
    } catch (e) {
        console.log(e instanceof RangeError);
        return e instanceof RangeError;
    }
}
export function testCountNumberString() {
    'use strict';
    const result = 'ab'.repeat('3');
    return[result,result.length];
}
export function testCountEmptyString() {
    'use strict';
    const result = 'test'.repeat('');
    return[result,result.length];
}
export function testCountNonNumberString() {
    'use strict';
    const result = 'test'.repeat('abc');
    return[result,result.length];
}
export function testCountTrue() {
    'use strict';
    const result = 'x'.repeat(true);
    return[result,result.length];
}
export function testCountFalse() {
    'use strict';
    const result = 'x'.repeat(false);
    return[result,result.length];
}
export function testCountNull() {
    'use strict';
    const result = 'test'.repeat(null);
    return[result,result.length];
}
export function testCountUndefined() {
    'use strict';
    const result = 'test'.repeat(undefined);
    return[result,result.length];
}
export function testCountPlainObject() {
    'use strict';
    const result = 'test'.repeat({});
    return[result,result.length];
}
export function testCountObjectWithValueOf() {
    'use strict';
    const obj = {
        valueOf() {
            return 3;
        }
    };
    const result = 'ab'.repeat(obj);
    return[result,result.length];
}
export function testCountObjectWithToString() {
    'use strict';
    const obj = {
        toString() {
            return '2';
        }
    };
    const result = 'xy'.repeat(obj);
    return[result,result.length];
}
export function testCountArray() {
    'use strict';
    const result1 = 'ab'.repeat([3]);
    console.log(result1);
    const result2 = 'ab'.repeat([]);
    return[result1,result2];
}
export function testCountNegativeNumber() {
    'use strict';
    try {
        'abc'.repeat(-1);
    } catch (e) {
        console.log(e.name);
        console.log(e instanceof RangeError);
        return [e.name,e instanceof RangeError];
    }
}
export function testCountExceedMaxStringLength() {
    'use strict';
    try {
        const longStr = 'a'.repeat(10000);
        longStr.repeat(Number.MAX_SAFE_INTEGER);
    } catch (e) {
        console.log(e.name);
        console.log(e instanceof RangeError);
        return [e.name,e instanceof RangeError];
    }
}
export function testCountInfinity() {
    'use strict';
    try {
        'test'.repeat(Infinity);
    } catch (e) {
        console.log(e.name);
        return e.name;
    }
}
export function testThisIsNull() {
    'use strict';
    try {
        String.prototype.repeat.call(null, 2);
    } catch (e) {
        console.log(e.name);
        console.log(e instanceof TypeError);
        return [e.name,e instanceof TypeError];
    }
}
export function testThisIsUndefined() {
    'use strict';
    try {
        String.prototype.repeat.call(undefined, 2);
    } catch (e) {
        console.log(e.name);
        return e.name;
    }
}
export function testThisIsSymbol() {
    'use strict';
    try {
        String.prototype.repeat.call(Symbol('test'), 2);
    } catch (e) {
        console.log(e.name);
        return e.name;
    }
}
export function testCustomObjectCall() {
    'use strict';
    const obj = {
        toString() {
            return 'abc';
        }
    };
    const result = String.prototype.repeat.call(obj, 2);
    return result;
}
export function testNumberCall() {
    'use strict';
    const num = new Number(123);
    const result = String.prototype.repeat.call(num, 2);
    return result;
}
export function testBooleanCall() {
    'use strict';
    const bool = new Boolean(true);
    const result = String.prototype.repeat.call(bool, 3);
    return result;
}
export function testDateCall() {
    'use strict';
    const date = new Date('2024-01-01');
    const result = String.prototype.repeat.call(date, 2);
    return [typeof result,result.length > 0];
}
export function testArrayCall() {
    'use strict';
    const arr = [1, 2, 3];
    const result = String.prototype.repeat.call(arr, 2);
    return result;
}
export function testModifyPrototype() {
    'use strict';
    const original = String.prototype.repeat;
    String.prototype.repeat = function(count) {
        return 'modified';
    };
    const result = 'test'.repeat(2);
    String.prototype.repeat = original;
    return result;
}
export function testDelProtoMethod() {
    'use strict';
    const original = String.prototype.repeat;
    delete String.prototype.repeat;
    try {
        'test'.repeat(2);
    } catch (e) {
        console.log(e instanceof TypeError);
        return e instanceof TypeError;
    }
    String.prototype.repeat = original;
}
export function  testSplitJoinThenRepeat () {
    'use strict';
    const result = 'a-b-c'.split('-').join('').repeat(2);
    return result;
}
export function  testTestExceedMaxLength () {
    'use strict';
    try {
        const str = 'a'.repeat(1000000000);
        console.log('Should not reach here');
    } catch (e) {
        console.log(e instanceof RangeError);
        console.log(e.message);
        return [e instanceof RangeError,e.message];
    }
}
export function  testStrictModeThrow () {
    'use strict';
    try {
        'test'.repeat(-1);
    } catch (e) {
        console.log(e instanceof RangeError);
        return e instanceof RangeError;
    }
}
export function  testTestPadZero () {
    'use strict';
    function padZero(num, length) {
        const str = String(num);
        return '0'.repeat(length - str.length) + str;
    }
    return padZero(42, 5);
}
export function  testTestStrAlign () {
    'use strict';
    function align(str, length, char = ' ') {
        return str + char.repeat(Math.max(0, length - str.length));
    }
    return align('hello', 10) + '|';
}
export function  testTestPadData () {
    'use strict';
    function padToLength(str, length, padChar = '\x00') {
        if (str.length >= length) return str.slice(0, length);
        return str + padChar.repeat(length - str.length);
    }
    const result = padToLength('hello', 10);
    return result;
}
export function  testTestProgressBar () {
}
