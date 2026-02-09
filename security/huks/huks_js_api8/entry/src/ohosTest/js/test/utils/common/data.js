/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default class Data {
    static data63B = GetData(63)
    static data64B = GetData(64)
    static data65B = GetData(65)
    static Data_63KB = GetData(63 * 1024)
    static Data_64KB = GetData(64 * 1024)
    static Data_65KB = GetData(65 * 1024)
}

export function GetData(size) {
    let data = new Array;
    for (let i = 0; i < size; i++) {
        data.push('A');
    }
    return data.join("")
}