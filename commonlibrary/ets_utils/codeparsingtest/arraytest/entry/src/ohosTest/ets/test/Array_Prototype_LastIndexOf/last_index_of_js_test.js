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
/**
 * Test Symbol type elements
 * @returns {Object} test result
 */
export function testSymbolElements() {
    const sym = Symbol("test");
    const arr = [Symbol("test"), sym, Symbol("test")];
    const result = arr.lastIndexOf(sym);

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test Symbol elements with same description
 * @returns {Object} test result
 */
export function testSymbolSameDescription() {
    const arr = [Symbol("foo"), Symbol("foo")];
    const result = arr.lastIndexOf(Symbol("foo"));

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf on arguments object
 * @returns {Object} test result
 */
export function testArgumentsObject() {
    function test() {
        return Array.prototype.lastIndexOf.call(arguments, 2);
    }
    const result = test(1, 2, 3);

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test lastIndexOf on custom array-like object
 * @returns {Object} test result
 */
export function testCustomArrayLike() {
    const arrayLike = {
        0: "a",
        1: "b",
        2: "c",
        length: 3
    };
    const result = Array.prototype.lastIndexOf.call(arrayLike, "b");

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test lastIndexOf with null this
 * @returns {Object} test result
 */
export function testThisNull() {
    let errorOccurred = false;
    try {
        Array.prototype.lastIndexOf.call(null, 1);
    } catch (e) {
        errorOccurred = e instanceof TypeError;
    }

    return {
        result: errorOccurred,
        expected: true
    };
}

/**
 * Test lastIndexOf with undefined this
 * @returns {Object} test result
 */
export function testThisUndefined() {
    let errorOccurred = false;
    try {
        Array.prototype.lastIndexOf.call(undefined, 1);
    } catch (e) {
        errorOccurred = e instanceof TypeError;
    }

    return {
        result: errorOccurred,
        expected: true
    };
}

/**
 * Test lastIndexOf with number this
 * @returns {Object} test result
 */
export function testThisNumber() {
    const result = Array.prototype.lastIndexOf.call(123, 1);

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with string this
 * @returns {Object} test result
 */
export function testThisString() {
    const result = Array.prototype.lastIndexOf.call("hello", "l");

    return {
        result: result,
        expected: 3
    };
}

/**
 * Test lastIndexOf with boolean this
 * @returns {Object} test result
 */
export function testThisBoolean() {
    const result = Array.prototype.lastIndexOf.call(true, 1);

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with no parameters (search for undefined)
 * @returns {Object} test result
 */
export function testNoParameters() {
    const arr = [1, 2, undefined, 4];
    const result = arr.lastIndexOf();

    return {
        result: result,
        expected: 2
    };
}

/**
 * Test lastIndexOf with no parameters in array with multiple undefined
 * @returns {Object} test result
 */
export function testNoParametersMultipleUndefined() {
    const arr = [1, undefined, 3, undefined];
    const result = arr.lastIndexOf();

    return {
        result: result,
        expected: 3
    };
}

/**
 * Test lastIndexOf with no parameters in empty array
 * @returns {Object} test result
 */
export function testNoParametersEmptyArray() {
    const arr = [];
    const result = arr.lastIndexOf();

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with NaN elements
 * @returns {Object} test result
 */
export function testNaNArray() {
    const arr = [NaN, NaN, NaN];
    const result = arr.lastIndexOf(NaN);

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with object reference
 * @returns {Object} test result
 */
export function testObjectReference() {
    const obj = { id: 1 };
    const arr = [{ id: 1 }, obj, { id: 1 }];
    const result = arr.lastIndexOf(obj);

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test lastIndexOf with different object reference but same content
 * @returns {Object} test result
 */
export function testDifferentObjectReference() {
    const arr = [{ id: 1 }, { id: 2 }];
    const result = arr.lastIndexOf({ id: 1 });

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with mixed reference types
 * @returns {Object} test result
 */
export function testMixedReferenceTypes() {
    const obj = { id: 1 };
    const arr = [{}, [], obj, () => { }];
    const result = arr.lastIndexOf(obj);

    return {
        result: result,
        expected: 2
    };
}

/**
 * Test lastIndexOf on frozen array
 * @returns {Object} test result
 */
export function testFrozenArray() {
    const arr = Object.freeze([1, 2, 3, 2, 1]);
    const result = arr.lastIndexOf(2);

    return {
        result: result,
        expected: 3
    };
}

/**
 * Test lastIndexOf on sealed array
 * @returns {Object} test result
 */
export function testSealedArray() {
    const arr = Object.seal([1, 2, 3, 2, 1]);
    const result = arr.lastIndexOf(2);

    return {
        result: result,
        expected: 3
    };
}

/**
 * Test lastIndexOf on sparse array
 * @returns {Object} test result
 */
export function testSparseArray() {
    const arr = [1, , , 4];
    const result = arr.lastIndexOf(undefined);

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf on sparse array for existing element
 * @returns {Object} test result
 */
export function testSparseArrayExistingElement() {
    const arr = [1, , , 4];
    const result = arr.lastIndexOf(2);

    return {
        result: result,
        expected: -1
    };
}

/**
 * Test lastIndexOf with string fromIndex
 * @returns {Object} test result
 */
export function testStringFromIndex() {
    const arr = [1, 2, 3, 4];
    const result = arr.lastIndexOf(3, "2");

    return {
        result: result,
        expected: 2
    };
}

/**
 * Test lastIndexOf with NaN fromIndex
 * @returns {Object} test result
 */
export function testNaNFromIndex() {
    const arr = [1, 2, 3, 4];
    const result = arr.lastIndexOf(3, NaN);

    return {
        result: result,
        expected: 2
    };
}

/**
 * Test lastIndexOf with object fromIndex (valueOf)
 * @returns {Object} test result
 */
export function testObjectFromIndex() {
    const arr = [1, 2, 3, 4];
    const obj = {
        valueOf: function () { return 3; }
    };
    const result = arr.lastIndexOf(2, obj);

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test lastIndexOf with array fromIndex
 * @returns {Object} test result
 */
export function testArrayFromIndex() {
    const arr = [1, 2, 3, 4];
    const result = arr.lastIndexOf(3, [2]);

    return {
        result: result,
        expected: 2
    };
}

/**
 * Test lastIndexOf with getter that modifies array
 * @returns {Object} test result
 */
export function testGetterModifiesArray() {
    const arr = [1, 2, 3];
    Object.defineProperty(arr, "1", {
        get: function () {
            arr.push(4);
            return 2;
        }
    });
    const result = arr.lastIndexOf(2);

    return {
        result: result,
        expected: 1
    };
}

/**
 * Test lastIndexOf does not trigger setter
 * @returns {Object} test result
 */
export function testNoSetterTrigger() {
    let setterCalled = false;
    const arr = [1, 2, 3];
    Object.defineProperty(arr, "1", {
        get: function () { return 2; },
        set: function () { setterCalled = true; }
    });
    arr.lastIndexOf(2);

    return {
        result: setterCalled,
        expected: false
    };
}

/**
 * Test lastIndexOf on proxy array
 * @returns {Object} test result
 */
export function testProxyArray() {
    const arr = [1, 2, 3, 2, 1];
    const proxy = new Proxy(arr, {
        get: function (target, prop) {
            return target[prop];
        }
    });
    const result = proxy.lastIndexOf(2);

    return {
        result: result,
        expected: 3
    };
}

/**
 * Test find result with lastIndexOf
 * @returns {Object} test result
 */
export function testFindResult() {
    const arr = [1, 2, 3, 4, 5];
    const found = arr.find(x => x > 3);
    const index = arr.lastIndexOf(found);

    return {
        result: index,
        expected: 4
    };
}

/**
 * Test find element from end and verify with lastIndexOf
 * @returns {Object} test result
 */
export function testFindFromEnd() {
    const arr = [1, 2, 3, 4, 5];
    let found;
    for (let i = arr.length - 1; i >= 0; i--) {
        if (arr[i] > 3) {
            found = arr[i];
            break;
        }
    }
    const lastIndex = arr.lastIndexOf(found);

    return {
        result: lastIndex,
        expected: 4
    };
}

/**
 * Test find last matching user in users array
 * @returns {Object} test result
 */
export function testFindLastUser() {
    const users = [
        { id: 1, name: "Alice" },
        { id: 2, name: "Bob" },
        { id: 1, name: "Alice" }
    ];
    const alice = users[0];
    const index = users.lastIndexOf(alice);

    return {
        result: index,
        expected: 2
    };
}

/**
 * Test find last occurrence of product in cart
 * @returns {Object} test result
 */
export function testFindLastProduct() {
    const cart = [
        { product: "Apple", qty: 2 },
        { product: "Banana", qty: 3 },
        { product: "Apple", qty: 1 }
    ];
    const apple = cart[0];
    const lastIndex = cart.lastIndexOf(apple);

    return {
        result: lastIndex,
        expected: 2
    };
}

/**
 * Test find element in mixed data types array
 * @returns {Object} test result
 */
export function testMixedDataTypes() {
    const arr = [1, "1", true, null, undefined, { id: 1 }];
    const result = arr.lastIndexOf(1);

    return {
        result: result,
        expected: 0
    };
}

/**
 * Test find circular reference in array
 * @returns {Object} test result
 */
export function testCircularReference() {
    const arr = [1, 2, 3];
    arr.push(arr);
    const result = arr.lastIndexOf(arr);

    return {
        result: result,
        expected: 3
    };
}