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
let gattServerDevice: ble.GattServer | undefined;
let g_context: common.UIAbilityContext;

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

let advResponse: ble.AdvertiseData = {
    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
    manufactureData: [manufactureDataUnit],
    serviceData: [serviceDataUnit]
};

export default function bluetoothBleCallbackTest() {

    describe("bluetoothBleCallbackTest", (): void => {
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
            gattClientDevice = ble.createGattClientDevice("00:11:22:33:44:55");
            gattServerDevice = ble.createGattServer();
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
         * @tc.number  startAdvertisingTest_callback_002
         * @tc.name    startAdvertisingTest_callback_002
         * @tc.desc    startAdvertisingTest_callback_002
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("startAdvertisingTest_callback_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            hilog.error(domain, tag, "========================================1");
            let startAdvertisingCallback = () => {
                return new Promise<int>((resolve,reject) => {
                    ble.startAdvertising(advertisingParams, (err: BusinessError|null, data: int|undefined)=> {
                        try {
                            if (err) {
                                hilog.error(domain, tag, "========================================2");
                                hilog.info(domain, tag, 'startAdvertising failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.error(domain, tag, "========================================3");
                                hilog.info(domain, tag, 'startAdvertising value:'+JSON.stringify(data));
                                if (data != undefined) {
                                    resolve(data);
                                }
                            }
                        } catch (err) {
                            hilog.error(domain, tag, "========================================4");
                            err = err as BusinessError;
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                hilog.error(domain, tag, "========================================5");
                await startAdvertisingCallback().then((outAdvHandle) => {
                    hilog.info(domain, tag, "startAdvertising return outAdvHandle: " + outAdvHandle);
                });
                ble.stopAdvertising();
                hilog.error(domain, tag, "========================================6");
            } catch (err) {
                hilog.error(domain, tag, "========================================7");
                err = err as BusinessError;
                hilog.error(domain, tag, "startAdvertisingTest_callback_002 get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  notifyCharacteristicChangedTest_callback
         * @tc.name    notifyCharacteristicChangedTest_callback
         * @tc.desc    notifyCharacteristicChangedTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("notifyCharacteristicChangedTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            let notifyCharacteristicChangedCallback = () => {
                return new Promise<void>((resolve,reject) => {
                    gattServerDevice!.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacter, (err: BusinessError|null, data)=> {
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
                            hilog.info(domain, tag, "11111111111111111111111111111111111111111");
                        } catch (err) {
                            err = err as BusinessError;
                            hilog.info(domain, tag, "2222222222222222222222222222222222222222222222");
                            hilog.info(domain, tag, 'use callback api get err:' + JSON.stringify(err));
                        }
                    });
                });
            }
            try {
                hilog.info(domain, tag, "333333333333333333333333333333333333333");
                await notifyCharacteristicChangedCallback().then(() => {
                    hilog.info(domain, tag, "notifyCharacteristicChanged callback successful");
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.info(domain, tag, "44444444444444444444444444444444444444444");
                hilog.error(domain, tag, "notifyCharacteristicChanged callback errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  getDeviceNameTest_callback
         * @tc.name    getDeviceNameTest_callback
         * @tc.desc    getDeviceNameTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("getDeviceNameTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            } catch (err) {
                err = err as BusinessError;
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
         * @tc.number  enableAdvertisingTest_callback
         * @tc.name    enableAdvertisingTest_callback
         * @tc.desc    enableAdvertisingTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("enableAdvertisingTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                        } catch (err) {
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
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "enableAdvertisingTest_callback, errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  setCharacteristicChangeIndicationTest_callback
         * @tc.name    setCharacteristicChangeIndicationTest_callback
         * @tc.desc    setCharacteristicChangeIndicationTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("setCharacteristicChangeIndicationTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            let gattProperties: ble.GattProperties = {
                write: false,
                writeNoResponse: false,
                read: false,
                notify: false,
                indicate: false,
                broadcast: false,
                authenticatedSignedWrite: false,
                extendedProperties: false
            };
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
            let characteristic: ble.BLECharacteristic = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue: arrayBufferC, descriptors: descriptors,
                properties: gattProperties, characteristicValueHandle: 0, permissions: gattPermissions
            };
            let setCharacteristicChangeIndicationCallback = () => {
                return new Promise<void>((resolve,reject) => {
                    gattClientDevice!.setCharacteristicChangeIndication(characteristic, false, (err: BusinessError|null, data)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'setCharacteristicChangeIndication failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'setCharacteristicChangeIndication value:'+JSON.stringify(data));
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
                await setCharacteristicChangeIndicationCallback().then(() => {
                    hilog.info(domain, tag, "setCharacteristicChangeIndication callback successful");
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "setCharacteristicChangeIndication callback get errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  readDescriptorValueTest_callback
         * @tc.name    readDescriptorValueTest_callback
         * @tc.desc    readDescriptorValueTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("readDescriptorValueTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let bufferDesc = new ArrayBuffer(8);
            let descV = new Uint8Array(bufferDesc);
            descV[0] = 11;
            let descriptor: ble.BLEDescriptor = {
                serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
                descriptorValue: bufferDesc
            };
            let readDescriptorValueCallback = () => {
                return new Promise<ble.BLEDescriptor>((resolve,reject) => {
                    gattClientDevice!.readDescriptorValue(descriptor, (err: BusinessError|null, data: ble.BLEDescriptor|undefined)=> {
                        try {
                            if (err) {
                                hilog.info(domain, tag, 'readDescriptorValueCallback failed' + JSON.stringify(err));
                                reject(err);
                            } else {
                                hilog.info(domain, tag, 'readDescriptorValueCallback value:'+JSON.stringify(data));
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
                await readDescriptorValueCallback().then((data) => {
                    hilog.info(domain, tag, "readDescriptorValue callback successful");
                });
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "readDescriptorValue callback errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  readCharacteristicValueTest_callback
         * @tc.name    readCharacteristicValueTest_callback
         * @tc.desc    readCharacteristicValueTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("readCharacteristicValueTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "readCharacteristicValue callback errCode:" + err.code + ",errMessage:" + err.message);
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
         * @tc.number  disableAdvertisingTest_callback
         * @tc.name    disableAdvertisingTest_callback
         * @tc.desc    disableAdvertisingTest_callback
         * @tc.level   Level 0
         * @tc.type    Function
         * @tc.size    MEDIUMTEST
         */
        it("disableAdvertisingTest_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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
                        } catch (err) {
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
            } catch (err) {
                err = err as BusinessError;
                hilog.error(domain, tag, "disableAdvertising callback errCode:" + err.code + ",errMessage:" + err.message);
                if (err.code === 801) {
                    hilog.info(domain, tag, 'api is not support');
                    expect(true).assertEqual(err.code === 801);
                } else {
                    expect(Number(err.code)).assertEqual(2902055);
                }
            }
            done();
        })

    })
}