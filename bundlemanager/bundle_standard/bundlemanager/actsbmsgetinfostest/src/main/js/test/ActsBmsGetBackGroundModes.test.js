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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit'

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME4 = 'com.example.third4';
const BUNDLE_NAME5 = 'com.example.third5';
const BUNDLE_NAME6 = 'com.example.third6';
const ABILITIY_NAME1 = "com.example.third5.MainAbilityA";
const ABILITIY_NAME2 = "com.example.third5.MainAbilityB";
const ABILITIY_NAME3 = "com.example.third2.MainAbilityA";
const ABILITIY_NAME4 = "com.example.third4.MainAbility";
const ABILITIY_NAME5 = "com.example.third1.MainAbilityA";
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

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERY_0085
    * @tc.name: getBackgroundModesMultiAbility
    * @tc.desc: Get the information of the background modes from multi-ability application
    */
    it('getBackgroundModesMultiAbility', 0, async function (done) {
        let dataInfos = await bundle.queryAbilityByWant({
            action: 'action.system.home',
            entities: ['entity.system.home'],
            deviceId: '0',
            bundleName: BUNDLE_NAME5,
            abilityName: ''
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        expect(dataInfos.length).assertEqual(NUM_FOUR);
        if (dataInfos.length == NUM_FOUR) {
            expect(dataInfos[NUM_TWO].name).assertEqual(ABILITIY_NAME1);
            expect(dataInfos[NUM_TWO].backgroundModes).assertEqual(DATATRANSFER | AUDIOPLAYBACK | AUDIORECORDING |
                LOCATION | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING);
            expect(dataInfos[NUM_THREE].name).assertEqual(ABILITIY_NAME2);
            expect(dataInfos[NUM_THREE].backgroundModes).assertEqual(DATATRANSFER | VOIP);
        }
        let bundleInfos = await bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, userId);
        for (let i = 0; i < bundleInfos.length; i++) {
            if (bundleInfos[i].name == BUNDLE_NAME5) {
                for (let j = 0; j < bundleInfos[i].abilityInfos.length; j++) {
                    if (bundleInfos[i].abilityInfos[j].name == ABILITIY_NAME1) {
                        expect(bundleInfos[i].abilityInfos[j].backgroundModes).assertEqual(DATATRANSFER |
                            AUDIOPLAYBACK | AUDIORECORDING | LOCATION | BLUETOOTHINTERACTION |
                            MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING);
                    } else if (bundleInfos[i].abilityInfos[j].name == ABILITIY_NAME2) {
                        expect(bundleInfos[i].abilityInfos[j].backgroundModes).assertEqual(DATATRANSFER | VOIP);
                    }
                }
            }
        }
        let data3 = await bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(data3.abilityInfos[2].backgroundModes).assertEqual(DATATRANSFER | AUDIOPLAYBACK | AUDIORECORDING |
            LOCATION | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING);
        expect(data3.abilityInfos[3].backgroundModes).assertEqual(DATATRANSFER | VOIP);
        done();
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERY_0086
    * @tc.name: getBackgroundModesAllModes
    * @tc.desc: Get all background modes information, and each ability of the application
    *               contains one of the background mode
    */
    it('getBackgroundModesAllModes', 0, async function (done) {
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

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERY_0087
    * @tc.name: getBackgroundModesInvalidModes
    * @tc.desc: Read the backgroundModes information of the app's ability and replace invalid attributes 
    */
    it('getBackgroundModesInvalidModes', 0, async function (done) {
        let dataInfos = await bundle.queryAbilityByWant({
            action: 'action.system.home',
            entities: ['entity.system.home'],
            deviceId: '0',
            bundleName: BUNDLE_NAME2,
            abilityName: ''
        }, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        expect(dataInfos.length).assertEqual(NUM_TWO);
        if (dataInfos.length == NUM_TWO) {
            expect(dataInfos[1].name).assertEqual(ABILITIY_NAME3)
            expect(dataInfos[1].backgroundModes).assertEqual(AUDIOPLAYBACK | AUDIORECORDING | LOCATION
                | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING)
        }
        bundle.getAllBundleInfo(bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, userId, (err, bundleInfos) => {
            for (let i = 0; i < bundleInfos.length; i++) {
                if (bundleInfos[i].name == BUNDLE_NAME2) {
                    for (let j = 0; j < bundleInfos[i].abilityInfos.length; j++) {
                        if (bundleInfos[i].abilityInfos[j].name == ABILITIY_NAME3) {
                            expect(bundleInfos[i].abilityInfos[j].backgroundModes).assertEqual(
                                AUDIOPLAYBACK | AUDIORECORDING | LOCATION | BLUETOOTHINTERACTION
                                | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING);
                        }
                    }
                }
            }
            bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, (err, data3) => {
                expect(data3.abilityInfos[1].backgroundModes).assertEqual(AUDIOPLAYBACK | AUDIORECORDING | LOCATION
                    | BLUETOOTHINTERACTION | MULTIDEVICECONNECTION | WIFIINTERACTION | VOIP | TASKKEEPING);
                done();
            });
        });
    });

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERY_0088
    * @tc.name: getBackgroundModesNotModes
    * @tc.desc: Read the backgroundModes information of the app's ability and replace invalid attributes 
    */
    it('getBackgroundModesNotModes', 0, async function (done) {
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

    /*
    * @tc.number: SUB_BMS_APPINFO_QUERY_0089
    * @tc.name: getBackgroundModesMultiHap
    * @tc.desc: Get the backgroundModes information of the multi-hap package of the application 
    */
    it('getBackgroundModesMultiHap', 0, async function (done) {
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

})}
