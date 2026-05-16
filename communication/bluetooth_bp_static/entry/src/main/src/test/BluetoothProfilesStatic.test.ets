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
let g_context: common.UIAbilityContext;

export default function bluetoothProfilesTest() {

    describe("bluetoothProfilesTest", (): void => {
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
         * @tc.name   createA2dpSrcProfileTest
         * @tc.number createA2dpSrcProfileTest
         * @tc.desc   Test createA2dpSrcProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createA2dpSrcProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile: a2dp.A2dpSourceProfile = a2dp.createA2dpSrcProfile();
                expect(true).assertEqual(a2dpProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createA2dpSrcProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   createHfpAgProfileTest
         * @tc.number createHfpAgProfileTest
         * @tc.desc   Test createHfpAgProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createHfpAgProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hfpProfile: hfp.HandsFreeAudioGatewayProfile = hfp.createHfpAgProfile();
                expect(true).assertEqual(hfpProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHfpAgProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   createHidHostProfileTest
         * @tc.number createHidHostProfileTest
         * @tc.desc   Test createHidHostProfileTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("createHidHostProfileTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let hidProfile: hid.HidHostProfile = hid.createHidHostProfile();
                expect(true).assertEqual(hidProfile != null);
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createHidHostProfile get errCode:" + err.code + ",errMessage:" + err.message);
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
            }catch(err: BusinessError){
                hilog.info(domain, tag, "connectionStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                a2dp.createA2dpSrcProfile().offConnectionStateChange(onReceiveEvent);
                hfp.createHfpAgProfile().offConnectionStateChange(onReceiveEvent);
                hid.createHidHostProfile().offConnectionStateChange(onReceiveEvent);
            }catch(err: BusinessError){
                hilog.info(domain, tag, "connectionStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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
            }catch(err: BusinessError){
                hilog.info(domain, tag, "connectionStateChange on get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            await Utils.msSleep(1000);
            try{
                a2dp.createA2dpSrcProfile().offConnectionStateChange();
                hfp.createHfpAgProfile().offConnectionStateChange();
                hid.createHidHostProfile().offConnectionStateChange();
            }catch(err: BusinessError){
                hilog.info(domain, tag, "connectionStateChange off get errCode:" + err.code + ",errMessage:" + err.message);
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