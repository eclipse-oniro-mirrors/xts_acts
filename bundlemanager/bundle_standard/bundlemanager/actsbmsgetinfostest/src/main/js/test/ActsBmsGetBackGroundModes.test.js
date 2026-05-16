/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME4 = 'com.example.third4';
const BUNDLE_NAME5 = 'com.example.third5';
const BUNDLE_NAME6 = 'com.example.third6';
const ABILITIY_NAME1 = "com.example.third5.MainAbilityA";
const ABILITIY_NAME2 = "com.example.third5.MainAbilityB";
const ABILITIY_NAME3 = "com.example.third2.MainAbilityA";
const ABILITIY_NAME4 = "com.example.third4.MainAbility";
const ABILITIY_NAME5 = "com.example.third1.entry.MainAbilityA";
const ABILITIY_NAME6 = "com.example.third3.MainAbilityA";
const NUM_TWO = 2;
const NUM_THREE = 3;
const NUM_FOUR = 4;
const NUM_NINE = 9;
const DATATRANSFER = 1;
const AUDIOPLAYBACK = 2;
const AUDIORECORDING = 4;
const LOCATION = 8;
const BLUETOOTHINTERACTION = 16;
const MULTIDEVICECONNECTION = 32;
const WIFIINTERACTION = 64;
const VOIP = 128;
const TASKKEEPING = 256;
let userId = 0;

export default function ActsBmsGetBackGroundModes() {
    describe('ActsBmsGetBackGroundModes', function () {

        beforeAll(async function (done) {
            await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
                console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
                userId = account;
                done();
            }).catch(err => {
                console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
                done();
            })
        });

       

        /**
         * @tc.name   getBackgroundModesAllModes
         * @tc.number Sub_Bms_BundleTool_Query_Hap_1500
         * @tc.desc   Get all background modes information, and each ability of the application
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getBackgroundModesAllModes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            let dataInfos = await bundle.queryAbilityByWant({
                action: 'action.system.home',
                entities: ['entity.system.home'],
                deviceId: '0',
                bundleName: BUNDLE_NAME6,
                abilityName: ''
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
            expect(dataInfos.length).assertEqual(NUM_NINE);
            for (let i = 0, len = dataInfos.length; i < len; i++) {
                expect(dataInfos[i].backgroundModes).assertEqual(1 << i);
            }
            done();
        });

      
        /**
         * @tc.name   getBackgroundModesNotModes
         * @tc.number Sub_Bms_BundleTool_Query_Hap_1700
         * @tc.desc   Read the backgroundModes information of the app's ability and replace invalid attributes
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('getBackgroundModesNotModes', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let dataInfos = await bundle.queryAbilityByWant({
                action: 'action.system.home',
                entities: ['entity.system.home'],
                deviceId: '0',
                bundleName: BUNDLE_NAME4,
                abilityName: ''
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
            expect(dataInfos.length).assertEqual(1);
            if (dataInfos.length == 1) {
                expect(dataInfos[0].name).assertEqual(ABILITIY_NAME4)
                expect(dataInfos[0].backgroundModes).assertEqual(0)
            }
            done();
        });

        /**
         * @tc.name   getBackgroundModesMultiHap
         * @tc.number Sub_Bms_BundleTool_Query_Hap_1800
         * @tc.desc   Get the backgroundModes information of the multi-hap package of the application
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('getBackgroundModesMultiHap', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            let dataInfos = await bundle.queryAbilityByWant({
                action: 'action.system.home',
                entities: ['entity.system.home'],
                deviceId: '0',
                bundleName: BUNDLE_NAME1,
                abilityName: ''
            }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
            expect(dataInfos.length).assertEqual(NUM_FOUR);
            if (dataInfos.length == NUM_FOUR) {
                expect(dataInfos[1].name).assertEqual(ABILITIY_NAME5)
                expect(dataInfos[1].backgroundModes).assertEqual(DATATRANSFER | AUDIOPLAYBACK | AUDIORECORDING |
                    LOCATION | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING)
                expect(dataInfos[3].name).assertEqual(ABILITIY_NAME6)
                expect(dataInfos[3].backgroundModes).assertEqual(DATATRANSFER | AUDIOPLAYBACK | AUDIORECORDING |
                    LOCATION | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING)
            }
            done();
        });

    })
}
