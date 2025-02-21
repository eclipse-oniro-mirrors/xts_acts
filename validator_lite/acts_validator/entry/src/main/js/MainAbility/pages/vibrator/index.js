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
import Vibrator from '@system.vibrator';

export default {
    data: {
        strStates: ['短振动', '长振动'],
        state: '',
        str: '',
        title: 'vibrator',
        pass: 'true ;',
        fail: 'false;'
    },

    clickActionShort() {
        console.info('vibrate short');
        let obj = this;
        Vibrator.vibrate({
            mode: 'short',
            success: function(ret) {
                obj.state = this.strStates[0];
                console.info('vibrate is successful');
            },
            fail: function(ret) {
                console.info('vibrate is failed');
            },
            complete: function(ret) {
                console.info('vibrate is completed');
            }
        });
    },

    clickActionLong() {
        console.info('vibrate long');
        let obj = this;
        Vibrator.vibrate({
            mode: 'long',
            success: function(ret) {
                obj.state = this.strStates[1];
                console.info('vibrate is successful');
            },
            fail: function(ret) {
                console.info('vibrate is failed');
            },
            complete: function(ret) {
                console.info('vibrate is completed');
            }
        });
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击短振动、长振动按钮',
                result: '预期结果：状态信息显示正确并且在点击短振动按钮设备振动一下，点击长振动按钮设备振动较长时间',
                url: 'pages/vibrator/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({ uri: 'pages/second-api/index' });
    },

    changeResult(result) {
        saveTxtData(this, result);
    },
};
