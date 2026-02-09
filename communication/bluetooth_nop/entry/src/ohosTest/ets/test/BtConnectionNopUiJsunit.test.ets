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
import access from '@ohos.bluetooth.access';

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
     * @tc.name   testIsBluetoothDiscoveringNop
     * @tc.number testIsBluetoothDiscoveringNop
     * @tc.desc   test isBluetoothDiscovering without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testSetDevicePinCodeAsyncCallbackNop
     * @tc.number testSetDevicePinCodeAsyncCallbackNop
     * @tc.desc   test setDevicePinCode by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testGetBluetoothScanModeNop
     * @tc.number testGetBluetoothScanModeNop
     * @tc.desc   test getBluetoothScanMode without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testSetBluetoothScanModeNop
     * @tc.number testSetBluetoothScanModeNop
     * @tc.desc   test setBluetoothScanMode without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testGetLocalNameNop
     * @tc.number testGetLocalNameNop
     * @tc.desc   test getLocalName without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testGetProfileConnectionStateNop
     * @tc.number testGetProfileConnectionStateNop
     * @tc.desc   test getProfileConnectionState without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testSetDevicePinCodeNop
     * @tc.number testSetDevicePinCodeNop
     * @tc.desc   test setDevicePinCode by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   testEnableBluetoothNop
     * @tc.number testEnableBluetoothNop
     * @tc.desc   test enableBluetooth without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testEnableBluetoothNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        access.enableBluetooth();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `enableBluetooth error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testDisableBluetoothNop
     * @tc.number testDisableBluetoothNop
     * @tc.desc   test disableBluetooth without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testDisableBluetoothNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        access.disableBluetooth();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `disableBluetooth error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetPersistentDeviceIdsNop
     * @tc.number testGetPersistentDeviceIdsNop
     * @tc.desc   test getPersistentDeviceIds without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetPersistentDeviceIdsNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let macs: string[] = access.getPersistentDeviceIds();
        console.info("[bluetooth_js]getPersistentDeviceIds result:" + JSON.stringify(macs));
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getPersistentDeviceIds error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
            console.info("getPersistentDeviceIds is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testIsValidRandomDeviceIdNop
     * @tc.number testIsValidRandomDeviceIdNop
     * @tc.desc   test isValidRandomDeviceId without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testIsValidRandomDeviceIdNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let isValidRandom = access.isValidRandomDeviceId("00:00:00:00:00:00");
        console.info("[bluetooth_js]isValidRandomDeviceId result:" + JSON.stringify(isValidRandom));
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `isValidRandomDeviceId error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
            console.info("isValidRandomDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testAddPersistentDeviceIdNop
     * @tc.number testAddPersistentDeviceIdNop
     * @tc.desc   test addPersistentDeviceId without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testAddPersistentDeviceIdNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await access.addPersistentDeviceId('00:00:00:00:00:00').then(() => {
          console.info('[bluetooth_js] addPersistentDeviceId success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `addPersistentDeviceId error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
            console.info("addPersistentDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testDeletePersistentDeviceIdNop
     * @tc.number testDeletePersistentDeviceIdNop
     * @tc.desc   test deletePersistentDeviceId without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testDeletePersistentDeviceIdNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await access.deletePersistentDeviceId('00:00:00:00:00:00').then(() => {
          console.info('[bluetooth_js] deletePersistentDeviceId success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `deletePersistentDeviceId error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
            console.info("deletePersistentDeviceId is not support");
            expect(true).assertTrue();
        }else {
            expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testConnectAllowedProfilesCallbackNop
     * @tc.number testConnectAllowedProfilesCallbackNop
     * @tc.desc   test connectAllowedProfiles callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testConnectAllowedProfilesCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let functionConnectAllowedProfiles = async ()=>{
          return new Promise<void>((resolve, reject)=>{
            connection.connectAllowedProfiles('00:11:22:33:44:55', (error) => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
        await functionConnectAllowedProfiles();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `connectAllowedProfiles callback error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
          console.info("[bluetooth_js]connectAllowedProfiles api is not support.");
          expect(true).assertTrue();
        } else {
          expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testConnectAllowedProfilesPromiseNop
     * @tc.number testConnectAllowedProfilesPromiseNop
     * @tc.desc   test connectAllowedProfiles promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testConnectAllowedProfilesPromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.connectAllowedProfiles('11:22:33:44:55:66').then(() => {
          console.info('[bluetooth_js] connectAllowedProfiles success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `connectAllowedProfiles promise error, error code is: ${e.code}, error message is: ${e.message}`);
        if (Number(e.code) == 801) {
          console.info("[bluetooth_js]connectAllowedProfiles api is not support.");
          expect(true).assertTrue();
        } else {
          expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })
    /**
     * @tc.name   testPairDeviceCallbackNop
     * @tc.number testPairDeviceCallbackNop
     * @tc.desc   test pairdevice callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testPairDeviceCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let functionPairDevice = async ()=>{
          return new Promise<void>((resolve, reject)=>{
            connection.pairDevice('00:11:22:33:44:55', (error) => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
        await functionPairDevice();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `pairDevice callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testPairDevicePromiseNop
     * @tc.number testPairDevicePromiseNop
     * @tc.desc   test pairdevice promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testPairDevicePromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.pairDevice('11:22:33:44:55:66').then(() => {
          console.info('[bluetooth_js] pairDevice success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `pairDevice promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRemoteDeviceNameNop
     * @tc.number testGetRemoteDeviceNameNop
     * @tc.desc   test getRemoteDeviceName without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRemoteDeviceNameNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let ret = connection.getRemoteDeviceName("00:00:00:00:00:00");
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteDeviceName error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRemoteDeviceNameAliasNop
     * @tc.number testGetRemoteDeviceNameAliasNop
     * @tc.desc   test getRemoteDeviceName without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRemoteDeviceNameAliasNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let ret = connection.getRemoteDeviceName("00:00:00:00:00:00", true);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteDeviceName error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetPairedDevicesNop
     * @tc.number testGetPairedDevicesNop
     * @tc.desc   test getPairedDevices without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetPairedDevicesNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let ret = connection.getPairedDevices();
      } catch (e) {
        hilog.error(Domain, TAG, `getPairedDevices error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(true).assertEqual(Number(e.code) == PERMISSION_DENIED_CODE || Number(e.code) == PARAM_ERROR_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetPairStateNop
     * @tc.number testGetPairStateNop
     * @tc.desc   test getPairState without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetPairStateNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state: connection.BondState = connection.getPairState("00:11:22:33:44:55");
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getPairState error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testSetDevicePairingConfirmationNop
     * @tc.number testSetDevicePairingConfirmationNop
     * @tc.desc   test setDevicePairingConfirmation without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testSetDevicePairingConfirmationNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        connection.setDevicePairingConfirmation("00:11:22:33:44:55", true);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `setDevicePairingConfirmation error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testStartBluetoothDiscoveryNop
     * @tc.number testStartBluetoothDiscoveryNop
     * @tc.desc   test startBluetoothDiscovery without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testStartBluetoothDiscoveryNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        connection.startBluetoothDiscovery();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `startBluetoothDiscovery error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testStopBluetoothDiscoveryNop
     * @tc.number testStopBluetoothDiscoveryNop
     * @tc.desc   test stopBluetoothDiscovery without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testStopBluetoothDiscoveryNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        connection.stopBluetoothDiscovery();
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `stopBluetoothDiscovery error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRemoteProfileUuidsCallbackNop
     * @tc.number testGetRemoteProfileUuidsCallbackNop
     * @tc.desc   test getRemoteProfileUuids callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRemoteProfileUuidsCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let functionGetRemoteProfileUuids = async ()=>{
          return new Promise<void>((resolve, reject)=>{
            connection.getRemoteProfileUuids('00:11:22:33:44:55', (error) => {
              if (error) {
                reject(error)
              } else {
                resolve();
              }
            });
          })
        }
        await functionGetRemoteProfileUuids();
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteProfileUuids callback error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(true).assertEqual(Number(e.code) == PERMISSION_DENIED_CODE || Number(e.code) == PARAM_ERROR_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRemoteProfileUuidsPromiseNop
     * @tc.number testGetRemoteProfileUuidsPromiseNop
     * @tc.desc   test getRemoteProfileUuids promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRemoteProfileUuidsPromiseNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.getRemoteProfileUuids('11:22:33:44:55:66').then(() => {
          console.info('[bluetooth_js] getRemoteProfileUuids success');
        });
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteProfileUuids promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(true).assertEqual(Number(e.code) == PERMISSION_DENIED_CODE || Number(e.code) == PARAM_ERROR_CODE);
      }
      done();
    })
    /**
     * @tc.name   testGetRemoteDeviceBatteryInfoNop
     * @tc.number testGetRemoteDeviceBatteryInfoNop
     * @tc.desc   test getRemoteDeviceBatteryInfo without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetRemoteDeviceBatteryInfoNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.getRemoteDeviceBatteryInfo('11:22:33:44:55:66').then(() => {
          console.info('[bluetooth_js] getRemoteDeviceBatteryInfo success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `getRemoteDeviceBatteryInfo promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   testSetRemoteDeviceNameNop
     * @tc.number testSetRemoteDeviceNameNop
     * @tc.desc   test setRemoteDeviceName without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testSetRemoteDeviceNameNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await connection.setRemoteDeviceName('11:22:33:44:55:66', 'RemoteDeviceName').then(() => {
          console.info('[bluetooth_js] setRemoteDeviceName success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `setRemoteDeviceName promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testDisableBluetoothAsyncNop
     * @tc.number testDisableBluetoothAsyncNop
     * @tc.desc   test disableBluetoothAsync without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testDisableBluetoothAsyncNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await access.disableBluetoothAsync().then(() => {
          console.info('[bluetooth_js] disableBluetoothAsync success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `disableBluetoothAsync promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testEnableBluetoothAsyncNop
     * @tc.number testEnableBluetoothAsyncNop
     * @tc.desc   test enableBluetoothAsync without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testEnableBluetoothAsyncNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        await access.enableBluetoothAsync().then(() => {
          console.info('[bluetooth_js] enableBluetoothAsync success');
        });
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `enableBluetoothAsync promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
        /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_NOP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_NOP_0100
     * @tc.desc   Test setLocalName api10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_NOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done : Function) => {
      try {
        connection.setLocalName('1111111111111111111');
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `setLocalName promise error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
  })
}
