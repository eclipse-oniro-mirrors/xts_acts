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
"use strict";

export function testProxyEntries() {
    const arr = ['a', 'b', 'c'];
    const proxy = new Proxy(arr, {});
    const iterator = proxy.entries();
    const entries = [...iterator];
    const result = JSON.stringify(entries);
    return { result, expected: JSON.stringify([[0, 'a'], [1, 'b'], [2, 'c']]) };
}

export function testProxyGetIntercept() {
    const arr = ['a', 'b', 'c'];
    const loggedGets = [];
    const proxy = new Proxy(arr, {
        get(target, prop) {
            loggedGets.push(prop);
            return target[prop];
        }
    });
    const iterator = proxy.entries();
    iterator.next();
    const result = loggedGets.includes('entries');
    return { result, expected: true };
}

export function testProxyLengthIntercept() {
    const arr = ['a', 'b'];
    let lengthAccessed = false;
    const proxy = new Proxy(arr, {
        get(target, prop) {
            if (prop === 'length') {
                lengthAccessed = true;
            }
            return target[prop];
        }
    });
    const iterator = proxy.entries();
    iterator.next();
    return { result: lengthAccessed, expected: true };
}