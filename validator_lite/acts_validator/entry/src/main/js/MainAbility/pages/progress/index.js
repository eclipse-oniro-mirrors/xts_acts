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

import { saveTxtData } from '../../common/js/saveData';
import router from '@system.router';

export default {
    data: {
        arcVal: 10,
        horizontalVal: 10,
        str: '',
        title: 'progress',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
    },

    changeHorizontal(e) {
        console.log('click e ' + JSON.stringify(e));

        this.horizontalVal += 10;
    },

    changeArc(e) {
        console.log('click e ' + JSON.stringify(e));
        this.arcVal += 10;
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击线下进度条或弧形进度条',
                result: '预期结果：进度条向前增加',
                url: 'pages/progress/index'
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
