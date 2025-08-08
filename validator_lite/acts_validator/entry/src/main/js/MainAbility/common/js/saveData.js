/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import file from '@system.file';

export const getTxtData = function () {
    let dataInfo = getApp().data.keyList
    let str = '';
    for (const key in dataInfo) {
        if (Object.prototype.hasOwnProperty.call(dataInfo, key)) {
            console.log(`${key}: ${dataInfo[key]}`);
            str = str + key + ':' + dataInfo[key];
        }
    }
    console.info('save data: ' + str);
    saveTxtFile(str);
};

export const saveTxtFile = function (str) {
    console.info('write str= ' + str);
    file.writeText({
        uri: 'internal://app/summary_report.json',
        text: str,
        success: function() {
            console.log('call writeText success.');
        },
        fail: function(data, code) {
            console.error('write call fail callback fail, code: ' + code + ', data: ' + data);
        },
    });
};