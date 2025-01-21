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
import storage from '@system.storage';
let strData = '';
export const saveTxtData = function (obj, str) {

    console.info('saveTxtData key= ' + obj.title + ', str= ' + str);
    let keyStr = obj.title;
    storage.set({
       key: keyStr,
       value: str,
       success: function () {
           console.info('storage set success, key= ' + keyStr + 'value= ' + str);
       },
       fail: function () {
           console.info('storage set fail, key= ' + keyStr + 'value= ' + str);
       },
       complete: function () {
           console.info('storage set call complete');
       }
    });

};

export const getTxtData = function () {
    let keyList = [
        'chart(bar)',
        'chart(line)',
        'image-animator',
        'input',
        'list-item',
        'longpress',
        'marquee',
        'opacity',
        'picker-view',
        'progress',
        'qrcode',
        'slider',
        'swipe',
        'swiper',
        'switch',
        'transition',
        'app',
        'configuration',
        'timer(timeout)',
        'timer(interval)',
        'storage',
        'file',
        'vibrator',
        'stepCounter',
        'barometer',
        'heartRate',
        'onBodyState',
        'accelerometer',
        'gyroscope',
        'location(info)',
        'location(subscribe)',
        'deviceInfo',
        'brightness(value)',
        'brightness(mode)',
        'battery',
        'nfc'
    ];

    for (let index = 0; index < keyList.length; index++) {
        const element = keyList[index];
        getStorageData(element, index, keyList.length);
    }
};

export const getStorageData = function (element, index, totalLength) {

    storage.get({
        key: element,
        success: function (data) {
            console.info('storage get call success, key= ' + element + ', value= ' + data);
            if (data !== '') {
                strData += element + ':' + data;
            }
            if (index === totalLength - 1) {
                console.info('get data complete strData= ' + strData);
                saveTxtFile(strData);
            }
        },
        fail: function (data, code) {
            console.info('storage get call fail, key= ' + element);
        },
        complete: function () {
            console.info('storage get call complete');
        },
    });
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