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
import connection from '@ohos.bluetooth.connection';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testBtBleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let gattClientDevice: ble.GattClientDevice | undefined;
let gattServerDevice: ble.GattServer | undefined;
let bleScanner: ble.BleScanner | undefined;
let g_context: common.UIAbilityContext;
let nLength: int = 0;

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

export default function bluetoothBleTest() {

    describe("bluetoothBleTest", (): void => {
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
                hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
            }
            await Utils.msSleep(2000);
            await Utils.clickRequestPermission('允许');
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
            bleScanner = ble.createBleScanner();
            try {
                let deviceName = connection.getLocalName();
                nLength = deviceName.length;
                console.info(`deviceName.length = ${nLength}`);
            }catch (err){
                expect(Number(err.code)).assertEqual(801);
            }
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        beforeEach(async (): Promise<void> => {
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
        it("clientCloseTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let clientDevice: ble.GattClientDevice | undefined;
            try {
                clientDevice = ble.createGattClientDevice("00:00:00:00:00:00");
                hilog.info(domain, tag, 'createGattClientDevice result:' + clientDevice);
                expect(true).assertEqual(clientDevice != null);
            } catch (err) {
               
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createGattClientDevice get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                clientDevice!.close();
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "clientDevice close get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   serverCloseTest
         * @tc.number serverCloseTest
         * @tc.desc   Test serverCloseTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("serverCloseTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let serverDevice:ble.GattServer | undefined;
            try {
                serverDevice = ble.createGattServer();
                hilog.info(domain, tag, 'createGattServer result:' + serverDevice);
                expect(true).assertEqual(serverDevice != null);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createGattServer get errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            try {
                serverDevice!.close();
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "serverDevice close get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   setBLEMtuSizeTest
         * @tc.number setBLEMtuSizeTest
         * @tc.desc   Test setBLEMtuSizeTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("setBLEMtuSizeTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.setBLEMtuSize(500);
                hilog.info(domain, tag, 'setBLEMtuSize success');
                expect().assertFail();
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "setBLEMtuSize get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   clientConnectDisconnectTest
         * @tc.number clientConnectDisconnectTest
         * @tc.desc   Test clientConnectDisconnectTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("clientConnectDisconnectTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattClientDevice!.connect();
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice connect get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect().assertFail();
                }
            }
            try {
                gattClientDevice!.disconnect();
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "gattClientDevice disconnect get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.name   bleConstantTest
         * @tc.number bleConstantTest
         * @tc.desc   Test bleConstantTest API functionality
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("bleConstantTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let MATCH_MODE_STICKY: ble.MatchMode = ble.MatchMode.MATCH_MODE_STICKY;
                hilog.info(domain, tag, "MATCH_MODE_STICKY:" + MATCH_MODE_STICKY);
                expect(true).assertEqual(MATCH_MODE_STICKY === 2);
                let MATCH_MODE_AGGRESSIVE: ble.MatchMode = ble.MatchMode.MATCH_MODE_AGGRESSIVE;
                hilog.info(domain, tag, "MATCH_MODE_AGGRESSIVE:" + MATCH_MODE_AGGRESSIVE);
                expect(true).assertEqual(MATCH_MODE_AGGRESSIVE === 1);
                let SCAN_MODE_LOW_POWER: ble.ScanDuty = ble.ScanDuty.SCAN_MODE_LOW_POWER;
                hilog.info(domain, tag, "SCAN_MODE_LOW_POWER:" + SCAN_MODE_LOW_POWER);
                expect(true).assertEqual(SCAN_MODE_LOW_POWER === 0);
                let WRITE: ble.GattWriteType = ble.GattWriteType.WRITE;
                hilog.info(domain, tag, "WRITE:" + WRITE);
                expect(true).assertEqual(WRITE === 1);
                let WRITE_NO_RESPONSE: ble.GattWriteType = ble.GattWriteType.WRITE_NO_RESPONSE;
                hilog.info(domain, tag, "WRITE_NO_RESPONSE:" + WRITE_NO_RESPONSE);
                expect(true).assertEqual(WRITE_NO_RESPONSE === 2);
                let STARTED: ble.AdvertisingState = ble.AdvertisingState.STARTED;
                hilog.info(domain, tag, "STARTED:" + STARTED);
                expect(true).assertEqual(STARTED === 1);
                let ENABLED: ble.AdvertisingState = ble.AdvertisingState.ENABLED;
                hilog.info(domain, tag, "ENABLED:" + ENABLED);
                expect(true).assertEqual(ENABLED === 2);
                let DISABLED: ble.AdvertisingState = ble.AdvertisingState.DISABLED;
                hilog.info(domain, tag, "DISABLED:" + DISABLED);
                expect(true).assertEqual(DISABLED === 3);
                let STOPPED: ble.AdvertisingState = ble.AdvertisingState.STOPPED;
                hilog.info(domain, tag, "STOPPED:" + STOPPED);
                expect(true).assertEqual(STOPPED === 4);
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
        it("bleStopBLEScanTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                ble.stopBLEScan();
            } catch (err) {
               
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "stopBLEScan get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  createBleScannerTest
         * @tc.name    createBleScannerTest
         * @tc.desc    Test createBleScanner API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("createBleScannerTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let testBleScanner: ble.BleScanner = ble.createBleScanner();
                hilog.info(domain, tag, 'createBleScanner result:' + JSON.stringify(testBleScanner));
                expect(true).assertEqual(testBleScanner != null);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "createBleScanner get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  startAdvertisingTest
         * @tc.name    startAdvertisingTest
         * @tc.desc    startAdvertisingTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startAdvertisingTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                hilog.info(domain, tag, "startAdvertising successful");
                ble.stopAdvertising();
            } catch (err) {
                hilog.error(domain, tag, "startAdvertisingTest get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, "Capability not supported.");
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  getConnectedBLEDevicesTest
         * @tc.name    getConnectedBLEDevicesTest
         * @tc.desc    getConnectedBLEDevicesTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getConnectedBLEDevicesTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let result: Array<string> = ble.getConnectedBLEDevices();
                hilog.info(domain, tag, JSON.stringify(result));
                expect(true).assertEqual(result !== null);
            } catch (err) {
                hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  startBLEScanTest
         * @tc.name    startBLEScanTest
         * @tc.desc    startBLEScanTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startBLEScanTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
                };
                ble.startBLEScan([scanFilter], scanOptions);
            } catch (err) {
                hilog.error(domain, tag, "startBLEScan errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  addServiceTest
         * @tc.name    addServiceTest
         * @tc.desc    addServiceTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("addServiceTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            } catch (err) {
                hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  removeServiceTest
         * @tc.name    removeServiceTest
         * @tc.desc    removeServiceTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("removeServiceTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                gattServerDevice!.removeService('00001810-0000-1000-8000-00805F9B34FB');
            } catch (err) {
                hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(true).assertEqual(Number(err.code) === 2900099 || Number(err.code) === 401);
                }
            }
            done();
        })

        /**
         * @tc.number  sendResponseTest
         * @tc.name    sendResponseTest
         * @tc.desc    sendResponseTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("sendResponseTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1123;
            let serverResponse: ble.ServerResponse = {
                deviceId: '00:11:22:33:44:55',
                transId: 1,
                status: 0,
                offset: 0,
                value: arrayBufferCCC
            };
            try {
                gattServerDevice!.sendResponse(serverResponse);
                expect(true).assertFalse();
            } catch (err) {
                hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  sendResponseTest_001
         * @tc.name    sendResponseTest_001
         * @tc.desc    sendResponseTest_001
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("sendResponseTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBufferCCC = new ArrayBuffer(8);
            let cccValue = new Uint8Array(arrayBufferCCC);
            cccValue[0] = 1123;
            let serverResponse: ble.ServerResponse = {
                deviceId: '00:11:22:33:44:55',
                transId: 1,
                status: -1,
                offset: 0,
                value: arrayBufferCCC
            };
            try {
                gattServerDevice!.sendResponse(serverResponse);
                expect(true).assertFalse();
            } catch (err) {
                hilog.error(domain, tag, "sendResponseTest_001, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  testScanDuty
         * @tc.name    testScanDuty
         * @tc.desc    Test testScanDuty API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testScanDuty", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanModeLowPower = ble.ScanDuty.SCAN_MODE_LOW_POWER;
                let scanModeBalanced = ble.ScanDuty.SCAN_MODE_BALANCED;
                let scanModeLowLatency = ble.ScanDuty.SCAN_MODE_LOW_LATENCY;
                expect(scanModeLowPower).assertEqual(0);
                expect(scanModeBalanced).assertEqual(1);
                expect(scanModeLowLatency).assertEqual(2);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testScanDuty errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testStartAdvertising
         * @tc.name    testStartAdvertising
         * @tc.desc    Test testStartAdvertising API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testStartAdvertising", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let started = ble.AdvertisingState.STARTED;
                let enabled = ble.AdvertisingState.ENABLED;
                let disabled = ble.AdvertisingState.DISABLED;
                let stopped = ble.AdvertisingState.STOPPED;
                expect(started).assertEqual(1);
                expect(enabled).assertEqual(2);
                expect(disabled).assertEqual(3);
                expect(stopped).assertEqual(4);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testStartAdvertising errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testPhyType
         * @tc.name    testPhyType
         * @tc.desc    Test testPhyType API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testPhyType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let phyLe1m = ble.PhyType.PHY_LE_1M;
                let phyLeAllSupported = ble.PhyType.PHY_LE_ALL_SUPPORTED;
                expect(phyLe1m).assertEqual(1);
                expect(phyLeAllSupported).assertEqual(255);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testPhyType errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testScanReportMode
         * @tc.name    testScanReportMode
         * @tc.desc    Test testScanReportMode API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testScanReportMode", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let normal = ble.ScanReportMode.NORMAL;
                hilog.info(domain, tag, "ScanReportMode NORMAL: " + JSON.stringify(normal));
                expect(normal).assertEqual(1);

                let fenceSensitivityLow = ble.ScanReportMode.FENCE_SENSITIVITY_LOW;
                hilog.info(domain, tag, "ScanReportMode FENCE_SENSITIVITY_LOW: " + JSON.stringify(fenceSensitivityLow));
                expect(fenceSensitivityLow).assertEqual(10);

                let fenceSensitivityHigh = ble.ScanReportMode.FENCE_SENSITIVITY_HIGH;
                hilog.info(domain, tag, "ScanReportMode FENCE_SENSITIVITY_HIGH: " + JSON.stringify(fenceSensitivityHigh));
                expect(fenceSensitivityHigh).assertEqual(11);

                let batch = ble.ScanReportMode.BATCH;
                hilog.info(domain, tag, "ScanReportMode BATCH: " + JSON.stringify(batch));
                expect(batch).assertEqual(2);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testScanReportMode errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  testScanReportType
         * @tc.name    testScanReportType
         * @tc.desc    Test testScanReportType API functionality
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("testScanReportType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let ON_FOUND = ble.ScanReportType.ON_FOUND;
                hilog.info(domain, tag, "ScanReportType ON_FOUND: " + JSON.stringify(ON_FOUND));
                expect(ON_FOUND).assertEqual(1);

                let ON_LOST = ble.ScanReportType.ON_LOST;
                hilog.info(domain, tag, "ScanReportType ON_LOST: " + JSON.stringify(ON_LOST));
                expect(ON_LOST).assertEqual(2);
            } catch (err) {
                hilog.info(domain, tag, "get error:" + JSON.stringify(err));
                hilog.info(domain, tag, "testScanReportType errCode:" + err.code + ",errMessage:" + err.message);
                expect().assertFail();
            }
            done();
        })

        /**
         * @tc.number  startBLEScanTest_001
         * @tc.name    startBLEScanTest_001
         * @tc.desc    startBLEScanTest_001
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startBLEScanTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                ble.startBLEScan([scanFilter]);
            } catch (err) {
                hilog.error(domain, tag, "startBLEScanTest_001 errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  startAdvertisingTest_001
         * @tc.name    startAdvertisingTest_001
         * @tc.desc    startAdvertisingTest_001
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startAdvertisingTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, "startAdvertising successful");
                ble.stopAdvertising();
            } catch (err) {
                hilog.error(domain, tag, "startAdvertisingTest_001 get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })


        /**
         * @tc.number  getDeviceNameTest_promise
         * @tc.name    getDeviceNameTest_promise
         * @tc.desc    getDeviceNameTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getDeviceNameTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                await gattClientDevice!.getDeviceName().then((data: string) => {
                    expect(true).assertEqual(data !== null);
                    hilog.info(domain, tag, 'device name' + JSON.stringify(data));
                    done();
                }).catch((err: Error) => {
                    hilog.info(domain, tag, 'getDeviceName error');
                    expect(Number(err.code)).assertEqual(2900099);
                    done();
                });
            } catch (err) {
                hilog.error(domain, tag, "errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  enableAdvertisingTest_promise
         * @tc.name    enableAdvertisingTest_promise
         * @tc.desc    enableAdvertisingTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("enableAdvertisingTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingEnableParams: ble.AdvertisingEnableParams = {
                advertisingId: 0XFF
            };
            try {
                await ble.enableAdvertising(advertisingEnableParams).then(() => {
                    hilog.info(domain, tag, 'enableAdvertising promise enable success');
                });
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, "enableAdvertisingTest_promise, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

        /**
         * @tc.number  bleStopScanTest
         * @tc.name    bleStopScanTest
         * @tc.desc    bleStopScanTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("bleStopScanTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let scanOptions: ble.ScanOptions = {
                interval: 500,
                dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                phyType: ble.PhyType.PHY_LE_ALL_SUPPORTED,
                reportMode: ble.ScanReportMode.NORMAL
            };
            try {
                await bleScanner!.startScan([{}], scanOptions).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, "stopScan errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  bleStartScanTest
         * @tc.name    bleStartScanTest
         * @tc.desc    bleStartScanTest
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("bleStartScanTest", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                await bleScanner!.startScan([scanFilter]).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, "bleStartScanTest, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })


        /**
         * @tc.number  setCharacteristicChangeIndicationTest_promise
         * @tc.name    setCharacteristicChangeIndicationTest_promise
         * @tc.desc    setCharacteristicChangeIndicationTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("setCharacteristicChangeIndicationTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            let arrayBufferC = new ArrayBuffer(8);
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors: descriptors
            };
            try {
                await gattClientDevice!.setCharacteristicChangeIndication(characteristic, true).then(() => {
                    hilog.info(domain, tag, "setCharacteristicChangeIndication promise successful");
                });
            } catch (err) {
                hilog.error(domain, tag, "setCharacteristicChangeIndication promise get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.error(domain, tag, 'api is not support');
                    expect(Number(err.code)).assertEqual(801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })

        /**
         * @tc.number  readDescriptorValueTest_promise
         * @tc.name    readDescriptorValueTest_promise
         * @tc.desc    readDescriptorValueTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("readDescriptorValueTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                descriptorValue: bufferDesc
            };
            try {
                await gattClientDevice!.readDescriptorValue(descriptor);
                expect(true).assertFalse();
            } catch (err) {
                hilog.error(domain, tag, "readDescriptorValue promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, "api is not supported.");
                    expect(true).assertEqual(err.code === 801);
                } else if (err.code === 401) {
                    expect(Number(err.code)).assertEqual(401);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  readCharacteristicValueTest_promise
         * @tc.name    readCharacteristicValueTest_promise
         * @tc.desc    readCharacteristicValueTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("readCharacteristicValueTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                gattClientDevice!.readCharacteristicValue(characteristic);
            } catch (err) {
                hilog.error(domain, tag, "readCharacteristicValue promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, "api is not supported.");
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(401);
                }
            }
            done();
        })

        /**
         * @tc.number  notifyCharacteristicChangedTest_promise
         * @tc.name    notifyCharacteristicChangedTest_promise
         * @tc.desc    notifyCharacteristicChangedTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("notifyCharacteristicChangedTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            let arrayBufferC = new ArrayBuffer(8);
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors: descriptors
            };
            let notifyCharacter: ble.NotifyCharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB',
                characteristicValue: characteristic.characteristicValue,
                confirm: false
            };
            try {
                gattServerDevice!.notifyCharacteristicChanged("00:11:22:33:44:55", notifyCharacter).then(() => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged promise successful");
                }).catch((err: Error) => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged promise failed: " + JSON.stringify(err));
                });
            } catch (err) {
                hilog.error(domain, tag, "notifyCharacteristicChanged promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, "api is not supported.");
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2900099);
                }
            }
            done();
        })

        /**
         * @tc.number  disableAdvertisingTest_promise
         * @tc.name    disableAdvertisingTest_promise
         * @tc.desc    disableAdvertisingTest_promise
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("disableAdvertisingTest_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let advertisingDisableParams: ble.AdvertisingDisableParams = {
                advertisingId: 0XFF
            };
            try {
                await ble.disableAdvertising(advertisingDisableParams).then(() => {
                    hilog.info(domain, tag, 'disableAdvertising promise success');
                });
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, "disableAdvertising promise errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

        /**
         * @tc.number  startAdvertisingTest_002
         * @tc.name    startAdvertisingTest_002
         * @tc.desc    startAdvertisingTest_002
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size:   MEDIUMTEST
         */
        it("startAdvertisingTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let manufactureValueBuffers = new Uint8Array(32);
            for (let count = 0; count < 32; count++) {
                manufactureValueBuffers[count] = (count+1);
            }
            let manufactureDataUnits: ble.ManufactureData = {
                manufactureId:4567,
                manufactureValue:manufactureValueBuffers.buffer
            };
            let advDatas: ble.AdvertiseData = {
                serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData:[manufactureDataUnits],
                serviceData:[serviceDataUnit],
                includeDeviceName:false,
                includeTxPower:false
            };
            try {
                ble.startAdvertising(setting, advDatas, advResponse);
                hilog.info(domain, tag, "startAdvertising The length of the advertising data exceeds the upper limit success");
            } catch (err) {
                hilog.error(domain, tag, "startAdvertisingTest_002 get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2902054);
                }
            }
            done();
        })

        /**
         * @tc.number  startAdvertisingTest_promise_002
         * @tc.name    startAdvertisingTest_promise_002
         * @tc.desc    startAdvertisingTest_promise_002
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startAdvertisingTest_promise_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let manufactureValueBuffers = new Uint8Array(32);
            for (let count = 0; count < 32; count++) {
                manufactureValueBuffers[count] = (count+1);
            }
            let manufactureDataUnits: ble.ManufactureData = {
                manufactureId:4567,
                manufactureValue:manufactureValueBuffers.buffer
            };
            let advDatas: ble.AdvertiseData = {
                serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
                manufactureData:[manufactureDataUnits],
                serviceData:[serviceDataUnit],
                includeDeviceName:false,
                includeTxPower:false
            };
            let advertisingParams: ble.AdvertisingParams = {
                advertisingSettings: setting,
                advertisingData: advDatas,
                advertisingResponse: advResponse,
                duration: 0,
            }
            try {
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    hilog.info(domain, tag, "startAdvertising return outAdvHandle: " + outAdvHandle);
                });
                hilog.info(domain, tag, "startAdvertising The length of the advertising data exceeds the upper limit success");
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, "startAdvertisingTest_promise_002 get errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2902054);
                }
            }
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_DutyMode_SCAN_MODE_BALANCED_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_DutyMode_SCAN_MODE_BALANCED_0100
         * @tc.desc Test startScan(Promise) with SCAN_MODE_BALANCED
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_DutyMode_SCAN_MODE_BALANCED_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_DutyMode_SCAN_MODE_BALANCED_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_BALANCED,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, `${caseName} bleScanner stopScan success`)
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_SetCharacteristicChangeIndication_Enable_True_0100
         * @tc.name SUB_Communication_BLE_SetCharacteristicChangeIndication_Enable_True_0100
         * @tc.desc Test setCharacteristicChangeIndication with enable true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_SetCharacteristicChangeIndication_Enable_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_SetCharacteristicChangeIndication_Enable_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                gattClientDevice!.setCharacteristicChangeIndication(characteristic, true, (err) => {
                    if (err) {
                        hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                        expect(Number(err.code) === 401).assertTrue();
                        done()
                    } else {
                        hilog.info(domain, tag, `${caseName} setCharacteristicChangeIndication success`);
                    }
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errorCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code) === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_MatchMode_MATCH_MODE_STICKY_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_MatchMode_MATCH_MODE_STICKY_0100
         * @tc.desc Test startScan(Promise) with MATCH_MODE_STICKY
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_MatchMode_MATCH_MODE_STICKY_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_MatchMode_MATCH_MODE_STICKY_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 0,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_STICKY
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success')
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })
		
		
		/**
         * @tc.number SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_BALANCED_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_BALANCED_0100
         * @tc.desc Test startBLEScan with SCAN_MODE_BALANCED
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_BALANCED_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_BALANCED_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_BALANCED,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500)
                ble.stopBLEScan();
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code)  === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_LOW_LATENCY_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_LOW_LATENCY_0100
         * @tc.desc Test startBLEScan with SCAN_MODE_LOW_LATENCY
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_LOW_LATENCY_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_DutyMode_SCAN_MODE_LOW_LATENCY_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_LATENCY,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500)
                ble.stopBLEScan();
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_MatchMode_MATCH_MODE_STICKY_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_MatchMode_MATCH_MODE_STICKY_0100
         * @tc.desc Test startBLEScan with MATCH_MODE_STICKY
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_MatchMode_MATCH_MODE_STICKY_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_MatchMode_MATCH_MODE_STICKY_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_STICKY
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500)
                ble.stopBLEScan();
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_PhyType_PHY_LE_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_PhyType_PHY_LE_0100
         * @tc.desc Test startBLEScan with PHY_LE_1M
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_PhyType_PHY_LE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_PhyType_PHY_LE_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500)
                ble.stopBLEScan();
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_ReportMode_BATCH_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_ReportMode_BATCH_0100
         * @tc.desc Test startBLEScan with BATCH
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_ReportMode_BATCH_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_ReportMode_BATCH_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.BATCH
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500);
                ble.stopBLEScan()
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_LOW_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_LOW_0100
         * @tc.desc Test startBLEScan with FENCE_SENSITIVITY_LOW
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_LOW_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_LOW_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.FENCE_SENSITIVITY_LOW
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500);
                ble.stopBLEScan()
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_HIGH_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_HIGH_0100
         * @tc.desc Test startBLEScan with FENCE_SENSITIVITY_HIGH
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_HIGH_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_ReportMode_FENCE_SENSITIVITY_HIGH_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.FENCE_SENSITIVITY_HIGH
                };
                ble.startBLEScan([scanFilter], scanOptions);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500);
                ble.stopBLEScan()
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (Number(err.code) === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(Number(err.code) === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_Filters_Null_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_Filters_Null_0100
         * @tc.desc Test startScan(Promise) with null filters
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_Filters_Null_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_Filters_Null_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE
                };
                await bleScanner!.startScan(null, scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_GetConnectedBLEDevices_Empty_0100
         * @tc.name SUB_Communication_BLE_GetConnectedBLEDevices_Empty_0100
         * @tc.desc Test getConnectedBLEDevices return empty array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_GetConnectedBLEDevices_Empty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_GetConnectedBLEDevices_Empty_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let result: Array<string> = ble.getConnectedBLEDevices();
                hilog.info(domain, tag, `${caseName} getConnectedBLEDevices success, result: ` + JSON.stringify(result));
                expect(result.length).assertEqual(0);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_GetConnectedBLEDevices_NonEmpty_0100
         * @tc.name SUB_Communication_BLE_GetConnectedBLEDevices_NonEmpty_0100
         * @tc.desc Test getConnectedBLEDevices return non-empty array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_GetConnectedBLEDevices_NonEmpty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_GetConnectedBLEDevices_NonEmpty_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let result: Array<string> = ble.getConnectedBLEDevices();
                hilog.info(domain, tag, `${caseName} getConnectedBLEDevices success, result: ` + JSON.stringify(result));
                expect(result.length).assertEqual(0);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Enable_False_0100
         * @tc.name SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Enable_False_0100
         * @tc.desc Test setCharacteristicChangeIndication(promise) with enable false
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Enable_False_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Enable_False_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                await gattClientDevice!.setCharacteristicChangeIndication(characteristic, false).then(() => {
                    hilog.info(domain, tag, `${caseName} setCharacteristicChangeIndication success`);
                });

            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_EmptyArray_0100
         * @tc.desc Test setCharacteristicChangeIndication(promise) with empty descriptors array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                await gattClientDevice!.setCharacteristicChangeIndication(characteristic, true).then(() => {
                    hilog.info(domain, tag, `${caseName} setCharacteristicChangeIndication success`);
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_NonEmptyArray_0100
         * @tc.name SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_NonEmptyArray_0100
         * @tc.desc Test setCharacteristicChangeIndication(promise) with non-empty descriptors array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_NonEmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
        async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_SetCharacteristicChangeIndication_Promise_Descriptors_NonEmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let descArrayBuffer = new ArrayBuffer(8);
                let descriptor: ble.BLEDescriptor = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                    descriptorValue: descArrayBuffer
                };
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: [descriptor]
                };
                await gattClientDevice!.setCharacteristicChangeIndication(characteristic, true).then(() => {
                    hilog.info(domain, tag, `${caseName} setCharacteristicChangeIndication success`);
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartBLEScan_Filters_Null_0100
         * @tc.name SUB_Communication_BLE_StartBLEScan_Filters_Null_0100
         * @tc.desc Test startBLEScan with null filters
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartBLEScan_Filters_Null_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartBLEScan_Filters_Null_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                ble.startBLEScan(null);
                hilog.info(domain, tag, `${caseName} startBLEScan success`);
                await Utils.msSleep(500)
                ble.stopBLEScan();
                hilog.info(domain, tag, `${caseName} stopBLEScan success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_Connectable_False_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_Connectable_False_0100
         * @tc.desc Test startAdvertising with connectable false
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_Connectable_False_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_Connectable_False_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let setting: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: false
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
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);

            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_ServiceUuids_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_ServiceUuids_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty serviceUuids array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_ServiceUuids_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_ServiceUuids_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceUuids: [],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_ManufactureData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_ManufactureData_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty manufactureData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_ManufactureData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_ManufactureData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let setting: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let serviceDataUnit: ble.ServiceData = {
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue: serviceValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [],
                    serviceData: [serviceDataUnit]
                };
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_ServiceData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_ServiceData_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty serviceData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_ServiceData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_ServiceData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: []
                };
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_IncludeDeviceName_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_IncludeDeviceName_True_0100
         * @tc.desc Test startAdvertising with includeDeviceName true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_IncludeDeviceName_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_IncludeDeviceName_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let manufactureValueBuffer = new Uint8Array(2);
                manufactureValueBuffer[0] = 1;
                manufactureValueBuffer[1] = 2;
                let serviceValueBuffer = new Uint8Array(2);
                serviceValueBuffer[0] = 4;
                serviceValueBuffer[1] = 6;
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
                    serviceData: [serviceDataUnit],
                    includeDeviceName: true
                };
                console.info(`${caseName} deviceName.length = ${nLength}`);
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    if (nLength > 10) {
                        expect(err.code === 2902054).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_IncludeTxPower_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_IncludeTxPower_True_0100
         * @tc.desc Test startAdvertising with includeTxPower true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_IncludeTxPower_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_IncludeTxPower_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceData: [serviceDataUnit],
                    includeTxPower: true
                };
                ble.startAdvertising(setting, advData);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceUuids_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceUuids_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty advResponse.serviceUuids array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceUuids_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceUuids_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceUuids: [],
                    manufactureData: [],
                    serviceData: []
                };
                ble.startAdvertising(setting, advData, advResponse);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvResponse_ManufactureData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvResponse_ManufactureData_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty advResponse.manufactureData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvResponse_ManufactureData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvResponse_ManufactureData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    manufactureData: [],
                    serviceData: []
                };
                ble.startAdvertising(setting, advData, advResponse);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceData_EmptyArray_0100
         * @tc.desc Test startAdvertising with empty advResponse.serviceData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvResponse_ServiceData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceData: []
                };
                ble.startAdvertising(setting, advData, advResponse);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);

            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

  
        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeDeviceName_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeDeviceName_True_0100
         * @tc.desc Test startAdvertising with advResponse.includeDeviceName true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeDeviceName_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeDeviceName_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceData: [serviceDataUnit],
                    includeDeviceName: true
                };
                console.info(`${caseName} deviceName.length = ${nLength}`);
                ble.startAdvertising(setting, advData, advResponse);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    if (nLength > 9) {
                        expect(err.code === 2902054).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeTxPower_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeTxPower_True_0100
         * @tc.desc Test startAdvertising with advResponse.includeTxPower true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeTxPower_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvResponse_IncludeTxPower_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
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
                    serviceData: [serviceDataUnit],
                    includeTxPower: true
                };
                ble.startAdvertising(setting, advData, advResponse);
                hilog.info(domain, tag, `${caseName} startAdvertising success`);
                ble.stopAdvertising();
                hilog.info(domain, tag, `${caseName} stopAdvertising success`);
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_Connectable_False_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_Connectable_False_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with connectable false
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_Connectable_False_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_Connectable_False_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
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
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: false
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` )
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceUuids_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceUuids_EmptyArray_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with empty advertisingData.serviceUuids array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceUuids_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceUuids_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let manufactureDataUnit: ble.ManufactureData = {
                    manufactureId: 4567,
                    manufactureValue: manufactureValueBuffer.buffer
                };
                let serviceDataUnit: ble.ServiceData = {
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue: serviceValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: [],
                    manufactureData: [manufactureDataUnit],
                    serviceData: [serviceDataUnit]
                };
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` )
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ManufactureData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ManufactureData_EmptyArray_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with empty advertisingData.manufactureData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ManufactureData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ManufactureData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let serviceDataUnit: ble.ServiceData = {
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue: serviceValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [],
                    serviceData: [serviceDataUnit]
                };
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` )
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceData_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceData_EmptyArray_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with empty advertisingData.serviceData array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceData_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_ServiceData_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let manufactureDataUnit: ble.ManufactureData = {
                    manufactureId: 4567,
                    manufactureValue: manufactureValueBuffer.buffer
                };
                let advData: ble.AdvertiseData = {
                    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
                    manufactureData: [manufactureDataUnit],
                    serviceData: []
                };
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` )
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeDeviceName_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeDeviceName_True_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with advertisingData.includeDeviceName true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeDeviceName_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeDeviceName_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let manufactureValueBuffer = new Uint8Array(2);
                manufactureValueBuffer[0] = 1;
                manufactureValueBuffer[1] = 2;
                let serviceValueBuffer = new Uint8Array(2);
                serviceValueBuffer[0] = 4;
                serviceValueBuffer[1] = 6;

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
                    includeDeviceName: true
                };
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                console.info(`${caseName} deviceName.length = ${nLength}`);
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` );
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    if (nLength > 10) {
                        expect(err.code === 2902054).assertTrue();
                    }else{
                        expect().assertFail();
                    }
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeTxPower_True_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeTxPower_True_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with advertisingData.includeTxPower true
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeTxPower_True_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingData_IncludeTxPower_True_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
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
                    includeTxPower: true
                };
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advData,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` );
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingResponse_ServiceUuids_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingResponse_ServiceUuids_EmptyArray_0100
         * @tc.desc Test startAdvertising(AdvertisingParams) with empty
 advertisingResponse.serviceUuids array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingResponse_ServiceUuids_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartAdvertising_AdvertisingParams_AdvertisingResponse_ServiceUuids_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
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
                let advertisingSettings: ble.AdvertiseSetting = {
                    interval: 150,
                    txPower: 0,
                    connectable: true
                };
                let advertisingResponse: ble.AdvertiseData = {
                    serviceUuids: [],
                    manufactureData: [],
                    serviceData: []
                };
                let advertisingParams: ble.AdvertisingParams = {
                    advertisingSettings: advertisingSettings,
                    advertisingData: advData,
                    advertisingResponse: advertisingResponse,
                    duration: 0
                };
                let advHandle = 0xFF;
                await ble.startAdvertising(advertisingParams).then((outAdvHandle) => {
                    advHandle = outAdvHandle
                    hilog.info(domain, tag, `${caseName} startAdvertising return outAdvHandle: ` + outAdvHandle);
                });
                ble.stopAdvertising()
                console.info(`${caseName}  stopAdvertising promise success:` );
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_EmptyArray_0100
         * @tc.desc Test readCharacteristicValue with empty descriptors array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                gattClientDevice!.readCharacteristicValue(characteristic);
                hilog.info(domain, tag, `${caseName} readCharacteristicValue success`);
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_NonEmptyArray_0100
         * @tc.name SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_NonEmptyArray_0100
         * @tc.desc Test readCharacteristicValue with non-empty descriptors array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_NonEmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadCharacteristicValue_Descriptors_NonEmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let descArrayBuffer = new ArrayBuffer(8);
                let descriptor: ble.BLEDescriptor = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                    descriptorValue: descArrayBuffer
                };
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: [descriptor]
                };
                gattClientDevice!.readCharacteristicValue(characteristic);
                hilog.info(domain, tag, `${caseName} readCharacteristicValue success`);
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_ReadCharacteristicValue_Promise_Descriptors_EmptyArray_0100
         * @tc.name SUB_Communication_BLE_ReadCharacteristicValue_Promise_Descriptors_EmptyArray_0100
         * @tc.desc Test readCharacteristicValue(Promise) with empty descriptors array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadCharacteristicValue_Promise_Descriptors_EmptyArray_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadCharacteristicValue_Promise_Descriptors_EmptyArray_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                await gattClientDevice!.readCharacteristicValue(characteristic).then((data) => {
                    hilog.info(domain, tag, `${caseName} readCharacteristicValue success`);
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_PhyType_PHY_LE_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_PhyType_PHY_LE_0100
         * @tc.desc Test startScan(Promise) with PHY_LE_1M
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_PhyType_PHY_LE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_PhyType_PHY_LE_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 0,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(100);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(err.code === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_ReportMode_BATCH_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_ReportMode_BATCH_0100
         * @tc.desc Test startScan(Promise) with BATCH
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_ReportMode_BATCH_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_ReportMode_BATCH_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.BATCH
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_LOW_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_LOW_0100
         * @tc.desc Test startScan(Promise) with FENCE_SENSITIVITY_LOW
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_LOW_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_LOW_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.FENCE_SENSITIVITY_LOW
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_HIGH_0100
         * @tc.name SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_HIGH_0100
         * @tc.desc Test startScan(Promise) with FENCE_SENSITIVITY_HIGH
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_HIGH_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_StartScan_Promise_ReportMode_FENCE_SENSITIVITY_HIGH_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let scanFilter: ble.ScanFilter = {
                    deviceId: "00:11:22:33:44:55",
                    name: "test",
                    serviceUuid: "00001888-0000-1000-8000-00805f9b34fb"
                };
                let scanOptions: ble.ScanOptions = {
                    interval: 500,
                    dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
                    phyType: ble.PhyType.PHY_LE_1M,
                    reportMode: ble.ScanReportMode.FENCE_SENSITIVITY_HIGH
                };
                await bleScanner!.startScan([scanFilter], scanOptions).then(() => {
                    hilog.info(domain, tag, `${caseName} startScan success`);
                });
                await Utils.msSleep(500);
                await bleScanner!.stopScan().then(() => {
                    hilog.info(domain, tag, 'bleScanner stopScan success');
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_ReadDescriptorValue_Promise_0100
         * @tc.name SUB_Communication_BLE_ReadDescriptorValue_Promise_0100
         * @tc.desc Test readDescriptorValue with promise
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadDescriptorValue_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadDescriptorValue_Promise_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let descriptor: ble.BLEDescriptor = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer
                };
                await gattClientDevice!.readDescriptorValue(descriptor).then((data) => {
                    hilog.info(domain, tag, `${caseName} readDescriptorValue success`);
                });
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code) === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })
         //新增用例如下：

        /**
         * @tc.number SUB_Communication_BLE_GetConnectedBLEDevices_Return_Empty_0100
         * @tc.name SUB_Communication_BLE_GetConnectedBLEDevices_Return_Empty_0100
         * @tc.desc Test getConnectedBLEDevices return empty array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_GetConnectedBLEDevices_Return_Empty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_GetConnectedBLEDevices_Return_Empty_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let devices: Array<string> = ble.getConnectedBLEDevices();
                hilog.info(domain, tag, `${caseName} getConnectedBLEDevices success:` + JSON.stringify(devices));
                expect(Array.isArray(devices)).assertTrue();
                if (devices.length > 0) {
                    expect(typeof devices[0] === 'string').assertTrue();
                } else {
                    expect(devices.length === 0).assertTrue();
                }
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number SUB_Communication_BLE_GetConnectedBLEDevices_Return_NotEmpty_0100
         * @tc.name SUB_Communication_BLE_GetConnectedBLEDevices_Return_NotEmpty_0100
         * @tc.desc Test getConnectedBLEDevices return not empty array
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_GetConnectedBLEDevices_Return_NotEmpty_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_GetConnectedBLEDevices_Return_NotEmpty_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let devices: Array<string> = ble.getConnectedBLEDevices();
                hilog.info(domain, tag, `${caseName} getConnectedBLEDevices success:` + JSON.stringify(devices));
                expect(Array.isArray(devices)).assertTrue();
                if (devices.length > 0) {
                    expect(typeof devices[0] === 'string').assertTrue();
                } else {
                    expect(devices.length === 0).assertTrue();
                }
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect().assertFail();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_ReadCharacteristicValue_Promise_Return_AllProperties_0100
         * @tc.name SUB_Communication_BLE_ReadCharacteristicValue_Promise_Return_AllProperties_0100
         * @tc.desc Test readCharacteristicValue promise return all properties
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadCharacteristicValue_Promise_Return_AllProperties_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadCharacteristicValue_Promise_Return_AllProperties_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let characteristic: ble.BLECharacteristic = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    characteristicValue: arrayBuffer,
                    descriptors: []
                };
                let data: ble.BLECharacteristic = await gattClientDevice!.readCharacteristicValue(characteristic);
                hilog.info(domain, tag, `${caseName} readCharacteristicValue success`);
                hilog.info(domain, tag, `${caseName} serviceUuid: ` + data.serviceUuid);
                hilog.info(domain, tag, `${caseName} characteristicUuid: ` + data.characteristicUuid);
                hilog.info(domain, tag, `${caseName} characteristicValue: ` + JSON.stringify(data.characteristicValue));
                hilog.info(domain, tag, `${caseName} descriptors: ` + JSON.stringify(data.descriptors));
                expect(typeof data.serviceUuid === 'string').assertTrue();
                expect(typeof data.characteristicUuid === 'string').assertTrue();
                expect(data.characteristicValue instanceof ArrayBuffer).assertTrue();
                expect(Array.isArray(data.descriptors)).assertTrue();
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code) === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })


        /**
         * @tc.number SUB_Communication_BLE_ReadDescriptorValue_Promise_Return_AllProperties_0100
         * @tc.name SUB_Communication_BLE_ReadDescriptorValue_Promise_Return_AllProperties_0100
         * @tc.desc Test readDescriptorValue promise return all properties
         * @tc.level Level 0
         * @tc.type Function
         * @tc.size MEDIUMTEST
         */
        it("SUB_Communication_BLE_ReadDescriptorValue_Promise_Return_AllProperties_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName = "SUB_Communication_BLE_ReadDescriptorValue_Promise_Return_AllProperties_0100";
            hilog.info(domain, tag, `${caseName} test start`);
            try {
                let arrayBuffer = new ArrayBuffer(8);
                let descriptor: ble.BLEDescriptor = {
                    serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                    characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                    descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                    descriptorValue: arrayBuffer
                };
                let data: ble.BLEDescriptor = await gattClientDevice!.readDescriptorValue(descriptor);
                hilog.info(domain, tag, `${caseName} readDescriptorValue success`);
                hilog.info(domain, tag, `${caseName} serviceUuid: ` + data.serviceUuid);
                hilog.info(domain, tag, `${caseName} characteristicUuid: ` + data.characteristicUuid);
                hilog.info(domain, tag, `${caseName} descriptorUuid: ` + data.descriptorUuid);
                hilog.info(domain, tag, `${caseName} descriptorValue: ` + JSON.stringify(data.descriptorValue));
                expect(typeof data.serviceUuid === 'string').assertTrue();
                expect(typeof data.characteristicUuid === 'string').assertTrue();
                expect(typeof data.descriptorUuid === 'string').assertTrue();
                expect(data.descriptorValue instanceof ArrayBuffer).assertTrue();
            } catch (err) {
                hilog.error(domain, tag, `${caseName} errCode:` + err.code + `,errMessage:` + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, `${caseName} api is not support`);
                    expect(err.code === 801).assertTrue();
                } else {
                    expect(Number(err.code) === 401).assertTrue();
                }
            }
            hilog.info(domain, tag, `${caseName} test end`);
            done();
        })

        /**
         * @tc.number  bleStartScanTest_001
         * @tc.name    bleStartScanTest_001
         * @tc.desc    test startScan with errorCode 2902050(此用例需最后执行)
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("bleStartScanTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let arrayBuffer = new ArrayBuffer(8);
            let scanFilter: ble.ScanFilter = {
                deviceId: "00:11:22:33:44:55",
                name: "bleStartScanTest_001",
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
                await bleScanner!.startScan([scanFilter]).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                await Utils.msSleep(500);
                await bleScanner!.startScan([scanFilter]).then(() => {
                    hilog.info(domain, tag, 'bleScanner startScan success');
                });
                expect().assertFail();
            } catch (err) {
                hilog.error(domain, tag, "bleStartScanTest_001, errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2902050);
                }
            }
            await Utils.msSleep(300);
            await bleScanner!.stopScan().then(() => {
                hilog.info(domain, tag, 'stopstop bleScanner stopScan success')
            });
            done();
        })
    })
}