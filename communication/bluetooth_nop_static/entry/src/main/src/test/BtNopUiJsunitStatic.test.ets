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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.bluetooth.connection';
import a2dp from '@ohos.bluetooth.a2dp';
import hfp from '@ohos.bluetooth.hfp';
import hid from '@ohos.bluetooth.hid';
import access from '@ohos.bluetooth.access';
import baseProfile from '@ohos.bluetooth.baseProfile';
import ble from '@ohos.bluetooth.ble';
import constant from '@ohos.bluetooth.constant';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtNotPermissionTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice  | undefined;
let gattServerDevice: ble.GattServer | undefined;

export default function btNopUiJsunit() {
    describe('btNopUiJsunit', (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        /**
         * @tc.number  disableBluetoothErrCode201Test
         * @tc.name    disableBluetoothErrCode201Test
         * @tc.desc    Test disableBluetoothErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("disableBluetoothErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.disableBluetooth();
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  enableBluetoothErrCode201Test
         * @tc.name    enableBluetoothErrCode201Test
         * @tc.desc    Test enableBluetoothErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("enableBluetoothErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try{
                access.enableBluetooth();
                expect().assertFail();
            }catch(err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetooth get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceNameErrCode201Test
         * @tc.name    getRemoteDeviceNameErrCode201Test
         * @tc.desc    Test getRemoteDeviceNameErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name: string = connection.getRemoteDeviceName("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceName:" + name);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceNameAliasErrCode201Test
         * @tc.name    getRemoteDeviceNameAliasErrCode201Test
         * @tc.desc    Test getRemoteDeviceNameAliasErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameAliasErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let aliasName: string = connection.getRemoteDeviceName("00:11:22:33:44:55", true);
                hilog.info(domain, tag, "getRemoteDeviceName alias is true:" + aliasName);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceName alias get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  setBluetoothScanModeErrCode201Test
         * @tc.name    setBluetoothScanModeErrCode201Test
         * @tc.desc    Test setBluetoothScanModeErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("setBluetoothScanModeErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE, 0);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  clientCloseErrCode201Test
         * @tc.name    clientCloseErrCode201Test
         * @tc.desc    Test clientCloseErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientCloseErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.close();
                hilog.info(domain, tag, 'gattClientDevice close success');
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  serverCloseErrCode201Test
         * @tc.name    serverCloseErrCode201Test
         * @tc.desc    Test serverCloseErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("serverCloseErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattServerDevice!.close();
                hilog.info(domain, tag, 'gattServerDevice close success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattServerDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  clientConnectErrCode201Test
         * @tc.name    clientConnectErrCode201Test
         * @tc.desc    Test clientConnectErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientConnectErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.connect();
                hilog.info(domain, tag, 'gattClientDevice connect success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  stopBleScanErrCode201Test
         * @tc.name    stopBleScanErrCode201Test
         * @tc.desc    Test stopBleScanErrCode201Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("stopBleScanErrCode201Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
                hilog.info(domain, tag, 'stopBLEScan success');
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPlayingStateNop
         * @tc.name    testGetPlayingStateNop
         * @tc.desc    test testGetPlayingStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPlayingStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let state = a2dpSrc.getPlayingState('3e:45:7f:cc:45:3f');
                hilog.info(domain, tag, "getPlayingState:" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPlayingState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetConnectedDevicesNop
         * @tc.name    testGetConnectedDevicesNop
         * @tc.desc    test testGetConnectedDevicesNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetConnectedDevicesNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let devices = a2dpSrc.getConnectedDevices();
                hilog.info(domain, tag, "getConnectedDevices without permission =" + JSON.stringify(devices));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetConnectionStateNop
         * @tc.name    testGetConnectionStateNop
         * @tc.desc    test testGetConnectionStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetConnectionStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpSrc = a2dp.createA2dpSrcProfile();
                let state = a2dpSrc.getConnectionState('3e:45:7f:cc:45:3f');
                hilog.info(domain, tag, "the connection state:" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testEnableBluetoothAsyncNop
         * @tc.name    testEnableBluetoothAsyncNop
         * @tc.desc    test testEnableBluetoothAsyncNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testEnableBluetoothAsyncNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.enableBluetoothAsync().then(() => {
                    hilog.info(domain, tag, 'enableBluetoothAsync success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableBluetoothAsync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testDisableBluetoothAsyncNop
         * @tc.name    testDisableBluetoothAsyncNop
         * @tc.desc    test testDisableBluetoothAsyncNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDisableBluetoothAsyncNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.disableBluetoothAsync().then(() => {
                    hilog.info(domain, tag, 'disableBluetoothAsync success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableBluetoothAsync get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testAddPersistentDeviceIdNop
         * @tc.name    testAddPersistentDeviceIdNop
         * @tc.desc    test testAddPersistentDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testAddPersistentDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.addPersistentDeviceId('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'addPersistentDeviceId success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addPersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testDeletePersistentDeviceIdNop
         * @tc.name    testDeletePersistentDeviceIdNop
         * @tc.desc    test testDeletePersistentDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDeletePersistentDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.deletePersistentDeviceId('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'deletePersistentDeviceId success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "deletePersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPersistentDeviceIdsNop
         * @tc.name    testGetPersistentDeviceIdsNop
         * @tc.desc    test testGetPersistentDeviceIdsNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPersistentDeviceIdsNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let macs: string[] = access.getPersistentDeviceIds();
                hilog.info(domain, tag, "getPersistentDeviceIds result:" + JSON.stringify(macs));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPersistentDeviceIds get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testIsValidRandomDeviceIdNop
         * @tc.name    testIsValidRandomDeviceIdNop
         * @tc.desc    test testIsValidRandomDeviceIdNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testIsValidRandomDeviceIdNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let isValidRandom = access.isValidRandomDeviceId('11:22:33:44:55:66');
                hilog.info(domain, tag, "isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isValidRandomDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetProfileConnectionStateNop
         * @tc.name    testGetProfileConnectionStateNop
         * @tc.desc    test testGetProfileConnectionStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetProfileConnectionStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state = connection.getProfileConnectionState(constant.ProfileId.PROFILE_A2DP_SOURCE);
                hilog.info(domain, tag, "getProfileConnectionState without permission name =" + JSON.stringify(state));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getProfileConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testPairDeviceCallbackNop
         * @tc.name    testPairDeviceCallbackNop
         * @tc.desc    test testPairDeviceCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testPairDeviceCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.pairDevice('11:22:33:44:55:66', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "pairDevice,device name err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "pairDevice success");
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "pairDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testPairDevicePromiseNop
         * @tc.name    testPairDevicePromiseNop
         * @tc.desc    test testPairDevicePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testPairDevicePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.pairDevice('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'pairDevice success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "pairDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetLocalNameNop
         * @tc.name    testGetLocalNameNop
         * @tc.desc    test testGetLocalNameNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetLocalNameNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let name = connection.getLocalName();
                hilog.info(domain, tag, "getLocalName name = " + JSON.stringify(name));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLocalName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPairedDevicesNop
         * @tc.name    testGetPairedDevicesNop
         * @tc.desc    test testGetPairedDevicesNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPairedDevicesNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let ret = connection.getPairedDevices();
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetPairStateNop
         * @tc.name    testGetPairStateNop
         * @tc.desc    test testGetPairStateNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetPairStateNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let state: connection.BondState = connection.getPairState('11:22:33:44:55:66');
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePairingConfirmationNop
         * @tc.name    testSetDevicePairingConfirmationNop
         * @tc.desc    test testSetDevicePairingConfirmationNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePairingConfirmationNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setDevicePairingConfirmation('11:22:33:44:55:66', true);
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePinCodeCallbackNop
         * @tc.name    testSetDevicePinCodeCallbackNop
         * @tc.desc    test testSetDevicePinCodeCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePinCodeCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setDevicePinCode('11:22:33:44:55:66', '12345', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "setDevicePinCode, err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "setDevicePinCode success");
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePinCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetDevicePinCodePromiseNop
         * @tc.name    testSetDevicePinCodePromiseNop
         * @tc.desc    test testSetDevicePinCodePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetDevicePinCodePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                    hilog.info(domain, tag, 'setDevicePinCode success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePinCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetBluetoothScanModeNop
         * @tc.name    testGetBluetoothScanModeNop
         * @tc.desc    test testGetBluetoothScanModeNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetBluetoothScanModeNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "getBluetoothScanMode without permission scanMode = " + JSON.stringify(scanMode));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartBluetoothDiscoveryNop
         * @tc.name    testStartBluetoothDiscoveryNop
         * @tc.desc    test testStartBluetoothDiscoveryNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartBluetoothDiscoveryNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.startBluetoothDiscovery();
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStopBluetoothDiscoveryNop
         * @tc.name    testStopBluetoothDiscoveryNop
         * @tc.desc    test testStopBluetoothDiscoveryNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStopBluetoothDiscoveryNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.stopBluetoothDiscovery();
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testIsBluetoothDiscoveringNop
         * @tc.name    testIsBluetoothDiscoveringNop
         * @tc.desc    test testIsBluetoothDiscoveringNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testIsBluetoothDiscoveringNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let isBluetoothDiscovering =  connection.isBluetoothDiscovering();
                hilog.info(domain, tag, "isBluetoothDiscovering without permission ret = " + JSON.stringify(isBluetoothDiscovering));
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteProfileUuidsCallbackNop
         * @tc.name    testGetRemoteProfileUuidsCallbackNop
         * @tc.desc    test testGetRemoteProfileUuidsCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteProfileUuidsCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.getRemoteProfileUuids('11:22:33:44:55:66', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback, error:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback success");
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteProfileUuidsPromiseNop
         * @tc.name    testGetRemoteProfileUuidsPromiseNop
         * @tc.desc    test testGetRemoteProfileUuidsPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteProfileUuidsPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteProfileUuids('11:22:33:44:55:66').then(()=> {
                    hilog.info(domain, tag, "getRemoteProfileUuids_promise success");
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testConnectAllowedProfilesCallbackNop
         * @tc.name    testConnectAllowedProfilesCallbackNop
         * @tc.desc    test testConnectAllowedProfilesCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testConnectAllowedProfilesCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.connectAllowedProfiles('00:11:22:33:44:55', (error) => {
                    if (error) {
                        hilog.info(domain, tag, "connectAllowedProfiles_callback, err:" + JSON.stringify(error));
                    } else {
                        hilog.info(domain, tag, "connectAllowedProfiles_callback success");
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectAllowedProfiles get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testConnectAllowedProfilesPromiseNop
         * @tc.name    testConnectAllowedProfilesPromiseNop
         * @tc.desc    test testConnectAllowedProfilesPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testConnectAllowedProfilesPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'connectAllowedProfiles success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectAllowedProfiles get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGetRemoteDeviceBatteryInfoNop
         * @tc.name    testGetRemoteDeviceBatteryInfoNop
         * @tc.desc    test testGetRemoteDeviceBatteryInfoNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGetRemoteDeviceBatteryInfoNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'getRemoteDeviceBatteryInfo success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceBatteryInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testSetRemoteDeviceNameNop
         * @tc.name    testSetRemoteDeviceNameNop
         * @tc.desc    test testSetRemoteDeviceNameNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testSetRemoteDeviceNameNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setRemoteDeviceName('11:22:33:44:55:66', "RemoteDeviceName").then(() => {
                    hilog.info(domain, tag, "setRemoteDeviceName success");
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartBleScanNop
         * @tc.name    testStartBleScanNop
         * @tc.desc    test testStartBleScanNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartBleScanNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.startBLEScan([{}]);
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartAdvertisingNop
         * @tc.name    testStartAdvertisingNop
         * @tc.desc    test testStartAdvertisingNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartAdvertisingNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let manufactureValueBuffer = new Uint8Array(4);
            manufactureValueBuffer[0] = 1;
            manufactureValueBuffer[1] = 2;
            manufactureValueBuffer[2] = 3;
            manufactureValueBuffer[3] = 4;

            let serviceValueBuffer = new Uint8Array(4);
            serviceValueBuffer[0] = 4;
            serviceValueBuffer[1] = 6;
            serviceValueBuffer[2] = 7;
            serviceValueBuffer[3] = 8;
            hilog.info(domain, tag, 'manufactureValueBuffer = ' + JSON.stringify(manufactureValueBuffer));
            hilog.info(domain, tag, 'serviceValueBuffer = ' + JSON.stringify(serviceValueBuffer));
            try {
                let setting: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let manufactureDataUnit: ble.ManufactureData = {
                    manufactureId: 4567,
                    manufactureValue: manufactureValueBuffer.buffer
                };
                let serviceDataUnit: ble.ServiceData = {
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue: serviceValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                let advResponse: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                ble.startAdvertising(setting, advData, advResponse);
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startAdvertising get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGattClientGetDeviceNameCallbackNop
         * @tc.name    testGattClientGetDeviceNameCallbackNop
         * @tc.desc    test testGattClientGetDeviceNameCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattClientGetDeviceNameCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let getDeviceNameCallback = () => {
                return new Promise<string>((resolve,reject) => {
                    gattClientDevice!.getDeviceName((err: BusinessError|null, data: string|undefined)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'getDeviceName callback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'getDeviceName callback value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err) {
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await getDeviceNameCallback().then((data) => {
                    hilog.info(domain, tag, "getDeviceName callback successful");
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceName callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGattClientGetDeviceNamePromiseNop
         * @tc.name    testGattClientGetDeviceNamePromiseNop
         * @tc.desc    test testGattClientGetDeviceNamePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattClientGetDeviceNamePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await gattClientDevice!.getDeviceName();
                hilog.info(domain, tag, "promise gattClient getDeviceName");
                expect(true).assertFalse();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getDeviceName promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStopScanNop
         * @tc.name    testStopScanNop
         * @tc.desc    test testStopScanNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStopScanNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let bleScanner: ble.BleScanner = ble.createBleScanner();
                hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(bleScanner));
                expect(true).assertEqual(bleScanner != null);
                await bleScanner.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
                expect(true).assertFalse();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartScanNop
         * @tc.name    testStartScanNop
         * @tc.desc    test testStartScanNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testStartScanNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let bleScanner: ble.BleScanner = ble.createBleScanner();
                hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(bleScanner));
                expect(true).assertEqual(bleScanner != null);
                await bleScanner.startScan([{}]).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                expect(true).assertFalse();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGattClientReadCharacteristicValueCallbackNop
         * @tc.name    testGattClientReadCharacteristicValueCallbackNop
         * @tc.desc    test testGattClientReadCharacteristicValueCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattClientReadCharacteristicValueCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let descriptors: Array<ble.BLEDescriptor> = [];
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let gattPermissions: ble.GattPermissions = {
                read: false,
                readEncrypted: false,
                readEncryptedMitm: false,
                write: false,
                writeEncrypted: false,
                writeEncryptedMitm: false,
                writeSigned: false,
                writeSignedMitm: false
            }
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc,
                descriptorHandle: 0, permissions: gattPermissions
            };
            descriptors.push(descriptor);

            let bufferCCC = new ArrayBuffer(8);
            let cccV = new Uint8Array(bufferCCC);
            cccV[0] = 1;
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: bufferCCC, descriptors: descriptors
            };
            let readCharacteristicValueCallback = () => {
                return new Promise<ble.BLECharacteristic>((resolve,reject) => {
                    gattClientDevice!.readCharacteristicValue(characteristic, (err: BusinessError|null, data: ble.BLECharacteristic|undefined)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'readCharacteristicValue callback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'readCharacteristicValue callback value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err) {
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await readCharacteristicValueCallback().then((data) => {
                    hilog.info(domain, tag, "readCharacteristicValue callback successful");
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "readCharacteristicValue callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGattClientReadCharacteristicValuePromiseNop
         * @tc.name    testGattClientReadCharacteristicValuePromiseNop
         * @tc.desc    test testGattClientReadCharacteristicValuePromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattClientReadCharacteristicValuePromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let descriptors: Array<ble.BLEDescriptor> = [];
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc
            };
            descriptors.push(descriptor);

            let bufferCCC = new ArrayBuffer(8);
            let cccV = new Uint8Array(bufferCCC);
            cccV[0] = 1;
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: bufferCCC, descriptors: descriptors
            };
            try {
                await gattClientDevice!.readCharacteristicValue(characteristic);
                hilog.info(domain, tag, "promise gattClient readCharacteristicValue");
                expect(true).assertFalse();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "readCharacteristicValue promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testGattServerNotifyCharacteristicChangedPromiseNop
         * @tc.name    testGattServerNotifyCharacteristicChangedPromiseNop
         * @tc.desc    test testGattServerNotifyCharacteristicChangedPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattServerNotifyCharacteristicChangedPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1123;
            let notifyCharacter: ble.NotifyCharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC,
                confirm: true,
            };
            try {
                await gattServerDevice!.notifyCharacteristicChanged('3e:45:7f:cc:45:3f', notifyCharacter).then(() => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged successful");
                }).catch((err: Error) => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged failed: " + JSON.stringify(err));
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "notifyCharacteristicChanged promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  testStartAdvertisingPromiseNop
         * @tc.name    testStartAdvertisingPromiseNop
         * @tc.desc    testStartAdvertisingPromiseNop
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testStartAdvertisingPromiseNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let manufactureValueBuffer = new Uint8Array(4);
            manufactureValueBuffer[0] = 1;
            manufactureValueBuffer[1] = 2;
            manufactureValueBuffer[2] = 3;
            manufactureValueBuffer[3] = 4;
            let serviceValueBuffer = new Uint8Array(4);
            serviceValueBuffer[0] = 4;
            serviceValueBuffer[1] = 6;
            serviceValueBuffer[2] = 7;
            serviceValueBuffer[3] = 8;
            let setting: ble.AdvertiseSetting = {
                interval: 32,
                txPower: 1,
                connectable: true
            };
            let manufactureDataUnit: ble.ManufactureData = {
                manufactureId: 4567,
                manufactureValue: manufactureValueBuffer.buffer
            };
            let serviceDataUnit: ble.ServiceData = {
                serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue: serviceValueBuffer.buffer
            };
            let advData: ble.AdvertiseData = {
                serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData: [manufactureDataUnit],
                serviceData: [serviceDataUnit],
                includeDeviceName: false,
                includeTxPower: false
            };
            let advResponse: ble.AdvertiseData = {
                serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData: [manufactureDataUnit],
                serviceData: [serviceDataUnit]
            };
            let advertisingParams: ble.AdvertisingParams = {
                advertisingSettings: setting,
                advertisingData: advData,
                advertisingResponse: advResponse,
                duration: 0,
            }
            try {
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    hilog.info(domain, tag, "startAdvertising return outAdvHandle: " + outAdvHandle);
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "startAdvertisingTest_promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })

        /**
         * @tc.number  testEnableAdvertisingPromiseNop
         * @tc.name    testEnableAdvertisingPromiseNop
         * @tc.desc    test testEnableAdvertisingPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testEnableAdvertisingPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let advertisingEnableParams: ble.AdvertisingEnableParams = {
                    advertisingId: 0XFF
                };
                await ble.enableAdvertising(advertisingEnableParams).then(() => {
                    hilog.info(domain, tag, 'enableAdvertising promise enable success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableAdvertising promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

        /**
         * @tc.number  testDisableAdvertisingPromiseNop
         * @tc.name    testDisableAdvertisingPromiseNop
         * @tc.desc    test testDisableAdvertisingPromiseNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDisableAdvertisingPromiseNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingDisableParams: ble.AdvertisingDisableParams = {
                advertisingId: 0XFF
            };
            try {
                await ble.disableAdvertising(advertisingDisableParams).then(() => {
                    hilog.info(domain, tag, 'disableAdvertising promise success');
                });
                expect(true).assertFalse();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableAdvertising promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })
        /**
         * @tc.number  testGattServerNotifyCharacteristicChangedAsyncCallbackNop
         * @tc.name    testGattServerNotifyCharacteristicChangedAsyncCallbackNop
         * @tc.desc    test testGattServerNotifyCharacteristicChangedAsyncCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testGattServerNotifyCharacteristicChangedAsyncCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1123;
            let notifyCharacter: ble.NotifyCharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: arrayBufferCCC,
                confirm: true,
            };
            let gattServer: ble.GattServer = ble.createGattServer();
            expect(true).assertEqual(gattServer != undefined);
            let notifyCharacteristicChangedCallback = () => {
                return new Promise<void>((resolve,reject) => {
                    gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacter, (err: BusinessError|null, data)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'notifyCharacteristicChanged callback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'notifyCharacteristicChanged callback value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err){
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await notifyCharacteristicChangedCallback().then(() => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged callback successful");
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "notifyCharacteristicChanged callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })
        /**
         * @tc.number  testStartAdvertisingAsyncCallbackNop
         * @tc.name    testStartAdvertisingAsyncCallbackNop
         * @tc.desc    testStartAdvertisingAsyncCallbackNop
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testStartAdvertisingAsyncCallbackNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let manufactureValueBuffer = new Uint8Array(4);
            manufactureValueBuffer[0] = 1;
            manufactureValueBuffer[1] = 2;
            manufactureValueBuffer[2] = 3;
            manufactureValueBuffer[3] = 4;
            let serviceValueBuffer = new Uint8Array(4);
            serviceValueBuffer[0] = 4;
            serviceValueBuffer[1] = 6;
            serviceValueBuffer[2] = 7;
            serviceValueBuffer[3] = 8;
            let setting: ble.AdvertiseSetting = {
                interval: 32,
                txPower: 1,
                connectable: true
            };
            let manufactureDataUnit: ble.ManufactureData = {
                manufactureId: 4567,
                manufactureValue: manufactureValueBuffer.buffer
            };
            let serviceDataUnit: ble.ServiceData = {
                serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue: serviceValueBuffer.buffer
            };
            let advData: ble.AdvertiseData = {
                serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData: [manufactureDataUnit],
                serviceData: [serviceDataUnit],
                includeDeviceName: false,
                includeTxPower: false
            };
            let advResponse: ble.AdvertiseData = {
                serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData: [manufactureDataUnit],
                serviceData: [serviceDataUnit]
            };
            let advertisingParams: ble.AdvertisingParams = {
                advertisingSettings: setting,
                advertisingData: advData,
                advertisingResponse: advResponse,
                duration: 0,
            }
            let startAdvertisingCallback = () => {
                return new Promise<int>((resolve,reject) => {
                    ble.startAdvertising(advertisingParams, (err: BusinessError|null, data: int|undefined)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'startAdvertising failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'startAdvertising value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err){
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await startAdvertisingCallback().then((outAdvHandle) => {
                    hilog.info(domain, tag, "startAdvertising return outAdvHandle: " + outAdvHandle);
                });
            } catch (err){
                err = err as BusinessError;
                hilog.error(domain, tag, "startAdvertisingTest_callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
            done();
        })
        /**
         * @tc.number  testEnableAdvertisingAsyncCallbackNop
         * @tc.name    testEnableAdvertisingAsyncCallbackNop
         * @tc.desc    test testEnableAdvertisingAsyncCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testEnableAdvertisingAsyncCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingEnableParams: ble.AdvertisingEnableParams = {
                advertisingId: 0XFF,
                duration: 0,
            };
            let enableAdvertisingCallback = () => {
                return new Promise<void>((resolve,reject) => {
                    ble.enableAdvertising(advertisingEnableParams, (err: BusinessError|null, data)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'enableAdvertising callback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'enableAdvertising callback value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err){
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await enableAdvertisingCallback().then((data) => {
                    hilog.info(domain, tag, "enableAdvertising callback successful");
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "enableAdvertising callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })
        /**
         * @tc.number  testDisableAdvertisingAsyncCallbackNop
         * @tc.name    testDisableAdvertisingAsyncCallbackNop
         * @tc.desc    test testDisableAdvertisingAsyncCallbackNop without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("testDisableAdvertisingAsyncCallbackNop", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingDisableParams: ble.AdvertisingDisableParams = {
                advertisingId: 0XFF
            };
            let disableAdvertisingCallback = () => {
                return new Promise<void>((resolve,reject) => {
                    ble.disableAdvertising(advertisingDisableParams, (err: BusinessError|null, data)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'disableAdvertising callback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'disableAdvertising callback value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err){
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                await disableAdvertisingCallback().then(() => {
                    hilog.info(domain, tag, "disableAdvertising callback successful");
                });
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableAdvertising callback get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 201) {
                    expect(true).assertEqual(err.code === 201);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_StopAdvertisingNoParam_0500
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_StopAdvertisingNoParam_0500
         * @tc.desc    Test ble.stopAdvertising() without permission (需前置startAdvertising, 预期返回2902055)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_StopAdvertisingNoParam_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopAdvertising();
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "stopAdvertising no param errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2902055);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattServerAddService_0600
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattServerAddService_0600
         * @tc.desc    Test GattServer.addService without permission (201)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattServerAddService_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let descriptors: Array<ble.BLEDescriptor> = [];
            let arrayBuffer = new ArrayBuffer(8);
            let descV = new Uint8Array(arrayBuffer);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer
            };
            descriptors.push(descriptor);

            let characteristics: Array<ble.BLECharacteristic> = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors: descriptors
            };
            characteristics.push(characteristic);

            let gattService: ble.GattService = { serviceUuid: '00001810-0000-1000-8000-00805F9B34FB', isPrimary: true, characteristics: characteristics, includeServices: [] };
            try {
                gattServerDevice!.addService(gattService);
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "addService errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 201);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattServerRemoveService_0700
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattServerRemoveService_0700
         * @tc.desc    Test GattServer.removeService without permission (依赖添加服务,预期报错401)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattServerRemoveService_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattServerDevice!.removeService('00001810-0000-1000-8000-00805F9B34FB');
                hilog.info(domain, tag, "removeService success");
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "removeService errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 401);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattServerSendResponse_0800
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattServerSendResponse_0800
         * @tc.desc    Test GattServer.sendResponse without permission (需对端设备连接,预期报错2900099)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattServerSendResponse_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1123;
            let serverResponse: ble.ServerResponse = {
                deviceId: '3e:45:7f:cc:45:3f',
                transId: 0,
                status: 0,
                offset: 0,
                value: arrayBufferCCC,
            };
            try {
                gattServerDevice!.sendResponse(serverResponse);
                hilog.info(domain, tag, "sendResponse success");
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "sendResponse errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900099);
                }
            }
        
            done();
        })

        


        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattClientDisconnect_1300
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattClientDisconnect_1300
         * @tc.desc    Test GattClientDevice.disconnect without permission (依赖连接对端设备预期报错099)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattClientDisconnect_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.disconnect();
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "gattClient disconnect errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900099);
                }
            }
        
            done();
        })

        

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattClientReadDescriptorValuePromise_1500
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattClientReadDescriptorValuePromise_1500
         * @tc.desc    Test GattClientDevice.readDescriptorValue promise without permission (依赖对端设备,预期401)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattClientReadDescriptorValuePromise_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
                descriptorValue: bufferDesc
            };
            try {
                await gattClientDevice!.readDescriptorValue(descriptor);
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "readDescriptorValue promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 401);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattClientSetBLEMtuSize_1600
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattClientSetBLEMtuSize_1600
         * @tc.desc    Test GattClientDevice.setBLEMtuSize without permission (依赖连接对端设备预期报错099)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattClientSetBLEMtuSize_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.setBLEMtuSize(500);
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "setBLEMtuSize errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900099);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationCallback_1700
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationCallback_1700
         * @tc.desc    Test GattClientDevice.setCharacteristicChangeIndication callback without permission (依赖对端设备)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationCallback_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let descriptors: Array<ble.BLEDescriptor> = [];
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let gattPermissions: ble.GattPermissions = {
                read: false,
                readEncrypted: false,
                readEncryptedMitm: false,
                write: false,
                writeEncrypted: false,
                writeEncryptedMitm: false,
                writeSigned: false,
                writeSignedMitm: false
            };
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
                descriptorValue: bufferDesc,
                descriptorHandle: 0,
                permissions: gattPermissions
            };
            descriptors.push(descriptor);
            let bufferCCC = new ArrayBuffer(8);
            let cccV = new Uint8Array(bufferCCC);
            cccV[0] = 1;
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: bufferCCC,
                descriptors: descriptors
            };
            try {
                gattClientDevice!.setCharacteristicChangeIndication(characteristic, false,
                    (err: BusinessError | null, data) => {
                        if (err != null) {
                            hilog.info(domain, tag, "setCharacteristicChangeIndication callback errCode:" + err!.code + ",errMessage:" + err!.message);
                            if (err!.code === 801) {
                                hilog.info(domain, tag, 'api is not support');
                                expect(true).assertEqual(err!.code === 801);
                            } else {
                                expect(true).assertEqual(err!.code === 401);
                            }
                        } else {
                            hilog.info(domain, tag, 'setCharacteristicChangeIndication callback value:' + JSON.stringify(data));
                            expect().assertFail();
                        }
                    });
            } catch (err) {
                hilog.info(domain, tag, "setCharacteristicChangeIndication callback errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 401);
                }
            }
        
            done();
        })

        /**
         * @tc.number  SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationPromise_1800
         * @tc.name    SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationPromise_1800
         * @tc.desc    Test GattClientDevice.setCharacteristicChangeIndication promise without permission (依赖对端设备)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("SUB_Communication_Bluetooth_NopStatic_GattClientSetCharacteristicChangeIndicationPromise_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let descriptors: Array<ble.BLEDescriptor> = [];
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB',
                descriptorValue: bufferDesc
            };
            descriptors.push(descriptor);
            let bufferCCC = new ArrayBuffer(8);
            let cccV = new Uint8Array(bufferCCC);
            cccV[0] = 1;
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                characteristicValue: bufferCCC,
                descriptors: descriptors
            };
            try {
                await gattClientDevice!.setCharacteristicChangeIndication(characteristic, false);
                expect(true).assertFalse();
            } catch (err) {
                hilog.info(domain, tag, "setCharacteristicChangeIndication promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 401);
                }
            }
        
            done();
        })
    })
}