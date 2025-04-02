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
import cardEmulation from '@ohos.nfc.cardEmulation';

export default {
    data: {
        hceService: null,
        value: '',
        str: '',
        title: 'nfc',
        pass: 'true ;',
        fail: 'false;'
    },

    onInit() {
        console.info('onInit');
    },

    onDestroy() {
        console.info('onDestroy');
        this.hceService.stopHCE();
    },

    nfcOperate() {
        console.info('nfcOperate');
        this.value = '';
        this.hceService = new cardEmulation.HceService();
        this.hceService.startHCE([
            'F0010203040506', 'A0000000041010'
        ]);
        this.hceService.on('hceCmd', (res) => {
            this.value = 'success';
            console.info('callback => Operation hceCmd succeeded. Data: ' + res);
            this.hceService.sendResponse([0x00, 0xa4, 0x04, 0x00, 0x0e, 0x32, 0x50, 0x41, 0x59,
                0x2e, 0x53, 0x59, 0x53, 0x2e, 0x44, 0x44, 0x46, 0x30, 0x31, 0x00]);
        });
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：点击读卡按钮(接口中已有模拟卡片数据)',
                result: '预期结果：显示读卡：success',
                url: 'pages/nfc/index'
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
