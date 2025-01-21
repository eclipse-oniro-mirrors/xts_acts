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

import { saveTxtData } from '../../../common/js/saveData';
import router from '@system.router';

export default {
    data: {
        defaultTime: '',
        time: '',
        str: '',
        title: 'picker-view',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
        this.defaultTime = this.now();
        this.time = this.defaultTime;
    },

    handleChange(data) {
        this.time = this.concat(data.hour, data.minute);
    },

    onDestroy() {
        console.info('onDestroy');

    },

    now() {
        const date = new Date();
        const hours = date.getHours();
        const minutes = date.getMinutes();
        console.log('now hours:' + hours + ' minutes:' + minutes);
        return this.concat(hours, minutes);
    },

    fill(value) {
        return (value > 9 ? '' : '0') + value;
    },

    concat(hours, minutes) {
        return this.fill(hours) + ':' + this.fill(minutes);
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：滑动选择器修改选择时间',
                result: '预期结果：红色字体的时间跟随滑动选择器变化，时间并保持一致',
                url: 'pages/picker-view/time/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({ uri: 'pages/second-compent/index' });
    },

    changeResult(result) {
        saveTxtData(this, result);
    },
};
