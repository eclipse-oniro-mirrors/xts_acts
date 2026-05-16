/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import a2dp from '@ohos.bluetooth.a2dp';
import hfp from '@ohos.bluetooth.hfp';
import hid from '@ohos.bluetooth.hid';
import baseProfile from '@ohos.bluetooth.baseProfile';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtProfilesTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let deviceId: string = "00:11:22:33:44:55";
let g_context: common.UIAbilityContext;
let a2dpProfile: a2dp.A2dpSourceProfile | undefined;

function onReceiveEvent(data: baseProfile.StateChangeParam) {
    hilog.info(domain, tag, 'a2dp state = '+ JSON.stringify(data));
    hilog.info(domain, tag, 'connection StateChangeParam deviceId:'+ data.deviceId);
    hilog.info(domain, tag, 'connection StateChangeParam state:'+ data.state);
    hilog.info(domain, tag, 'connection StateChangeParam cause:'+ data.cause);
}
export default function bluetoothProfilesTest() {

    describe("bluetoothProfilesTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
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
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            a2dpProfile = a2dp.createA2dpSrcProfile();
            hilog.info(domain, tag, "a2dpProfile success" + JSON.stringify(a2dpProfile));
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /**
         * @tc.name   createA2dpSrcProfileTest
         * @tc.number createA2dpSrcProfileTest
         * @tc.desc   Test createA2dpSrcProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createA2dpSrcProfileTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
                expect(true).assertEqual(a2dpProfile != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createA2dpSrcProfile get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number  getConnectedDevicesTest
         * @tc.name    getConnectedDevicesTest
         * @tc.desc    Test getConnectedDevicesTest API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectedDevicesTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let devices: Array<string> = a2dpProfile!.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.number  getConnectionStateTest
         * @tc.name    getConnectionStateTest
         * @tc.desc    Test getConnectionStateTest API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectionStateTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state : baseProfile.ProfileConnectionState = a2dpProfile!.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state === 0 || state === 1 || state === 2);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.name   createHfpAgProfileTest
         * @tc.number createHfpAgProfileTest
         * @tc.desc   Test createHfpAgProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createHfpAgProfileTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
                expect(true).assertEqual(hfpProfile != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHfpAgProfile get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.number  getConnectedDevicesTest_001
         * @tc.name    getConnectedDevicesTest_001
         * @tc.desc    Test getConnectedDevicesTest_001 API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectedDevicesTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                let devices : Array<string> = hfpProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.number  getConnectionStateTest_001
         * @tc.name    getConnectionStateTest_001
         * @tc.desc    Test getConnectionStateTest_001 API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectionStateTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
            expect(true).assertEqual(hfpProfile != null);
            try {
                let state : baseProfile.ProfileConnectionState = hfpProfile.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state === 0 || state === 1 || state === 2);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStateTest_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.name   createHidHostProfileTest
         * @tc.number createHidHostProfileTest
         * @tc.desc   Test createHidHostProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createHidHostProfileTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
                expect(true).assertEqual(hidProfile != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHidHostProfile get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
        /**
         * @tc.name   connectionStateChangeTest
         * @tc.number connectionStateChangeTest
         * @tc.desc   Test connectionStateChangeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("connectionStateChangeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: baseProfile.StateChangeParam) => void = (changeInfo: baseProfile.StateChangeParam) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo connectionStateChange:" + changeInfo);
                hilog.info(domain, tag, "onReceiveEvent changeInfo connectionStateChange deviceId:" + changeInfo.deviceId);
                hilog.info(domain, tag, "onReceiveEvent changeInfo connectionStateChange state:" + changeInfo.state);
            }

            try{
                a2dp.createA2dpSrcProfile().onConnectionStateChange(onReceiveEvent);
                hfp.createHfpAgProfile().onConnectionStateChange(onReceiveEvent);
                hid.createHidHostProfile().onConnectionStateChange(onReceiveEvent);
            }catch(err){
                err = err as BusinessError;
                hilog.info(domain, tag, "connectionStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                a2dp.createA2dpSrcProfile().offConnectionStateChange(onReceiveEvent);
                hfp.createHfpAgProfile().offConnectionStateChange(onReceiveEvent);
                hid.createHidHostProfile().offConnectionStateChange(onReceiveEvent);
            }catch(err){
                err = err as BusinessError;
                hilog.info(domain, tag, "connectionStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })

        /**
         * @tc.name   connectionStateChangeTest2
         * @tc.number connectionStateChangeTest2
         * @tc.desc   Test connectionStateChangeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("connectionStateChangeTest2", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let onReceiveEvent:(changeInfo: baseProfile.StateChangeParam) => void = (changeInfo: baseProfile.StateChangeParam) => {
                hilog.info(domain, tag, "onReceiveEvent changeInfo connectionStateChange:" + changeInfo);
            }

            try{
                a2dp.createA2dpSrcProfile().onConnectionStateChange(onReceiveEvent);
                hfp.createHfpAgProfile().onConnectionStateChange(onReceiveEvent);
                hid.createHidHostProfile().onConnectionStateChange(onReceiveEvent);
            }catch(err){
                err = err as BusinessError;
                hilog.info(domain, tag, "connectionStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                a2dp.createA2dpSrcProfile().offConnectionStateChange();
                hfp.createHfpAgProfile().offConnectionStateChange();
                hid.createHidHostProfile().offConnectionStateChange();
            }catch(err){
                err = err as BusinessError;
                hilog.info(domain, tag, "connectionStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            done();
        })
        /**
         * @tc.number  getConnectedDevicesTest_002
         * @tc.name    getConnectedDevicesTest_002
         * @tc.desc    Test getConnectedDevicesTest_002 API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectedDevicesTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                let devices : Array<string> = hidProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect(true).assertEqual(devices != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices_001 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.number  getConnectionStateTest_002
         * @tc.name    getConnectionStateTest_002
         * @tc.desc    Test getConnectionStateTest_002 API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectionStateTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
            expect(true).assertEqual(hidProfile != null);
            try {
                let state : baseProfile.ProfileConnectionState = hidProfile.getConnectionState(deviceId);
                hilog.info(domain, tag, "the connection state:" + state);
                expect(true).assertEqual(state === 0 || state === 1 || state === 2);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionStateTest_002 get errCode:" + err.code + ",errMessage:" + err.message);
                expect(Number(err.code)).assertEqual(2900099);
            }
            done();
        })

        /**
         * @tc.number  testDisconnectCause
         * @tc.name    testDisconnectCause
         * @tc.desc    Test testDisconnectCause API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testDisconnectCause", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let userDisconnect = baseProfile.DisconnectCause.USER_DISCONNECT;
                let connectFromKeyboard = baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD;
                let connectFromMouse = baseProfile.DisconnectCause.CONNECT_FROM_MOUSE;
                let connectFromCar = baseProfile.DisconnectCause.CONNECT_FROM_CAR;
                let tooManyConnectedDevices = baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES;
                let connectFailInternal = baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL;

                expect(userDisconnect).assertEqual(0);
                expect(connectFromKeyboard).assertEqual(1);
                expect(connectFromMouse).assertEqual(2);
                expect(connectFromCar).assertEqual(3);
                expect(tooManyConnectedDevices).assertEqual(4);
                expect(connectFailInternal).assertEqual(5);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "DisconnectCause get errCode:" + err.code + ",errMessage:" + err.message);
                expect(true).assertFalse();
            }
            done();
        })
        /**
         * @tc.number  onConnectionStateChangeTest_001
         * @tc.name    onConnectionStateChangeTest_001
         * @tc.desc    onConnectionStateChange_A2dpSourceProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                a2dpProfile!.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "a2dpProfile on connection state change success");
                a2dpProfile!.offConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "a2dpProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "a2dpProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number  onConnectionStateChangeTest_002
         * @tc.name    onConnectionStateChangeTest_002
         * @tc.desc    onConnectionStateChange_A2dpSourceProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                a2dpProfile!.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "a2dpProfile on connection state change success");
                a2dpProfile!.offConnectionStateChange();
                hilog.info(domain, tag, "a2dpProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "a2dpProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number  onConnectionStateChangeTest_003
         * @tc.name    onConnectionStateChangeTest_003
         * @tc.desc    onConnectionStateChange_HandsFreeAudioGatewayProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
                hfpProfile.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hfpProfile on connection state change success");
                hfpProfile.offConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hfpProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "hfpProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number  onConnectionStateChangeTest_004
         * @tc.name    onConnectionStateChangeTest_004
         * @tc.desc    onConnectionStateChange_HandsFreeAudioGatewayProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
                hfpProfile.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hfpProfile on connection state change success");
                hfpProfile.offConnectionStateChange();
                hilog.info(domain, tag, "hfpProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "hfpProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number  onConnectionStateChangeTest_005
         * @tc.name    onConnectionStateChangeTest_005
         * @tc.desc    onConnectionStateChange_HidHostProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
                hidProfile.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hidProfile on connection state change success");
                hidProfile.offConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hidProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "hidProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

        /**
         * @tc.number  onConnectionStateChangeTest_006
         * @tc.name    onConnectionStateChangeTest_006
         * @tc.desc    onConnectionStateChange_HidHostProfile
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("onConnectionStateChangeTest_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
                hidProfile.onConnectionStateChange(onReceiveEvent);
                hilog.info(domain, tag, "hidProfile on connection state change success");
                hidProfile.offConnectionStateChange();
                hilog.info(domain, tag, "hidProfile off connection state change success");
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "hidProfile on/off connection state change is failed, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                }
            }
            done();
        })

    })
}