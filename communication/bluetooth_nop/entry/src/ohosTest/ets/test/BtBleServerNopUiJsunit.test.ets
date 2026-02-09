/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import ble from '@ohos.bluetooth.ble';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtBleServerTestTag';
const Domain: number = 0x0000;
const CONNECTION_NOT_ESTABLISHED = 2901003;

export default function btBleServerNopUiJsunit() {
  describe('btBleServerNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.name   testGattServerSendResponseNop
     * @tc.number testGattServerSendResponseNop
     * @tc.desc   test gatt server sendResponse without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerSendResponseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        /* send response */
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
        let gattServer: ble.GattServer = ble.createGattServer();
        gattServer.sendResponse(serverResponse);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattServer sendResponse error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGattServerNotifyCharacteristicChangedNop
     * @tc.number testGattServerNotifyCharacteristicChangedNop
     * @tc.desc   test gatt server notifyCharacteristicChanged by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerNotifyCharacteristicChangedNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
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
        let gattServer: ble.GattServer = ble.createGattServer();
        await gattServer.notifyCharacteristicChanged('3e:45:7f:cc:45:3f', notifyCharacter);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattServer notifyCharacteristicChanged error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGattServerNotifyCharacteristicChangedAsyncCallbackNop
     * @tc.number testGattServerNotifyCharacteristicChangedAsyncCallbackNop
     * @tc.desc   test gatt server notifyCharacteristicChanged by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerNotifyCharacteristicChangedAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let arrayBufferCCC = new ArrayBuffer(8);
      let cccValue = new Uint8Array(arrayBufferCCC);
      cccValue[0] = 1123;
      let notifyCharacter: ble.NotifyCharacteristic = {
        serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: arrayBufferCCC,
        confirm: true,
      };
      let functionNotifyCharacteristicChanged = async ()=>{
        return new Promise<void>((resolve,reject)=>{
          let gattServer: ble.GattServer = ble.createGattServer();
          gattServer.notifyCharacteristicChanged('3e:45:7f:cc:45:3f', notifyCharacter, (error) => {
            if (error) {
              reject(error)
            } else {
              resolve();
            }
          });
        })
      }
      try {
        await functionNotifyCharacteristicChanged();
        hilog.info(Domain, TAG, `callback gattServer notifyCharacteristicChanged`);
        expect(true).assertFalse();
      }catch (error){
        hilog.error(Domain, TAG, `callback gattServer notifyCharacteristicChanged error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGattServerCloseNop
     * @tc.number testGattServerCloseNop
     * @tc.desc   test gatt server close without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerCloseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattServer: ble.GattServer = ble.createGattServer();
        gattServer.close();
        hilog.info(Domain, TAG, `gattServer close success without permission`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattServer close error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGattServerAddServiceNop
     * @tc.number testGattServerAddServiceNop
     * @tc.desc   test gatt server addService without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerAddServiceNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let descriptors : Array<ble.BLEDescriptor> = [];
      let arrayBuffer = new ArrayBuffer(8);
      let descV = new Uint8Array(arrayBuffer);
      descV[0] = 11;
      let descriptor : ble.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
      descriptors[0] = descriptor;
      let characteristics : Array<ble.BLECharacteristic> = [];
      let arrayBufferC = new ArrayBuffer(8);
      let cccV = new Uint8Array(arrayBufferC);
      cccV[0] = 1;
      let characteristic : ble.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: arrayBufferC, descriptors:descriptors};
      characteristics[0] = characteristic;
      let gattService : ble.GattService = {
        serviceUuid:'00001810-0000-1000-8000-00805F9B34FB',
        isPrimary: false,
        characteristics:characteristics,
        includeServices:[]
      };
      try {
        let gattServer: ble.GattServer = ble.createGattServer();
        gattServer.addService(gattService);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattServer addService error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGattServerRemoveServiceNop
     * @tc.number testGattServerRemoveServiceNop
     * @tc.desc   test gatt server removeService without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattServerRemoveServiceNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattServer: ble.GattServer = ble.createGattServer();
        gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattServer removeService error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PARAM_ERROR_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientConnectNop
     * @tc.number testGattClientConnectNop
     * @tc.desc   test gatt client connect without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientConnectNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        gattClient.connect();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient connect error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientDisconnectNop
     * @tc.number testGattClientDisconnectNop
     * @tc.desc   test gatt client disconnect without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientDisconnectNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        gattClient.disconnect();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient disconnect error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientCloseNop
     * @tc.number testGattClientCloseNop
     * @tc.desc   test gatt client close without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientCloseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        gattClient.close();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient close error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientGetDeviceNameCallbackNop
     * @tc.number testGattClientGetDeviceNameCallbackNop
     * @tc.desc   test gatt client getDeviceName callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetDeviceNameCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let functionGetDeviceName = async ()=>{
          return new Promise<void>((resolve,reject)=>{
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getDeviceName(error => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
      try {
        await functionGetDeviceName();
        hilog.info(Domain, TAG, `callback gattClient getDeviceName`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getDeviceName callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientGetDeviceNamePromiseNop
     * @tc.number testGattClientGetDeviceNamePromiseNop
     * @tc.desc   test gatt client getDeviceName promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetDeviceNamePromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        await gattClient.getDeviceName();
        hilog.info(Domain, TAG, `promise gattClient getDeviceName`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getDeviceName promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientGetServicesCallbackNop
     * @tc.number testGattClientGetServicesCallbackNop
     * @tc.desc   test gatt client getServices callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetServicesCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let functionGetServices = async ()=>{
          return new Promise<void>((resolve,reject)=>{
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getServices(error => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
      try {
        await functionGetServices();
        hilog.info(Domain, TAG, `callback gattClient getServices`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getServices callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientGetServicesPromiseNop
     * @tc.number testGattClientGetServicesPromiseNop
     * @tc.desc   test gatt client getServices promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientGetServicesPromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        await gattClient.getServices();
        hilog.info(Domain, TAG, `promise gattClient getServices`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getServices promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientReadCharacteristicValueCallbackNop
     * @tc.number testGattClientReadCharacteristicValueCallbackNop
     * @tc.desc   test gatt client readCharacteristicValue callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientReadCharacteristicValueCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let descriptors :  Array<ble.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let descriptor : ble.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : ble.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors};
      let functionReadCharacteristicValue = async ()=>{
          return new Promise<void>((resolve,reject)=>{
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.readCharacteristicValue(characteristic, error => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
      try {
        await functionReadCharacteristicValue();
        hilog.info(Domain, TAG, `callback gattClient readCharacteristicValue`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient readCharacteristicValue callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PARAM_ERROR_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGattClientReadCharacteristicValuePromiseNop
     * @tc.number testGattClientReadCharacteristicValuePromiseNop
     * @tc.desc   test gatt client readCharacteristicValue promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGattClientReadCharacteristicValuePromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let descriptors :  Array<ble.BLEDescriptor> = [];
      let bufferDesc = new ArrayBuffer(8);
      let descV = new Uint8Array(bufferDesc);
      descV[0] = 11;
      let descriptor : ble.BLEDescriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002903-0000-1000-8000-00805F9B34FB', descriptorValue: bufferDesc};
      descriptors[0] = descriptor;

      let bufferCCC = new ArrayBuffer(8);
      let cccV = new Uint8Array(bufferCCC);
      cccV[0] = 1;
      let characteristic : ble.BLECharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        characteristicValue: bufferCCC, descriptors:descriptors};
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        await gattClient.readCharacteristicValue(characteristic);
        hilog.info(Domain, TAG, `promise gattClient readCharacteristicValue`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient readCharacteristicValue promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PARAM_ERROR_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRssiValueCallbackNop
     * @tc.number testGetRssiValueCallbackNop
     * @tc.desc   test gatt client getRssiValue callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRssiValueCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let functionGetRssiValue = async ()=>{
          return new Promise<void>((resolve,reject)=>{
            let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
            gattClient.getRssiValue(error => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
      try {
        await functionGetRssiValue();
        hilog.info(Domain, TAG, `callback gattClient getRssiValue`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getRssiValue callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(CONNECTION_NOT_ESTABLISHED);
      }
      done();
    })
    /**
     * @tc.name   testGetRssiValuePromiseNop
     * @tc.number testGetRssiValuePromiseNop
     * @tc.desc   test gatt client getRssiValue promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRssiValuePromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        await gattClient.getRssiValue();
        hilog.info(Domain, TAG, `promise gattClient getRssiValue`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient getRssiValue promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(CONNECTION_NOT_ESTABLISHED);
      }
      done();
    })

    /**
     * @tc.name   testSetBLEMtuSizeNop
     * @tc.number testSetBLEMtuSizeNop
     * @tc.desc   test gatt client setBLEMtuSize without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testSetBLEMtuSizeNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let gattClient: ble.GattClientDevice = ble.createGattClientDevice("00:11:00:11:00:11");
        gattClient.setBLEMtuSize(500);
        hilog.info(Domain, TAG, `gattClient setBLEMtuSize success`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `gattClient setBLEMtuSize error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(OPERATION_FAILED_CODE);
      }
      done();
    })
  })
}