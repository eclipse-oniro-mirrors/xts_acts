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
import ble from '@ohos.bluetooth.ble';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtBleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice | undefined;
let gattServerDevice: ble.GattServer;
let g_context: common.UIAbilityContext;

export default function bluetoothBleTest() {

    describe("bluetoothBleTest", (): void => {
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
            } catch (err) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach start');
            try {
                await Utils.openBluetooth();
                hilog.info(domain, tag, '%{public}s', 'beforeEach end');
            } catch (err) {
                hilog.error(domain, tag, '%{public}s', 'beforeEach get failed, err: ' + err);
            }
        })

        /**
         * @tc.name   clientCloseTest
         * @tc.number clientCloseTest
         * @tc.desc   Test clientCloseTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientCloseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let clientDevice: ble.GattClientDevice | undefined;
            try {
                clientDevice = ble.createGattClientDevice("00:00:00:00:00:00");
                hilog.info(domain, tag, 'createGattClientDevice result:' + clientDevice);
                expect(true).assertEqual(clientDevice != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createGattClientDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                clientDevice?.close();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "clientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   serverCloseTest
         * @tc.number serverCloseTest
         * @tc.desc   Test serverCloseTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("serverCloseTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let serverDevice:ble.GattServer | undefined;
            try {
                serverDevice = ble.createGattServer();
                hilog.info(domain, tag, 'createGattServer result:' + serverDevice);
                expect(true).assertEqual(serverDevice != null);
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createGattServer get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            try {
                serverDevice?.close();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "serverDevice close get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   setBLEMtuSizeTest
         * @tc.number setBLEMtuSizeTest
         * @tc.desc   Test setBLEMtuSizeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("setBLEMtuSizeTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice?.setBLEMtuSize(500);
                hilog.info(domain, tag, 'setBLEMtuSize success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBLEMtuSize get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900099);
                }
            }
            done();
        })

        /**
         * @tc.name   clientConnectDisconnectTest
         * @tc.number clientConnectDisconnectTest
         * @tc.desc   Test clientConnectDisconnectTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientConnectDisconnectTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice?.connect();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                gattClientDevice?.disconnect();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice disconnect get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   bleConstantTest
         * @tc.number bleConstantTest
         * @tc.desc   Test bleConstantTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("bleConstantTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let MATCH_MODE_STICKY: ble.MatchMode = ble.MatchMode.MATCH_MODE_STICKY;
                hilog.info(domain, tag, "MATCH_MODE_STICKY:" + MATCH_MODE_STICKY);
                expect(true).assertEqual(MATCH_MODE_STICKY == 2);
                let MATCH_MODE_AGGRESSIVE: ble.MatchMode = ble.MatchMode.MATCH_MODE_AGGRESSIVE;
                hilog.info(domain, tag, "MATCH_MODE_AGGRESSIVE:" + MATCH_MODE_AGGRESSIVE);
                expect(true).assertEqual(MATCH_MODE_AGGRESSIVE == 1);
                let SCAN_MODE_LOW_POWER: ble.ScanDuty = ble.ScanDuty.SCAN_MODE_LOW_POWER;
                hilog.info(domain, tag, "SCAN_MODE_LOW_POWER:" + SCAN_MODE_LOW_POWER);
                expect(true).assertEqual(SCAN_MODE_LOW_POWER == 0);
                let WRITE: ble.GattWriteType = ble.GattWriteType.WRITE;
                hilog.info(domain, tag, "WRITE:" + WRITE);
                expect(true).assertEqual(WRITE == 1);
                let WRITE_NO_RESPONSE: ble.GattWriteType = ble.GattWriteType.WRITE_NO_RESPONSE;
                hilog.info(domain, tag, "WRITE_NO_RESPONSE:" + WRITE_NO_RESPONSE);
                expect(true).assertEqual(WRITE_NO_RESPONSE == 2);
                let STARTED: ble.AdvertisingState = ble.AdvertisingState.STARTED;
                hilog.info(domain, tag, "STARTED:" + STARTED);
                expect(true).assertEqual(STARTED == 1);
                let ENABLED: ble.AdvertisingState = ble.AdvertisingState.ENABLED;
                hilog.info(domain, tag, "ENABLED:" + ENABLED);
                expect(true).assertEqual(ENABLED == 2);
                let DISABLED: ble.AdvertisingState = ble.AdvertisingState.DISABLED;
                hilog.info(domain, tag, "DISABLED:" + DISABLED);
                expect(true).assertEqual(DISABLED == 3);
                let STOPPED: ble.AdvertisingState = ble.AdvertisingState.STOPPED;
                hilog.info(domain, tag, "STOPPED:" + STOPPED);
                expect(true).assertEqual(STOPPED == 4);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "bleConstantTest get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.name   bleStopBLEScanTest
         * @tc.number bleStopBLEScanTest
         * @tc.desc   Test bleStopBLEScanTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("bleStopBLEScanTest", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
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