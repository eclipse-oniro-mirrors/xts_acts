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
     * @tc.number: testGattServerSendResponseNop
     * @tc.name: testSendResponse
     * @tc.desc: test gatt server sendResponse without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
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
     * @tc.number: testGattServerNotifyCharacteristicChangedNop
     * @tc.name: tesNotifyCharacteristicChanged
     * @tc.desc: test gatt server notifyCharacteristicChanged by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
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
     * @tc.number: testGattServerNotifyCharacteristicChangedAsyncCallbackNop
     * @tc.name: testNotifyCharacteristicChanged
     * @tc.desc: test gatt server notifyCharacteristicChanged by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
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
     * @tc.number: testGattServerCloseNop
     * @tc.name: testClose
     * @tc.desc: test gatt server close without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
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
  })
}