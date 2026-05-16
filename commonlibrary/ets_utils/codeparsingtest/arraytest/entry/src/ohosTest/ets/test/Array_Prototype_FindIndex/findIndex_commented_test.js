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
export function testThisUndefinedWhenThisArgNotProvided() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.findIndex(function (element) {
        thisValue = this;
        return false;
    });
    return { result: thisValue === undefined, expected: true };
}

export function testThisNullWhenThisArgIsNull() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.findIndex(function (element) {
        thisValue = this;
        return false;
    }, null);
    return { result: thisValue === null, expected: true };
}

export function testThisUndefinedWhenThisArgIsUndefined() {
    const arr = [1, 2, 3];
    let thisValue = null;
    arr.findIndex(function (element) {
        thisValue = this;
        return false;
    }, undefined);
    return { result: thisValue === undefined, expected: true };
}

export function testNonFunctionCallbackThrowsTypeError() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.findIndex(undefined);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return { result: errorCaught, expected: true, errorName, expectedErrorName: 'TypeError' };
}

export function testNullCallbackThrowsTypeError() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.findIndex(null);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return { result: errorCaught, expected: true, errorName, expectedErrorName: 'TypeError' };
}

export function testNumberCallbackThrowsTypeError() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.findIndex(42);
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return { result: errorCaught, expected: true, errorName, expectedErrorName: 'TypeError' };
}

export function testStringCallbackThrowsTypeError() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.findIndex("not a function");
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return { result: errorCaught, expected: true, errorName, expectedErrorName: 'TypeError' };
}

export function testObjectCallbackThrowsTypeError() {
    const arr = [1, 2, 3];
    let errorCaught = false;
    let errorName;
    try {
        arr.findIndex({ key: "value" });
    } catch (e) {
        errorCaught = true;
        errorName = e.name;
    }
    return { result: errorCaught, expected: true, errorName, expectedErrorName: 'TypeError' };
}

export function testDeletedUnvisitedElementsTreatedAsUndefined() {
    const arr = [1, 2, 3, 4, 5];
    const visited = [];
    let result = -1;
    result = arr.findIndex((element, index) => {
        visited.push(element);
        if (index === 0) {
            delete arr[2];
        }
        return element === undefined;
    });
    return { result: result, expected: 2 };
}