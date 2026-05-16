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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, Hypium } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.bluetooth.connection';
import ble from '@ohos.bluetooth.ble';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtErrCode2900003Tag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice;
let gattServerDevice: ble.GattServer;
let g_context: common.UIAbilityContext;

export default function btManagerError003Test() {

    describe("btManagerError003Test", (): void => {
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
                        hilog.info(domain, tag, 'requestPermission StdProcess.tid():' + StdProcess.tid());
                    });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            await Utils.closeBluetooth();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(() => {
            hilog.info(domain, tag, '%{public}s', 'afterAll start');
            await Utils.openBluetooth();
            hilog.info(domain, tag, '%{public}s', 'afterAll end');
        })

        /**
         * @tc.name   getRemoteDeviceNameErrCode2900003Test
         * @tc.number getRemoteDeviceNameErrCode2900003Test
         * @tc.desc   Test getRemoteDeviceNameErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getRemoteDeviceNameErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceName:" + name);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   getRemoteDeviceNameAliasErrCode2900003Test
         * @tc.number getRemoteDeviceNameAliasErrCode2900003Test
         * @tc.desc   Test getRemoteDeviceNameAliasErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getRemoteDeviceNameAliasErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
                hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   getRemoteDeviceClassErrCode2900003Test
         * @tc.number getRemoteDeviceClassErrCode2900003Test
         * @tc.desc   Test getRemoteDeviceClassErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getRemoteDeviceClassErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + deviceClass.majorClass);
                hilog.info(domain, tag, "getRemoteDeviceClass result majorMinorClass:" + deviceClass.majorMinorClass);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   setBluetoothScanModeErrCode2900003Test
         * @tc.number setBluetoothScanModeErrCode2900003Test
         * @tc.desc   Test setBluetoothScanModeErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("setBluetoothScanModeErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   getPairedDevicesErrCode2900003Test
         * @tc.number getPairedDevicesErrCode2900003Test
         * @tc.desc   Test getPairedDevicesErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getPairedDevicesErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let devices: Array<string> = connection.getPairedDevices();
                hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   clientCloseErrCode2900003Test
         * @tc.number clientCloseErrCode2900003Test
         * @tc.desc   Test clientCloseErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientCloseErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice.close();
                hilog.info(domain, tag, 'gattClientDevice close success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   serverCloseErrCode2900003Test
         * @tc.number serverCloseErrCode2900003Test
         * @tc.desc   Test serverCloseErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("serverCloseErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattServerDevice.close();
                hilog.info(domain, tag, 'gattServerDevice close success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattServerDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   clientConnectErrCode2900003Test
         * @tc.number clientConnectErrCode2900003Test
         * @tc.desc   Test clientConnectErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientConnectErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice.connect();
                hilog.info(domain, tag, 'gattClientDevice connect success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   clientDisconnectErrCode2900003Test
         * @tc.number clientDisconnectErrCode2900003Test
         * @tc.desc   Test clientDisconnectErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientDisconnectErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice.disconnect();
                hilog.info(domain, tag, 'gattClientDevice disconnect success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice disconnect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   stopAdvertisingErrCode2900003Test
         * @tc.number stopAdvertisingErrCode2900003Test
         * @tc.desc   Test stopAdvertisingErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("stopAdvertisingErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopAdvertising();
                hilog.info(domain, tag, 'stopAdvertising success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopAdvertising get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })

        /**
         * @tc.name   stopBleScanErrCode2900003Test
         * @tc.number stopBleScanErrCode2900003Test
         * @tc.desc   Test stopBleScanErrCode2900003Test API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("stopBleScanErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
                hilog.info(domain, tag, 'stopBLEScan success');
                expect().assertFail();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code == 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code == 801);
                } else {
                    expect(true).assertEqual(err.code == 2900003);
                }
            }
            done();
        })
    })
}