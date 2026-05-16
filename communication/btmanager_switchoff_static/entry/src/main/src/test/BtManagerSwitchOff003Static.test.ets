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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, Hypium } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.bluetooth.connection';
import ble from '@ohos.bluetooth.ble';
import a2dp from '@ohos.bluetooth.a2dp';
import access from '@ohos.bluetooth.access';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtErrCode2900003Tag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice | undefined;
let gattServerDevice: ble.GattServer | undefined;
let g_context: common.UIAbilityContext;

export default function btManagerError003Test() {

    describe("btManagerError003Test", (): void => {
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
                        hilog.info(domain, tag, 'requestPermission StdProcess.tid():' + StdProcess.tid());
                    });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            await Utils.closeBluetooth();
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(async (): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'afterAll start');
            await Utils.openBluetooth();
            hilog.info(domain, tag, '%{public}s', 'afterAll end');
        })

        /**
         * @tc.number  getRemoteDeviceNameErrCode2900003Test
         * @tc.name    getRemoteDeviceNameErrCode2900003Test
         * @tc.desc    Test getRemoteDeviceNameErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceNameAliasErrCode2900003Test
         * @tc.name    getRemoteDeviceNameAliasErrCode2900003Test
         * @tc.desc    Test getRemoteDeviceNameAliasErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceNameAliasErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceClassErrCode2900003Test
         * @tc.name    getRemoteDeviceClassErrCode2900003Test
         * @tc.desc    Test getRemoteDeviceClassErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getRemoteDeviceClassErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let deviceClass: connection.DeviceClass = connection.getRemoteDeviceClass("00:11:22:33:44:55");
                hilog.info(domain, tag, "getRemoteDeviceClass result:" + JSON.stringify(deviceClass));
                hilog.info(domain, tag, "getRemoteDeviceClass result majorClass:" + deviceClass.majorClass);
                hilog.info(domain, tag, "getRemoteDeviceClass result majorMinorClass:" + deviceClass.majorMinorClass);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceClass get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  setBluetoothScanModeErrCode2900003Test
         * @tc.name    setBluetoothScanModeErrCode2900003Test
         * @tc.desc    Test setBluetoothScanModeErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("setBluetoothScanModeErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getPairedDevicesErrCode2900003Test
         * @tc.name    getPairedDevicesErrCode2900003Test
         * @tc.desc    Test getPairedDevicesErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getPairedDevicesErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let devices: Array<string> = connection.getPairedDevices();
                hilog.info(domain, tag, "getPairedDevices result:" + JSON.stringify(devices));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPairedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  clientCloseErrCode2900003Test
         * @tc.name    clientCloseErrCode2900003Test
         * @tc.desc    Test clientCloseErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientCloseErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.close();
                hilog.info(domain, tag, 'gattClientDevice close success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  serverCloseErrCode2900003Test
         * @tc.name    serverCloseErrCode2900003Test
         * @tc.desc    Test serverCloseErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("serverCloseErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  clientConnectErrCode2900003Test
         * @tc.name    clientConnectErrCode2900003Test
         * @tc.desc    Test clientConnectErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientConnectErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  clientDisconnectErrCode2900003Test
         * @tc.name    clientDisconnectErrCode2900003Test
         * @tc.desc    Test clientDisconnectErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("clientDisconnectErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.disconnect();
                hilog.info(domain, tag, 'gattClientDevice disconnect success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice disconnect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  stopAdvertisingErrCode2900003Test
         * @tc.name    stopAdvertisingErrCode2900003Test
         * @tc.desc    Test stopAdvertisingErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("stopAdvertisingErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopAdvertising();
                hilog.info(domain, tag, 'stopAdvertising success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopAdvertising get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  stopBleScanErrCode2900003Test
         * @tc.name    stopBleScanErrCode2900003Test
         * @tc.desc    Test stopBleScanErrCode2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("stopBleScanErrCode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
                hilog.info(domain, tag, 'stopBLEScan success');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getPlayingState2900003Test
         * @tc.name    getPlayingState2900003Test
         * @tc.desc    Test getPlayingState2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getPlayingState2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile = a2dp.createA2dpSrcProfile();
                let state = a2dpProfile.getPlayingState('11:22:33:44:55:66');
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPlayingState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getConnectedDevices2900003Test
         * @tc.name    getConnectedDevices2900003Test
         * @tc.desc    Test getConnectedDevices2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectedDevices2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile = a2dp.createA2dpSrcProfile();
                let devices = a2dpProfile.getConnectedDevices();
                hilog.info(domain, tag, "address of connected devices list:" + devices);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectedDevices get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getConnectionState2900003Test
         * @tc.name    getConnectionState2900003Test
         * @tc.desc    Test getConnectionState2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectionState2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let a2dpProfile = a2dp.createA2dpSrcProfile();
                let state = a2dpProfile.getConnectionState("11:22:33:AA:BB:FF");
                hilog.info(domain, tag, "the connection state:" + state);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  addPersistentDeviceId2900003Test
         * @tc.name    addPersistentDeviceId2900003Test
         * @tc.desc    Test addPersistentDeviceId2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("addPersistentDeviceId2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.addPersistentDeviceId('00:00:00:00:00:00').then(() => {
                    hilog.info(domain, tag, 'addPersistentDeviceId success');
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "addPersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  deletePersistentDeviceId2900003Test
         * @tc.name    deletePersistentDeviceId2900003Test
         * @tc.desc    Test deletePersistentDeviceId2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("deletePersistentDeviceId2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await access.deletePersistentDeviceId('00:00:00:00:00:00').then(() => {
                    hilog.info(domain, tag, 'deletePersistentDeviceId success');
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "deletePersistentDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getPersistentDeviceIds2900003Test
         * @tc.name    getPersistentDeviceIds2900003Test
         * @tc.desc    Test getPersistentDeviceIds2900003Test API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getPersistentDeviceIds2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let macs: string[] = access.getPersistentDeviceIds();
                hilog.info(domain, tag, "getPersistentDeviceIds result:" + JSON.stringify(macs));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getPersistentDeviceIds get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  isValidRandomDeviceId2900003Test
         * @tc.name    isValidRandomDeviceId2900003Test
         * @tc.desc    test isValidRandomDeviceId2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("isValidRandomDeviceId2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let isValidRandom = access.isValidRandomDeviceId("00:00:00:00:00:00");
                hilog.info(domain, tag, "isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isValidRandomDeviceId get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getProfileConnectionState2900003Test
         * @tc.name    getProfileConnectionState2900003Test
         * @tc.desc    test getProfileConnectionState2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getProfileConnectionState2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let connectionState = connection.getProfileConnectionState();
                hilog.info(domain, tag, "getProfileConnectionState result:" + connectionState);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getProfileConnectionState get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  pairDeviceCallback2900003Test
         * @tc.name    pairDeviceCallback2900003Test
         * @tc.desc    test pairDeviceCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("pairDeviceCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.pairDevice('11:22:33:44:55:66', (err) => {
                    if (err) {
                        hilog.info(domain, tag, "pairDevice,device name err:" + JSON.stringify(err));
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  pairDevicePromise2900003Test
         * @tc.name    pairDevicePromise2900003Test
         * @tc.desc    test pairDevicePromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("pairDevicePromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.pairDevice('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'pairDevice success');
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "pairDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  setDevicePairingConfirmation2900003Test
         * @tc.name    setDevicePairingConfirmation2900003Test
         * @tc.desc    test setDevicePairingConfirmation2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("setDevicePairingConfirmation2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.setDevicePairingConfirmation("00:11:22:33:44:55", true);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePairingConfirmation get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  setDevicePinCodeCallback2900003Test
         * @tc.name    setDevicePinCodeCallback2900003Test
         * @tc.desc    test setDevicePinCodeCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("setDevicePinCodeCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                    expect(true).assertEqual(err.code === 2900003 || err.code === 2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  setDevicePinCodePromise2900003Test
         * @tc.name    setDevicePinCodePromise2900003Test
         * @tc.desc    test setDevicePinCodePromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("setDevicePinCodePromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                    hilog.info(domain, tag, 'setDevicePinCode success');
                }).catch((err: Error) => {
                    hilog.info(domain, tag, "setDevicePinCode_promise error:" + Number(err.code));
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setDevicePinCode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003 || err.code === 2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  getBluetoothScanMode2900003Test
         * @tc.name    getBluetoothScanMode2900003Test
         * @tc.desc    test getBluetoothScanMode2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getBluetoothScanMode2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanMode = connection.getBluetoothScanMode();
                hilog.info(domain, tag, "getBluetoothScanMode = " + JSON.stringify(scanMode));
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getBluetoothScanMode get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  startBluetoothDiscovery2900003Test
         * @tc.name    startBluetoothDiscovery2900003Test
         * @tc.desc    test startBluetoothDiscovery2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("startBluetoothDiscovery2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.startBluetoothDiscovery();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  stopBluetoothDiscovery2900003Test
         * @tc.name    stopBluetoothDiscovery2900003Test
         * @tc.desc    test stopBluetoothDiscovery2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("stopBluetoothDiscovery2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.stopBluetoothDiscovery();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBluetoothDiscovery get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  isBluetoothDiscovering2900003Test
         * @tc.name    isBluetoothDiscovering2900003Test
         * @tc.desc    test isBluetoothDiscovering2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("isBluetoothDiscovering2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let result = connection.isBluetoothDiscovering();
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "isBluetoothDiscovering get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteProfileUuidsCallback2900003Test
         * @tc.name    getRemoteProfileUuidsCallback2900003Test
         * @tc.desc    test getRemoteProfileUuidsCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getRemoteProfileUuidsCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.getRemoteProfileUuids('11:22:33:44:55:66', (err)=> {
                    if (err) {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback, err:" + JSON.stringify(err));
                    } else {
                        hilog.info(domain, tag, "getRemoteProfileUuids_callback success");
                    }
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteProfileUuidsPromise2900003Test
         * @tc.name    getRemoteProfileUuidsPromise2900003Test
         * @tc.desc    test getRemoteProfileUuidsPromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getRemoteProfileUuidsPromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteProfileUuids('11:22:33:44:55:66').then(()=> {
                    hilog.info(domain, tag, "getRemoteProfileUuids_promise success");
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteProfileUuids get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  connectAllowedProfilesCallback2900003Test
         * @tc.name    connectAllowedProfilesCallback2900003Test
         * @tc.desc    test connectAllowedProfilesCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("connectAllowedProfilesCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                connection.connectAllowedProfiles('11:22:33:44:55:66', (err) => {
                    if (err) {
                        hilog.info(domain, tag, "connectAllowedProfiles_callback, err:" + JSON.stringify(err));
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
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  connectAllowedProfilesPromise2900003Test
         * @tc.name    connectAllowedProfilesPromise2900003Test
         * @tc.desc    test connectAllowedProfilesPromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("connectAllowedProfilesPromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'connectAllowedProfiles success');
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "connectAllowedProfiles get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getRemoteDeviceBatteryInfo2900003Test
         * @tc.name    getRemoteDeviceBatteryInfo2900003Test
         * @tc.desc    test getRemoteDeviceBatteryInfo2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getRemoteDeviceBatteryInfo2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then(() => {
                    hilog.info(domain, tag, 'getRemoteDeviceBatteryInfo success');
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getRemoteDeviceBatteryInfo get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003 || err.code === 2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  setRemoteDeviceName2900003Test
         * @tc.name    setRemoteDeviceName2900003Test
         * @tc.desc    test setRemoteDeviceName2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("setRemoteDeviceName2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.setRemoteDeviceName('11:22:33:44:55:66', "RemoteDeviceName").then(() => {
                    hilog.info(domain, tag, "setRemoteDeviceName success");
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setRemoteDeviceName get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  getLastConnectionTime2900003Test
         * @tc.name    getLastConnectionTime2900003Test
         * @tc.desc    test getLastConnectionTime2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("getLastConnectionTime2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await connection.getLastConnectionTime('11:22:33:44:55:66').then((time) => {
                    hilog.info(domain, tag, "getLastConnectionTime success");
                });
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "getLastConnectionTime get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  startBLEScan2900003Test
         * @tc.name    startBLEScan2900003Test
         * @tc.desc    test startBLEScan2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("startBLEScan2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.startBLEScan([{}]);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  startAdvertising2900003Test
         * @tc.name    startAdvertising2900003Test
         * @tc.desc    test startAdvertising2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("startAdvertising2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                includeDeviceName: false
            };
            let manufactureDataUnit2: ble.ManufactureData = {
                manufactureId:1789,
                manufactureValue:manufactureValueBuffer.buffer
            }
            let serviceDataUnit2: ble.ServiceData = {
                serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                serviceValue:serviceValueBuffer.buffer
            }
            let advResponse: ble.AdvertiseData = {
                serviceUuids: ["00001889-0000-1000-8000-00805f9b34fb"],
                manufactureData: [manufactureDataUnit2],
                serviceData: [serviceDataUnit2]
            };
            try {
                ble.startAdvertising(setting, advData, advResponse);
                expect().assertFail();
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startAdvertising get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 401) {
                    hilog.info(domain, tag, 'api param error');
                    expect(true).assertEqual(err.code === 401);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  stopScan2900003Test
         * @tc.name    stopScan2900003Test
         * @tc.desc    test stopScan2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("stopScan2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let bleScanner: ble.BleScanner = ble.createBleScanner();
                hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(bleScanner));
                expect(true).assertEqual(bleScanner != null);
                await bleScanner.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
                expect().assertFail();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  startScan2900003Test
         * @tc.name    startScan2900003Test
         * @tc.desc    test startScan2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("startScan2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBuffer = new ArrayBuffer(8);
            let scanFilter: ble.ScanFilter = {
                deviceId: "00:11:22:33:44:55",
                name: "bleStartScanTest",
                serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                serviceUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                serviceSolicitationUuid: "00001888-0000-1000-8000-00805F9B34FB",
                serviceSolicitationUuidMask: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF",
                serviceData: arrayBuffer,
                serviceDataMask: arrayBuffer,
                manufactureId: 4567,
                manufactureData: arrayBuffer,
                manufactureDataMask: arrayBuffer
            };
            try {
                let bleScanner: ble.BleScanner = ble.createBleScanner();
                hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(bleScanner));
                expect(true).assertEqual(bleScanner != null);
                await bleScanner.startScan([scanFilter]).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                expect().assertFail();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "startScan get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(err.code === 2900003);
                }
            }
            done();
        })

        /**
         * @tc.number  notifyCharacteristicChangedCallback2900003Test
         * @tc.name    notifyCharacteristicChangedCallback2900003Test
         * @tc.desc    test notifyCharacteristicChangedCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("notifyCharacteristicChangedCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                } else if (err.code === 2900003) {
                    expect(true).assertEqual(err.code === 2900003);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  notifyCharacteristicChangedPromise2900003Test
         * @tc.name    notifyCharacteristicChangedPromise2900003Test
         * @tc.desc    test notifyCharacteristicChangedPromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("notifyCharacteristicChangedPromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let arrayBufferCCC = new ArrayBuffer(8);
                let cccValue = new Uint8Array(arrayBufferCCC);
                cccValue[0] = 1123;
                let notifyCharacter: ble.NotifyCharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBufferCCC,
                    confirm: true,
                };
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
                } else if (err.code === 2900003) {
                    expect(true).assertEqual(err.code === 2900003);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  disableAdvertisingCallback2900003Test
         * @tc.name    disableAdvertisingCallback2900003Test
         * @tc.desc    test disableAdvertisingCallback2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("disableAdvertisingCallback2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                } else if (err.code === 2900003) {
                    expect(true).assertEqual(err.code === 2900003);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

        /**
         * @tc.number  disableAdvertisingPromise2900003Test
         * @tc.name    disableAdvertisingPromise2900003Test
         * @tc.desc    test disableAdvertisingPromise2900003Test without permission
         * @tc.size    LargeTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it("disableAdvertisingPromise2900003Test", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingDisableParams: ble.AdvertisingDisableParams = {
                advertisingId: 0XFF
            };
            try {
                await ble.disableAdvertising(advertisingDisableParams).then(() => {
                    hilog.info(domain, tag, 'disableAdvertising promise success');
                });
                expect().assertFail();
            } catch (err){
                err = err as BusinessError;
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "disableAdvertising promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 2900003) {
                    expect(true).assertEqual(err.code === 2900003);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })
    })
}