/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import connection from '@ohos.bluetooth.connection';
import hilog from '@ohos.hilog';
import constant from '@ohos.bluetooth.constant';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtConnectionTestTag';
const Domain: number = 0x0000;

export default function btConnectionNopUiJsunit() {
  describe('btConnectionNopUiJsunit', () => {

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number: testIsBluetoothDiscoveringNop
     * @tc.name: testIsBluetoothDiscovering
     * @tc.desc: test isBluetoothDiscovering without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testIsBluetoothDiscoveringNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let isBluetoothDiscovering =  connection.isBluetoothDiscovering();
        hilog.info(Domain, TAG, `isBluetoothDiscovering without permission ret = ${isBluetoothDiscovering}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `isBluetoothDiscovering error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testSetDevicePinCodeAsyncCallbackNop
     * @tc.name: testSetDevicePinCode
     * @tc.desc: test setDevicePinCode by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testSetDevicePinCodeAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let functionSetDevicePinCode = async ()=>{
          return new Promise<void>((resolve,reject)=>{
            connection.setDevicePinCode('11:22:33:44:55:66', '12345', (error) => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
        await functionSetDevicePinCode();
        hilog.info(Domain, TAG, `callback setDevicePinCode`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `callback setDevicePinCode error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testGetBluetoothScanModeNop
     * @tc.name: testGetBluetoothScanMode
     * @tc.desc: test getBluetoothScanMode without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testGetBluetoothScanModeNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let scanMode = connection.getBluetoothScanMode();
        hilog.info(Domain, TAG, `getBluetoothScanMode without permission ${scanMode}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getBluetoothScanMode error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testSetBluetoothScanModeNop
     * @tc.name: testSetBluetoothScanMode
     * @tc.desc: test setBluetoothScanMode without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testSetBluetoothScanModeNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        connection.setBluetoothScanMode(connection.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,100);
        hilog.info(Domain, TAG, `setBluetoothScanMode without permission success`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `setBluetoothScanMode error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testGetLocalNameNop
     * @tc.name: testGetLocalName
     * @tc.desc: test getLocalName without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testGetLocalNameNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let name = connection.getLocalName();
        hilog.info(Domain, TAG, `getLocalName name = ${name}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getLocalName error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testGetProfileConnectionStateNop
     * @tc.name: testGetProfileConnectionState
     * @tc.desc: test getProfileConnectionState without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testGetProfileConnectionStateNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state = connection.getProfileConnectionState(constant.ProfileId.PROFILE_A2DP_SOURCE);
        hilog.info(Domain, TAG, `getProfileConnectionState without permission name = ${state}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getProfileConnectionState error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testGetRemoteDeviceClassNop
     * @tc.name: testGetRemoteDeviceClass
     * @tc.desc: test getRemoteDeviceClass without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testGetRemoteDeviceClassNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let deviceClass = connection.getRemoteDeviceClass('11:22:33:44:55:66');
        hilog.info(Domain, TAG, `getRemoteDeviceClass without permission name = ${JSON.stringify(deviceClass)}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteDeviceClass error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testSetDevicePinCodeNop
     * @tc.name: testSetDevicePinCode
     * @tc.desc: test setDevicePinCode by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testSetDevicePinCodeNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.setDevicePinCode('11:22:33:44:55:66','12345');
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `setDevicePinCode error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
  })
}
