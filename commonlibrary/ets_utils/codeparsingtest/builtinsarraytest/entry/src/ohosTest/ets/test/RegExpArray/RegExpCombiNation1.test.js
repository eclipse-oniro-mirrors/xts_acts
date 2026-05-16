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
'use strict'

export function RegExpCombination1Test053() {
    const re53 = /\s/g;
    const str53 = "a b\tc\nd";
    let match53_1 = str53.match(re53);
    let match53_2 = str53.match(re53);
    return [match53_1, re53.lastIndex, match53_2.length];
}

export function RegExpCombination1Test080() {
    const re80 = /(?<num>\d+)/g; // 命名分组num
    const str80 = "123 456";
    let replace80_1 = str80.replace(re80, "[$<num>]");
    let replace80_2 = str80.replace(re80, (_, num) => `{${num}}`); // 回调参数
    return [replace80_1, replace80_2];
}

export function RegExpCombination1Test120() {
    const re120 = /(q)(r)/g;
    const str120 = "qrqr";
    let log120 = [];
    str120.replace(re120, (match, g1, g2, index) => {
        log120.push(`${match}:${g1}:${g2}:${index}`);
        return "";
    });
    return log120;
}

