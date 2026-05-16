/*
 * Copyright (c) 2026 RKH Corp.
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

// Test forEach with thisArg binding
export function ForEachThisArgBindTest0100() {
    const obj = {
        multiplier: 2,
        multiply: function(arr) {
            const results = [];
            arr.forEach(function(element) {
                results.push(element * this.multiplier);
            }, this);
            return results;
        }
    };
    const result = obj.multiply([1, 2, 3]);
    return result[0] === 2 && result[1] === 4 && result[2] === 6;
}

// Test forEach without thisArg
export function ForEachNoThisArgTest0200() {
    const arr = [1];
    let thisValue;
    try {
        arr.forEach(function(element) {
            thisValue = this;
        });
    } catch (e) {
        thisValue = 'error';
    }
    return thisValue === undefined || thisValue === 'error';
}

// Test forEach arrow function ignores thisArg
export function ForEachArrowIgnoreThisArgTest0300() {
    const obj = {
        value: 10,
        test: function(arr) {
            const results = [];
            arr.forEach((element) => {
                results.push(this.value);
            }, {value: 20});
            return results;
        }
    };
    const result = obj.test([1, 2, 3]);
    return result[0] === 10 && result[1] === 10 && result[2] === 10;
}

// Test forEach arrow function lexical this binding
export function ForEachArrowLexicalThisTest0400() {
    const obj = {
        prefix: 'Item: ',
        log: function(arr) {
            const results = [];
            arr.forEach((element) => {
                results.push(this.prefix + element);
            });
            return results;
        }
    };
    const result = obj.log(['a', 'b', 'c']);
    return result[0] === 'Item: a' && result[1] === 'Item: b' && result[2] === 'Item: c';
}

// Test forEach with object thisArg
export function ForEachThisArgObjectTest0500() {
    const counter = { sum: 0 };
    const arr = [1, 2, 3, 4, 5];
    arr.forEach(function(element) {
        this.sum += element;
    }, counter);
    return counter.sum === 15;
}

// Test forEach with null thisArg
export function ForEachThisArgNullTest0600() {
    let thisValue = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisValue = this;
    }, null);
    return thisValue === undefined || thisValue === null || typeof thisValue === 'object';
}

// Test forEach with undefined thisArg
export function ForEachThisArgUndefinedTest0700() {
    let thisValue = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisValue = this;
    }, undefined);
    return thisValue === undefined || typeof thisValue === 'object';
}

// Test forEach with primitive number thisArg
export function ForEachThisArgPrimitiveTest0800() {
    let thisType = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisType = typeof this;
    }, 42);
    return thisType === 'number';
}

// Test forEach class method with thisArg
export function ForEachClassThisArgTest0900() {
    class Calculator {
        constructor() {
            this.sum = 0;
            this.count = 0;
        }
        add(array) {
            array.forEach(function(entry) {
                this.sum += entry;
                this.count++;
            }, this);
        }
    }
    const calc = new Calculator();
    calc.add([2, 5, 8]);
    return calc.sum === 15 && calc.count === 3;
}

// Test forEach object method with thisArg
export function ForEachObjMethodThisArgTest1000() {
    const processor = {
        results: [],
        process: function(arr) {
            arr.forEach(function(item) {
                this.results.push(item * 2);
            }, this);
        }
    };
    processor.process([1, 2, 3]);
    return processor.results[0] === 2 && processor.results[1] === 4 && processor.results[2] === 6;
}

// Test forEach cannot chain call
export function ForEachCannotChainTest1100() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    try {
        arr.forEach(item => item).map(x => x * 2);
    } catch (e) {
        errorCaught = true;
    }
    return errorCaught;
}

// Test forEach throw string to interrupt
export function ForEachThrowStringTest1200() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    let caughtValue = null;
    try {
        arr.forEach((item) => {
            visited.push(item);
            if (item === 3) {
                throw 'Break';
            }
        });
    } catch (e) {
        caughtValue = e;
    }
    return caughtValue === 'Break' && visited.length === 3 && visited[0] === 1 && visited[1] === 2 && visited[2] === 3;
}

// Test forEach callback is string - throws TypeError
export function ForEachCallbackNotFunctionTest1300() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach('not a function');
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach callback is null - throws TypeError
export function ForEachCallbackNullTest1400() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach(null);
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach callback is undefined - throws TypeError
export function ForEachCallbackUndefinedTest1500() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach(undefined);
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach callback is number - throws TypeError
export function ForEachCallbackNumberTest1600() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach(42);
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach callback is object - throws TypeError
export function ForEachCallbackObjectTest1700() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach({key: 'value'});
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach this exception - access property on undefined this
export function ForEachThisExceptionTest1800() {
    const arr = [1];
    let errorCaught = false;
    try {
        arr.forEach(function(item) {
            this.value;
        });
    } catch (e) {
        errorCaught = true;
    }
    return errorCaught;
}

// Test forEach with array-like object
export function ForEachArrayLikeBasicTest1900() {
    const arrayLike = {
        length: 3,
        0: 'a',
        1: 'b',
        2: 'c'
    };
    const results = [];
    Array.prototype.forEach.call(arrayLike, (item) => {
        results.push(item);
    });
    return results.length === 3 && results[0] === 'a' && results[1] === 'b' && results[2] === 'c';
}

// Test forEach with arguments object
export function ForEachArgumentsTest2000() {
    let result = false;
    function test() {
        const items = [];
        Array.prototype.forEach.call(arguments, (arg) => {
            items.push(arg);
        });
        result = items.length === 3 && items[0] === 1 && items[1] === 2 && items[2] === 3;
    }
    test(1, 2, 3);
    return result;
}

// Test forEach with string as array-like
export function ForEachStringArrayLikeTest2100() {
    const str = 'hello';
    const chars = [];
    Array.prototype.forEach.call(str, (char) => {
        chars.push(char);
    });
    return chars.length === 5 && chars[0] === 'h' && chars[4] === 'o';
}

// Test forEach with custom array-like object
export function ForEachCustomArrayLikeTest2200() {
    const customArrayLike = {
        length: 2,
        0: 'first',
        1: 'second',
        getValue: function(index) {
            return this[index];
        }
    };
    const results = [];
    Array.prototype.forEach.call(customArrayLike, (item) => {
        results.push(item);
    });
    return results.length === 2 && results[0] === 'first' && results[1] === 'second';
}

// Test forEach with array-like length mismatch
export function ForEachArrayLikeLengthMismatchTest2300() {
    const arrayLike = {
        length: 5,
        0: 'a',
        1: 'b'
    };
    const results = [];
    Array.prototype.forEach.call(arrayLike, (item) => {
        results.push(item);
    });
    return results.length === 2 && results[0] === 'a' && results[1] === 'b';
}

// Test forEach vs for...in comparison
export function ForEachVsForInTest2400() {
    const arr = [1, 2, 3];
    arr.customProp = 'extra';
    const forEachItems = [];
    const forInItems = [];
    arr.forEach(item => forEachItems.push(item));
    for (const index in arr) {
        forInItems.push(arr[index]);
    }
    return forEachItems.length === 3 && forInItems.length === 4 && forInItems[3] === 'extra';
}

// Test forEach with Symbol type elements
export function ForEachSymbolTypeTest2500() {
    const sym1 = Symbol('a');
    const sym2 = Symbol('b');
    const arr = [sym1, sym2];
    const results = [];
    arr.forEach(item => results.push(typeof item));
    return results.length === 2 && results[0] === 'symbol' && results[1] === 'symbol';
}

// Test forEach in strict mode
export function ForEachStrictModeTest2600() {
    'use strict';
    const arr = [1, 2, 3];
    const results = [];
    arr.forEach(item => results.push(item));
    return results.length === 3 && results[0] === 1 && results[1] === 2 && results[2] === 3;
}

// Test forEach with Int8Array
export function ForEachInt8ArrayTest2700() {
    const typedArr = new Int8Array([10, 20, 30]);
    const results = [];
    typedArr.forEach((item) => {
        results.push(item);
    });
    return results.length === 3 && results[0] === 10 && results[1] === 20 && results[2] === 30;
}

// Test forEach with Float32Array
export function ForEachFloat32ArrayTest2800() {
    const typedArr = new Float32Array([1.5, 2.5, 3.5]);
    const results = [];
    typedArr.forEach((item) => {
        results.push(item);
    });
    return results.length === 3 && results[0] === 1.5 && results[1] === 2.5 && results[2] === 3.5;
}

// Test forEach with string primitive thisArg
export function ForEachThisArgStringTest2900() {
    let thisType = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisType = typeof this;
    }, 'hello');
    return thisType === 'string';
}

// Test forEach with boolean primitive thisArg
export function ForEachThisArgBooleanTest3000() {
    let thisType = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisType = typeof this;
    }, true);
    return thisType === 'boolean';
}

// Test forEach with large array 10000 elements
export function ForEachLargeArray10000Test3100() {
    const arr = new Array(10000).fill(1);
    let sum = 0;
    arr.forEach(item => { sum += item; });
    return sum === 10000;
}

// Test forEach delete array reference after start
export function ForEachDeleteReferenceTest3200() {
    let arr = [1, 2, 3];
    const results = [];
    arr.forEach((item) => {
        results.push(item);
    });
    arr = null;
    return results.length === 3 && results[0] === 1 && results[1] === 2 && results[2] === 3;
}

// Test forEach network request pattern
export function ForEachNetworkPatternTest3300() {
    const urls = ['url1', 'url2', 'url3'];
    const log = [];
    urls.forEach(url => {
        log.push('Fetching ' + url);
    });
    return log.length === 3 && log[0] === 'Fetching url1' && log[1] === 'Fetching url2' && log[2] === 'Fetching url3';
}

// Test forEach with anonymous function expression callback
export function ForEachAnonymousFuncTest3400() {
    const arr = [1, 2, 3];
    const results = [];
    arr.forEach(function(item) {
        results.push(item * 2);
    });
    return results.length === 3 && results[0] === 2 && results[1] === 4 && results[2] === 6;
}

// Test forEach with named function declaration callback
export function ForEachNamedFuncTest3500() {
    const arr = [10, 20, 30];
    const results = [];
    function logItem(item) {
        results.push(item);
    }
    arr.forEach(logItem);
    return results.length === 3 && results[0] === 10 && results[1] === 20 && results[2] === 30;
}

// Test forEach strict mode without thisArg
export function ForEachStrictNoThisArgTest3600() {
    'use strict';
    let thisValue = 'not_set';
    const arr = [1];
    arr.forEach(function(element) {
        thisValue = this;
    });
    return thisValue === undefined;
}

// Test forEach at end of chain - filter map forEach
export function ForEachChainEndTest3700() {
    const arr = [1, 2, 3, 4, 5];
    const results = [];
    arr
        .filter(x => x > 2)
        .map(x => x * 2)
        .forEach(x => results.push(x));
    return results.length === 3 && results[0] === 6 && results[1] === 8 && results[2] === 10;
}

// Test forEach object type elements modify via reference
export function ForEachObjectRefTest3800() {
    const arr = [{a: 1}, {b: 2}];
    arr.forEach((element) => {
        element.c = 3;
    });
    return arr[0].c === 3 && arr[1].c === 3;
}

// Test forEach with function expression elements
export function ForEachFuncExprElementTest3900() {
    const arr = [function() { return 1; }, function() { return 2; }];
    const results = [];
    arr.forEach(function(item) {
        results.push(item());
    });
    return results.length === 2 && results[0] === 1 && results[1] === 2;
}

// Test forEach delete already visited element with shift
export function ForEachDeleteVisitedTest4000() {
    const words = ['one', 'two', 'three'];
    const visited = [];
    words.forEach((word) => {
        visited.push(word);
        if (word === 'two') {
            words.shift();
        }
    });
    return visited.length === 2 && visited[0] === 'one' && visited[1] === 'two';
}

// Test forEach delete unvisited element with shift
export function ForEachDeleteUnvisitedTest4100() {
    const words = ['one', 'two', 'three', 'four'];
    const visited = [];
    words.forEach((word) => {
        visited.push(word);
        if (word === 'two') {
            words.shift();
        }
    });
    return visited.length === 3 && visited[0] === 'one' && visited[1] === 'two' && visited[2] === 'four';
}

// Test forEach cannot break - always completes all iterations
export function ForEachNoBreakTest4200() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    arr.forEach((item) => {
        visited.push(item);
    });
    return visited.length === 5;
}


// Test forEach delete array element during iteration
export function ForEachDeleteElementTest4300() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    arr.forEach((item, index) => {
        visited.push(item);
        if (index === 1) {
            delete arr[3];
        }
    });
    return visited.length === 4 && visited[0] === 1 && visited[1] === 2 && visited[2] === 3 && visited[3] === 5;
}

// Test forEach with Array.prototype.forEach.apply on array-like
export function ForEachApplyArrayLikeTest4400() {
    const arrayLike = {
        length: 3,
        0: 'x',
        1: 'y',
        2: 'z'
    };
    const results = [];
    Array.prototype.forEach.apply(arrayLike, [(item) => {
        results.push(item);
    }]);
    return results.length === 3 && results[0] === 'x' && results[1] === 'y' && results[2] === 'z';
}

// Test forEach with array-like length 0
export function ForEachArrayLikeZeroLengthTest4500() {
    const arrayLike = {
        length: 0,
        0: 'a',
        1: 'b'
    };
    const results = [];
    Array.prototype.forEach.call(arrayLike, (item) => {
        results.push(item);
    });
    return results.length === 0;
}

// Test forEach class method with arrow function
export function ForEachClassArrowTest4600() {
    class Calculator {
        constructor() {
            this.sum = 0;
            this.count = 0;
        }
        add(array) {
            array.forEach((entry) => {
                this.sum += entry;
                this.count++;
            });
        }
    }
    const calc = new Calculator();
    calc.add([2, 5, 8]);
    return calc.sum === 15 && calc.count === 3;
}

// Test forEach object method with arrow function
export function ForEachObjArrowTest4700() {
    const processor = {
        results: [],
        process: function(arr) {
            arr.forEach((item) => {
                this.results.push(item * 2);
            });
        }
    };
    processor.process([1, 2, 3]);
    return processor.results[0] === 2 && processor.results[1] === 4 && processor.results[2] === 6;
}


// Test forEach strict mode accessing property on undefined this throws TypeError
export function ForEachStrictThisErrorTest4800() {
    'use strict';
    const arr = [1];
    let errorCaught = false;
    let isErrorType = false;
    try {
        arr.forEach(function(item) {
            this.value;
        });
    } catch (e) {
        errorCaught = true;
        isErrorType = e instanceof TypeError;
    }
    return errorCaught && isErrorType;
}

// Test forEach strict mode with null thisArg
export function ForEachStrictThisArgNullTest4900() {
    'use strict';
    const arr = [1];
    let thisValue = 'not_set';
    arr.forEach(function(element) {
        thisValue = this;
    }, null);
    return thisValue === null;
}

// Test forEach strict mode with undefined thisArg
export function ForEachStrictThisArgUndefinedTest5000() {
    'use strict';
    const arr = [1];
    let thisValue = 'not_set';
    arr.forEach(function(element) {
        thisValue = this;
    }, undefined);
    return thisValue === undefined;
}
