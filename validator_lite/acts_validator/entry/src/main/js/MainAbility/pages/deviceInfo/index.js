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

import router from '@system.router';
import device from '@system.device';

export default {
    data: {
        itemIndex: -1,
        str: '',
        title: 'deviceInfo',
        pass: 'true ;',
        fail: 'false;',

        todolist:[{
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        },
        {
            title: ''
        }
        ],
    },

    clickAction() {
        let obj = this;
        console.info('clickAction');
        device.getInfo({
            success: function(data) {

                obj.todolist[0].title = 'band:' + data.brand;
                obj.todolist[1].title = 'manufacturer:' + data.manufacturer;
                obj.todolist[2].title = 'model:' + data.model;
                obj.todolist[3].title = 'product:' + data.product;
                obj.todolist[4].title = 'language:' + data.language;
                obj.todolist[5].title = 'region:' + data.region;
                obj.todolist[6].title = 'windowHeight:' + data.windowHeight;
                obj.todolist[7].title = 'windowWidth:' + data.windowWidth;
                obj.todolist[8].title = 'screenDensity:' + data.screenDensity;
                obj.todolist[9].title = 'screenShape:' + data.screenShape;
                obj.todolist[10].title = 'apiVersion:' + data.apiVersion;
                obj.todolist[11].title = 'deviceType:' + data.deviceType;
                console.log('get device info success, data:' + JSON.stringify(data));
            },
            fail: function(data, code) {
                obj.brand = 'get device info failed, errorcode:' + code;
                console.log('get device info failed');
            },
            complete: function() {
                console.log('get device info completed');
            }
        });
    },
    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击获取信息按钮',
                result: '预期结果：屏幕上显示设备信息，滑动看到所有信息',
                url: 'pages/deviceInfo/index',
                itemIndex: this.itemIndex
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({
            uri: 'pages/second-api/index',
            params: {
                itemIndex: this.itemIndex
            }
        });
    },

    changeResult(result) {
        getApp().data.keyList[this.title] = result;
        this.back();
    },
};