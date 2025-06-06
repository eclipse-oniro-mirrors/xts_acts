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

export default {
    data:{
        itemIndex: NaN,
        index: 0,
        intervalID: -1,
        str: '',
        title: 'timer(interval)',
        pass: 'true ;',
        fail: 'false;'
    },

    onDestroy() {
        console.info('onDestroy');
        this.clearTimer();
    },

    startInterval() {
        this.index = 0;
        if (this.intervalID !== -1) {
            clearInterval(this.intervalID);
        }
        this.intervalID = setInterval(()=> {
            this.index = this.index + 1;
        }, 1000);
    },

    clearTimer() {
        console.info('clearTimer intervalID = ' + this.intervalID);
        clearInterval(this.intervalID);
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击startInterval、clearInterval',
                result: '预期结果：点击startInterval每过1s数字加1，在点clearInterval时数字停止增加',
                url: 'pages/timer/setInterval02/index'
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