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

export function getDSTBoundaries(year) {
    let dstStart, dstEnd;
    let currentOffset = null;

    for (let month = 0; month < 12; month++) {
        const date = new Date(year, month, 15);
        const offset = -date.getTimezoneOffset();

        if (currentOffset !== null && offset !== currentOffset) {
            if (offset > currentOffset) {
                dstStart = new Date(year, month, 1);
                for (let day = 1; day <= 31; day++) {
                    const testDate = new Date(year, month, day);
                    if (-testDate.getTimezoneOffset() > currentOffset) {
                        dstStart = testDate;
                        break;
                    }
                }
            } else {
                dstEnd = new Date(year, month, 1);
                for (let day = 1; day <= 31; day++) {
                    const testDate = new Date(year, month, day);
                    if (-testDate.getTimezoneOffset() < currentOffset) {
                        dstEnd = testDate;
                        break;
                    }
                }
            }
        }
        currentOffset = offset;
    }

    return { dstStart, dstEnd };
}


export function isDaylightSavingTime(date) {
    const year = date.getFullYear();
    const jan = new Date(year, 0, 1);
    const jul = new Date(year, 6, 1);
    const standardOffset = -jan.getTimezoneOffset();
    const daylightOffset = -jul.getTimezoneOffset();
    const currentOffset = -date.getTimezoneOffset();

    return currentOffset === daylightOffset && standardOffset !== daylightOffset;
}





