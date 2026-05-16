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

// Test push with Symbol type
export function PushSymbolTypeTest0100() {
    const arr = [];
    const sym = Symbol('description');
    arr.push(sym);
    return arr.length === 1 && arr[0] === sym;
}

// Test push with BigInt type
export function PushBigIntTypeTest0200() {
    const arr = [];
    arr.push(9007199254740991n);
    arr.push(BigInt(123));
    return arr.length === 2 && arr[0] === 9007199254740991n && arr[1] === 123n;
}

// Test push on array-like object
export function PushArrayLikeTest0300() {
    const obj = {
        0: 'a',
        1: 'b',
        length: 2
    };
    Array.prototype.push.call(obj, 'c');
    return obj.length === 3 && obj[2] === 'c';
}

// Test push on regular object
export function PushRegularObjectTest0400() {
    const obj = {};
    Array.prototype.push.call(obj, 'item');
    return obj.length === 1 && obj[0] === 'item';
}

// Test push on string 
export function PushStringReadOnlyTest0500() {
    const str = 'hello';
    try {
        Array.prototype.push.call(str, '!');
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test push on arguments object
export function PushArgumentsTest0600() {
    function test() {
        Array.prototype.push.call(arguments, 4);
        return arguments.length === 4 && arguments[3] === 4;
    }
    return test(1, 2, 3);
}

// Test push on TypedArray
export function PushTypedArrayTest0700() {
    const typedArr = new Int32Array([1, 2, 3]);
    try {
        Array.prototype.push.call(typedArr, 4);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test push with custom object with length property
export function PushCustomObjectTest0800() {
    const obj = {
        length: 0,
        add: function(item) {
            Array.prototype.push.call(this, item);
        }
    };
    obj.add('first');
    obj.add('second');
    return obj.length === 2 && obj[0] === 'first' && obj[1] === 'second';
}

// Test push with negative length
export function PushNegativeLengthTest0900() {
    const obj = {length: -1};
    Array.prototype.push.call(obj, 'item');
    return obj.length === 1;
}

// Test push with non-number length
export function PushNonNumberLengthTest1000() {
    const obj = {length: 'abc'};
    Array.prototype.push.call(obj, 'item');
    return obj.length === 1 && obj[0] === 'item';
}

// Test push on frozen array
export function PushFrozenArrayTest1100() {
    const arr = [1, 2, 3];
    Object.freeze(arr);
    try {
        arr.push(4);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test push on sealed array
export function PushSealedArrayTest1200() {
    const arr = [1, 2, 3];
    Object.seal(arr);
    try {
        arr.push(4);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test push with read-only length property
export function PushReadOnlyLengthTest1300() {
    const arr = [1, 2, 3];
    Object.defineProperty(arr, 'length', {writable: false});
    try {
        arr.push(4);
        return false;
    } catch (e) {
        return e instanceof TypeError;
    }
}

// Test push with read-only index property
export function PushReadOnlyIndexTest1400() {
    const arr = [1, 2, 3];
    Object.defineProperty(arr, '3', {value: 'fixed', writable: false});
    arr.push(4);
    return arr[3] === 'fixed' && arr[4] === 4 && arr.length === 5;
}

// Test push with Proxy
export function PushProxyTest1500() {
    const arr = [1, 2];
    let setCallCount = 0;
    const proxy = new Proxy(arr, {
        set(target, prop, value) {
            setCallCount++;
            target[prop] = value;
            return true;
        }
    });
    proxy.push(3);
    return proxy.length === 3 && setCallCount > 0;
}

// Test push with Proxy that blocks operation
export function PushProxyBlockTest1600() {
    const arr = [1, 2];
    const proxy = new Proxy(arr, {
        set(target, prop, value) {
            if (prop === 'length' && value > 3) {
                throw new Error('Max length exceeded');
            }
            target[prop] = value;
            return true;
        }
    });
    proxy.push(3);
    return proxy.length === 3 && proxy[0] === 1 && proxy[1] === 2 && proxy[2] === 3;
}

// Test modified Array.prototype.push
export function PushModifiedPrototypeTest1700() {
    const originalPush = Array.prototype.push;
    let customCalled = false;
    Array.prototype.push = function(...args) {
        customCalled = true;
        return originalPush.apply(this, args);
    };
    const arr = [1, 2];
    arr.push(3);
    Array.prototype.push = originalPush;
    return customCalled && arr.length === 3;
}

// Test push on array subclass
export function PushArraySubclassTest1800() {
    function MyArray() {}
    MyArray.prototype = Object.create(Array.prototype);
    const myArr = new MyArray();
    myArr.push(1, 2, 3);
    return myArr.length === 3;
}

// Test push with large number of elements
export function PushLargeElementsTest1900() {
    const arr = [];
    for (let i = 0; i < 10000; i++) {
        arr.push(i);
    }
    return arr.length === 10000;
}

// Test push with spread of many elements
export function PushSpreadManyTest2000() {
    const arr = [];
    const elements = [];
    for (let i = 0; i < 10000; i++) {
        elements.push(i);
    }
    arr.push(...elements);
    return arr.length === 10000;
}

// Test push on sparse array
export function PushSparseArrayTest2100() {
    const arr = [];
    arr[100000] = 'value';
    arr.push('new');
    return arr.length === 100002 && arr[100000] === 'value' && arr[100000] === 'value';
}

// Test push on dense array
export function PushDenseArrayTest2200() {
    const arr = new Array(100000);
    arr.fill(0);
    arr.push(1);
    return arr.length === 100001;
}

// Test push vs concat performance scenario
export function PushVsConcatTest2300() {
    const arr1 = [1, 2, 3];
    const arr2 = [4, 5, 6];
    arr1.push(...arr2);
    return arr1.length === 6 && arr1[0] === 1 && arr1[5] === 6;
}

// Test push vs direct assignment
export function PushVsDirectAssignmentTest2400() {
    const arr1 = [1, 2, 3];
    const arr2 = [1, 2, 3];
    arr1.push(4);
    arr2[arr2.length] = 4;
    return JSON.stringify(arr1) === JSON.stringify(arr2);
}

// Test push with pre-allocated array
export function PushPreallocatedTest2500() {
    const arr = new Array(1000);
    arr.fill(0);
    for (let i = 0; i < 100; i++) {
        arr.push(i);
    }
    return arr.length === 1100;
}

// Test push with dynamic expansion
export function PushDynamicExpansionTest2600() {
    const arr = [];
    for (let i = 0; i < 1000; i++) {
        arr.push(i);
    }
    return arr.length === 1000;
}

// Test push in data collection scenario
export function PushDataCollectionTest2700() {
    const inputs = [];
    function collectInput(value) {
        inputs.push(value);
    }
    collectInput('John');
    collectInput('Jane');
    collectInput('Bob');
    return JSON.stringify(inputs) === JSON.stringify(['John', 'Jane', 'Bob']);
}

// Test push in event logging scenario
export function PushEventLoggingTest2800() {
    const EventsLog = [];
    function logEvent(event) {
        EventsLog.push({
            type: event.type,
            timestamp: Date.now(),
            data: event.data
        });
    }
    logEvent({type: 'click', data: {x: 100, y: 200}});
    logEvent({type: 'keypress', data: {key: 'Enter'}});
    return EventsLog.length === 2;
}

// Test push in queue implementation
export function PushQueueTest2900() {
    const queue = [];
    function enqueue(item) {
        queue.push(item);
    }
    function dequeue() {
        return queue.shift();
    }
    enqueue('task1');
    enqueue('task2');
    enqueue('task3');
    return dequeue() === 'task1' && dequeue() === 'task2' && queue[0] === 'task3';
}

// Test push in priority queue implementation
export function PushPriorityQueueTest3000() {
    const pq = [];
    function enqueue(item, priority) {
        pq.push({item, priority});
        pq.sort((a, b) => b.priority - a.priority);
    }
    enqueue('low', 1);
    enqueue('high', 10);
    enqueue('medium', 5);
    return pq[0].item === 'high';
}

// Test push in stack implementation
export function PushStackTest3100() {
    const stack = [];
    function push(item) {
        stack.push(item);
    }
    function pop() {
        return stack.pop();
    }
    push('a');
    push('b');
    push('c');
    return pop() === 'c' && pop() === 'b' && stack[0] === 'a';
}

// Test push in object array conversion
export function PushObjectArrayTest3200() {
    const users = [
        {name: 'John', age: 30},
        {name: 'Jane', age: 25},
        {name: 'Bob', age: 35}
    ];
    const names = [];
    users.forEach(user => names.push(user.name));
    return JSON.stringify(names) === JSON.stringify(['John', 'Jane', 'Bob']);
}

// Test push in filtered collection
export function PushFilteredCollectionTest3300() {
    const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const evens = [];
    numbers.forEach(num => {
        if (num % 2 === 0) {
            evens.push(num);
        }
    });
    return JSON.stringify(evens) === JSON.stringify([2, 4, 6, 8, 10]);
}

// Test push in tree structure construction
export function PushTreeConstructionTest3400() {
    const tree = {children: []};
    tree.children.push({name: 'child1', children: []});
    tree.children.push({name: 'child2', children: []});
    tree.children[0].children.push({name: 'grandchild1', children: []});
    return tree.children.length === 2 && tree.children[0].children.length === 1;
}

// Test push in matrix construction
export function PushMatrixConstructionTest3500() {
    const matrix = [];
    for (let i = 0; i < 3; i++) {
        const row = [];
        for (let j = 0; j < 3; j++) {
            row.push(i * 3 + j + 1);
        }
        matrix.push(row);
    }
    return JSON.stringify(matrix) === JSON.stringify([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
}

// Test push in batch processing
export function PushBatchProcessingTest3600() {
    const allData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const batches = [];
    let currentBatch = [];
    allData.forEach((item, index) => {
        currentBatch.push(item);
        if (currentBatch.length === 3 || index === allData.length - 1) {
            batches.push(currentBatch);
            currentBatch = [];
        }
    });
    return batches.length === 4 && JSON.stringify(batches[0]) === JSON.stringify([1, 2, 3]);
}

// Test push in result accumulation
export function PushResultAccumulationTest3700() {
    const results = [];
    const data = [1, 2, 3, 4, 5];
    data.forEach(num => {
        results.push(num * 2);
    });
    return JSON.stringify(results) === JSON.stringify([2, 4, 6, 8, 10]);
}

// Test push near maximum array length
export function PushNearMaxLengthTest3800() {
    try {
        const arr = new Array(4294967294);
        arr.fill(0);
        const result = arr.push(1);
        return result === 4294967295;
    } catch (e) {
        return false;
    }
}

// Test push exceeding maximum array length
export function PushExceedMaxLengthTest3900() {
    try {
        const arr = new Array(4294967295);
        arr.fill(0);
        arr.push(1);
        return false;
    } catch (e) {
        return e instanceof RangeError;
    }
}

// Test push with empty array multiple times
export function PushEmptyArrayMultipleTest4000() {
    const arr = [];
    arr.push(1);
    arr.push(2);
    arr.push(3);
    return JSON.stringify(arr) === JSON.stringify([1, 2, 3]);
}

// Test push after manual length modification
export function PushAfterLengthModificationTest4100() {
    const arr = [1, 2, 3];
    arr.length = 10;
    arr.push(4);
    return arr.length === 11 && arr[10] === 4;
}

// Test push adds to max index + 1
export function PushAddsToMaxIndexTest4200() {
    const arr = [1, 2, 3];
    const maxIndex = arr.length - 1;
    arr.push(4);
    return arr[maxIndex + 1] === 4;
}

// Test push on sparse array with large index
export function PushSparseArrayLargeIndexTest4300() {
    const arr = [];
    arr[1000] = 'value';
    arr.push('new');
    return arr[1001] === 'new' && arr.length === 1002;
}