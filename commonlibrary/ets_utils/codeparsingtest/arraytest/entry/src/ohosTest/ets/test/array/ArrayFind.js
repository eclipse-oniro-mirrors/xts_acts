/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export function testArrayFindJs0032() {
    const arr = [0, -0, 1];
    const result = arr.find((v) => Object.is(v, -0));
    return Object.is(result, -0);
}

export function testArrayFindJs0070() {
    const arr = Object.freeze([1, 2, 3]);
    const result = arr.find((x) => x === 4);
    return result;
}

export function testArrayFindJs0072() {
    const sym = Symbol("test");
    const arr = ["a", "b", "c"];
    const result = arr.find((x) => x === sym);
    return result;
}

export function testArrayFindJs0104() {
    const sym1 = Symbol("a");
    const sym2 = Symbol("b");
    const arr = [sym1, sym2];
    const result = arr.find((x) => x === sym2);
    return result === sym2;
}