/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import access from '@ohos.bluetooth.access';
import constant from '@ohos.bluetooth.constant';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtBleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;

export default function bluetoothAccessTest() {

    describe("bluetoothAccessTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            try {
                await Utils.msSleep(2000);
                hilog.info(domain, tag, " uitestOnTest load up over!!!!!")
                g_context = Hypium.get('Context') as common.UIAbilityContext;
                let atManager = abilityAccessCtrl.createAtManager();
                let arr: Array<Permissions> = new Array<Permissions>();
                arr.push('ohos.permission.ACCESS_BLUETOOTH')
                atManager.requestPermissionsFromUser(g_context, arr,
                    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                        hilog.info(0x0000, 'testTag', ' requestPermissionsFromUser end');
                        hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
                        hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
                    });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /**
         * @tc.name   constantTest
         * @tc.number constantTest
         * @tc.desc   Test constantTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("constantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let STATE_DISCONNECTED: constant.ProfileConnectionState = constant.ProfileConnectionState.STATE_DISCONNECTED;
                hilog.info(domain, tag, "STATE_DISCONNECTED:" + STATE_DISCONNECTED);
                expect(true).assertEqual(STATE_DISCONNECTED == 0);
                let STATE_CONNECTED: constant.ProfileConnectionState = constant.ProfileConnectionState.STATE_CONNECTED;
                hilog.info(domain, tag, "STATE_CONNECTED:" + STATE_CONNECTED);
                expect(true).assertEqual(STATE_CONNECTED == 2);
                let MAJOR_AUDIO_VIDEO: constant.MajorClass = constant.MajorClass.MAJOR_AUDIO_VIDEO;
                hilog.info(domain, tag, "MAJOR_AUDIO_VIDEO:" + MAJOR_AUDIO_VIDEO);
                expect(true).assertEqual(MAJOR_AUDIO_VIDEO == 0x0400);
                let MAJOR_UNCATEGORIZED: constant.MajorClass = constant.MajorClass.MAJOR_UNCATEGORIZED;
                hilog.info(domain, tag, "MAJOR_UNCATEGORIZED:" + MAJOR_UNCATEGORIZED);
                expect(true).assertEqual(MAJOR_UNCATEGORIZED == 0x1F00);
                let MAJOR_PHONE: constant.MajorClass = constant.MajorClass.MAJOR_PHONE;
                hilog.info(domain, tag, "MAJOR_PHONE:" + MAJOR_PHONE);
                expect(true).assertEqual(MAJOR_PHONE == 0x0200);
                let AUDIO_VIDEO_LOUDSPEAKER: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_LOUDSPEAKER;
                hilog.info(domain, tag, "AUDIO_VIDEO_LOUDSPEAKER:" + AUDIO_VIDEO_LOUDSPEAKER);
                expect(true).assertEqual(AUDIO_VIDEO_LOUDSPEAKER == 0x0414);
                let AUDIO_VIDEO_WEARABLE_HEADSET: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_WEARABLE_HEADSET;
                hilog.info(domain, tag, "AUDIO_VIDEO_WEARABLE_HEADSET:" + AUDIO_VIDEO_WEARABLE_HEADSET);
                expect(true).assertEqual(AUDIO_VIDEO_WEARABLE_HEADSET == 0x0404);
                let AUDIO_VIDEO_HEADPHONES: constant.MajorMinorClass = constant.MajorMinorClass.AUDIO_VIDEO_HEADPHONES;
                hilog.info(domain, tag, "AUDIO_VIDEO_HEADPHONES:" + AUDIO_VIDEO_HEADPHONES);
                expect(true).assertEqual(AUDIO_VIDEO_HEADPHONES == 0x0418);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "constant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.name   bluetoothOnOffStateTest
         * @tc.number bluetoothOnOffStateTest
         * @tc.desc   Test bluetoothOnOffStateTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("bluetoothOnOffStateTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.disableBluetooth();
                await Utils.clickRequestPermission("关闭");
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try{
                let state: access.BluetoothState = access.getState();
                hilog.info(domain, tag, "getState:" + state);
                expect(true).assertEqual(state == access.BluetoothState.STATE_OFF);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try{
                access.enableBluetooth();
                await Utils.clickRequestPermission("开启");
            }catch(err: BusinessError){
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(2000);
            try {
                let states: access.BluetoothState = access.getState();
                hilog.info(domain, tag, "getState:" + states);
                expect(true).assertEqual(states == access.BluetoothState.STATE_ON);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   accessConstantTest
         * @tc.number accessConstantTest
         * @tc.desc   Test accessConstantTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("accessConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let STATE_OFF: access.BluetoothState = access.BluetoothState.STATE_OFF;
                hilog.info(domain, tag, "STATE_OFF:" + STATE_OFF);
                expect(true).assertEqual(STATE_OFF == 0);
                let STATE_ON: access.BluetoothState = access.BluetoothState.STATE_ON;
                hilog.info(domain, tag, "STATE_ON:" + STATE_ON);
                expect(true).assertEqual(STATE_ON == 2);
                let STATE_TURNING_OFF: access.BluetoothState = access.BluetoothState.STATE_TURNING_OFF;
                hilog.info(domain, tag, "STATE_TURNING_OFF:" + STATE_TURNING_OFF);
                expect(true).assertEqual(STATE_TURNING_OFF == 3);
                let STATE_TURNING_ON: access.BluetoothState = access.BluetoothState.STATE_TURNING_ON;
                hilog.info(domain, tag, "STATE_TURNING_ON:" + STATE_TURNING_ON);
                expect(true).assertEqual(STATE_TURNING_ON == 1);
                let STATE_BLE_TURNING_OFF: access.BluetoothState = access.BluetoothState.STATE_BLE_TURNING_OFF;
                hilog.info(domain, tag, "STATE_BLE_TURNING_OFF:" + STATE_BLE_TURNING_OFF);
                expect(true).assertEqual(STATE_BLE_TURNING_OFF == 6);
                let STATE_BLE_ON: access.BluetoothState = access.BluetoothState.STATE_BLE_ON;
                hilog.info(domain, tag, "STATE_BLE_ON:" + STATE_BLE_ON);
                expect(true).assertEqual(STATE_BLE_ON == 5);
                let STATE_BLE_TURNING_ON: access.BluetoothState = access.BluetoothState.STATE_BLE_TURNING_ON;
                hilog.info(domain, tag, "STATE_BLE_TURNING_ON:" + STATE_BLE_TURNING_ON);
                expect(true).assertEqual(STATE_BLE_TURNING_ON == 4);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "accessConstant get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.name   stateChangeTest
         * @tc.number stateChangeTest
         * @tc.desc   Test stateChangeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("stateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: access.BluetoothState) => void = (changeInfo: access.BluetoothState) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo stateChange:" + changeInfo);
            }
            try{
                access.onStateChange(onReceiveEvent);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "stateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                access.offStateChange();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "stateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   stateChangeTest2
         * @tc.number stateChangeTest2
         * @tc.desc   Test stateChangeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("stateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: access.BluetoothState) => void = (changeInfo: access.BluetoothState) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo stateChange:" + changeInfo);
            }
            try{
                access.onStateChange(onReceiveEvent);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "stateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                access.offStateChange(onReceiveEvent);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "stateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
    })
}