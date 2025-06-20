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
const TAG: string = 'BtBleTestTag';
const Domain: number = 0x0000;
const INVALID_ADVERTISING_ID = 2902055;

function getAdvertisingParams() {
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
    interval: 150,
    txPower: 0,
    connectable: true,
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
  };
  let advResponse: ble.AdvertiseData = {
    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
    manufactureData: [manufactureDataUnit],
    serviceData: [serviceDataUnit],
  };
  let advertisingParams: ble.AdvertisingParams = {
    advertisingSettings: setting,
    advertisingData: advData,
    advertisingResponse: advResponse,
    duration: 0,
  }
  return advertisingParams;
}

export default function btBleNopUiJsunit() {
  describe('btBleNopUiJsunit', () => {

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
     * @tc.number: testStopAdvertisingNop
     * @tc.name: testStopAdvertising
     * @tc.desc: test stopAdvertising by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStopAdvertisingNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let advHandle = 0xFF;
        await ble.stopAdvertising(advHandle);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `stopAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
    /**
     * @tc.number: testStopAdvertisingAsyncCallbackNop
     * @tc.name: testStopAdvertising
     * @tc.desc: test stopAdvertising by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStopAdvertisingAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let advHandle = 0xFF;
      let functionStopAdvertising = async () => {
        return new Promise<void>((resolve, reject) => {
          ble.stopAdvertising(advHandle, (error) => {
            if (error) {
              reject(error)
            } else {
              resolve();
            }
          });
        })
      }
      try {
        await functionStopAdvertising();
        hilog.info(Domain, TAG, `callback stopAdvertising`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `callback stopAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
    /**
     * @tc.number: testEnableAdvertisingNop
     * @tc.name: testEnableAdvertising
     * @tc.desc: test enableAdvertising by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testEnableAdvertisingNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let advHandle = 0xFF;
        let advertisingDisableParams: ble.AdvertisingDisableParams = {
          advertisingId: advHandle
        };
        await ble.enableAdvertising(advertisingDisableParams);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `Promise enableAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(INVALID_ADVERTISING_ID)
      }
      done();
    })
    /**
     * @tc.number: testEnableAdvertisingAsyncCallbackNop
     * @tc.name: testEnableAdvertising
     * @tc.desc: test enableAdvertising by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testEnableAdvertisingAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let advHandle = 0xFF;
      let advertisingDisableParams: ble.AdvertisingDisableParams = {
        advertisingId: advHandle
      };
      let functionEnableAdvertising = async () => {
        return new Promise<void>((resolve, reject) => {
          ble.enableAdvertising(advertisingDisableParams, (error) => {
            if (error) {
              reject(error)
            } else {
              resolve();
            }
          });
        })
      }
      try {
        await functionEnableAdvertising();
        hilog.info(Domain, TAG, `callback enableAdvertising without permission`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `callback enableAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
    /**
     * @tc.number: testStartAdvertisingNop
     * @tc.name: testStartAdvertising
     * @tc.desc: test startAdvertising by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStartAdvertisingNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let outAdvHandle = await ble.startAdvertising(getAdvertisingParams());
        hilog.info(Domain, TAG, `startAdvertising without permission ret: ${outAdvHandle}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `Promise startAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testStartAdvertisingAsyncCallbackNop
     * @tc.name: testStartAdvertising
     * @tc.desc: test startAdvertising by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStartAdvertisingAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let functionStartAdvertising = async () => {
        return new Promise<number>((resolve, reject) => {
          ble.startAdvertising(getAdvertisingParams(), (error, outAdvHandle: number) => {
            if (error) {
              reject(error)
            } else {
              resolve(outAdvHandle);
            }
          });
        })
      }
      try {
        let outAdvHandle = await functionStartAdvertising();
        hilog.info(Domain, TAG, `callback startAdvertising without permission ${outAdvHandle}`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `callback startAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testDisableAdvertisingNop
     * @tc.name: testDisableAdvertising
     * @tc.desc: test disableAdvertising by promise without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testDisableAdvertisingNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let advHandle = 0xFF;
        let advertisingDisableParams: ble.AdvertisingDisableParams = {
          advertisingId: advHandle
        };
        let outAdvHandle = await ble.disableAdvertising(advertisingDisableParams);
        hilog.info(Domain, TAG, `disableAdvertising ret: ${outAdvHandle}`);
        expect(true).assertFalse();
      } catch (e) {
        hilog.error(Domain, TAG, `Promise disableAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(Number(e.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
    /**
     * @tc.number: testDisableAdvertisingAsyncCallbackNop
     * @tc.name: testDisableAdvertising
     * @tc.desc: test disableAdvertising by async callback without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testDisableAdvertisingAsyncCallbackNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      let advHandle = 0xFF;
      let advertisingDisableParams: ble.AdvertisingDisableParams = {
        advertisingId: advHandle
      };
      let functionDisableAdvertising = async () => {
        return new Promise<void>((resolve, reject) => {
          ble.disableAdvertising(advertisingDisableParams, (error) => {
            if (error) {
              reject(error)
            } else {
              resolve();
            }
          });
        })
      }
      try {
        await functionDisableAdvertising();
        hilog.info(Domain, TAG, `callback disableAdvertising`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `callback disableAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
    /**
     * @tc.number: testStopBLEScanNop
     * @tc.name: testStopBLEScan
     * @tc.desc: test stopBLEScan without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStopBLEScanNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        ble.stopBLEScan();
        hilog.info(Domain, TAG, `stopBLEScan success without permission`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `stopBLEScan error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.number: testStartScanNop
     * @tc.name: testStartScan
     * @tc.desc: test startScan without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStartScanNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let bleScanner: ble.BleScanner = ble.createBleScanner();
        console.info('createBleScanner result:' + JSON.stringify(bleScanner));
        expect(true).assertEqual(bleScanner != null);
        await bleScanner.startScan([{}]).then(() => {
          console.info('[bluetooth_js] bleScanner startScan success');
        });
        hilog.info(Domain, TAG, `BleScanner.startScan success without permission`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `stopBLEScan error, error code is: ${error.code}, error message is: ${error.message}`);
        if (Number(error.code) == 801) {
          console.info("BleScanner.startScan is not support.");
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })

    /**
     * @tc.number: testStopScanNop
     * @tc.name: testStopScan
     * @tc.desc: test stopScan without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStopScanNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let bleScanner: ble.BleScanner = ble.createBleScanner();
        console.info('createBleScanner result:' + JSON.stringify(bleScanner));
        expect(true).assertEqual(bleScanner != null);
        await bleScanner.stopScan().then(() => {
          console.info('[bluetooth_js] bleScanner stopScan success');
        });
        hilog.info(Domain, TAG, `BleScanner.startScan success without permission`);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `stopBLEScan error, error code is: ${error.code}, error message is: ${error.message}`);
        if (Number(error.code) == 801) {
          console.info("BleScanner.stopScan is not support.");
          expect(true).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })

    /**
     * @tc.number: testGetConnectedBLEDevicesNop
     * @tc.name: testGetConnectedBLEDevices
     * @tc.desc: test getConnectedBLEDevices without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testGetConnectedBLEDevicesNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let bleDevices = ble.getConnectedBLEDevices();
        console.info('getConnectedBLEDevices result:' + JSON.stringify(bleDevices));
      } catch (error) {
        hilog.error(Domain, TAG, `getConnectedBLEDevices error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.number: testStartBleScanNop
     * @tc.name: testStartBleScan
     * @tc.desc: test startBLEScan without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStartBleScanNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        ble.startBLEScan([{}]);
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `startBLEScan error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.number: testStopAdvertisingNoParamNop
     * @tc.name: testStopAdvertising
     * @tc.desc: test stopAdvertising without permission
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it("testStopAdvertisingNoParamNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        ble.stopAdvertising();
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `stopAdvertising no param error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(INVALID_ADVERTISING_ID);
      }
      done();
    })
  })
}

