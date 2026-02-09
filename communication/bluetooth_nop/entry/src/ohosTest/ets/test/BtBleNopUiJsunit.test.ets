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
import partnerAgent from '@ohos.FusionConnectivity.partnerAgent';
import common from '@ohos.bluetooth.common';
import hid from '@ohos.bluetooth.hid';
const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const OPERATION_FAILED_CODE = 2900099
const TAG: string = 'BtBleTestTag';
const Domain: number = 0x0000;
const INVALID_ADVERTISING_ID = 2902055;
let PERMISSION_TEXT:string = "允许";
let OPEN_BT_TEXT:string = "开启";
let device:ble.GattClientDevice;
let gattServer: ble.GattServer;
let hidDevice: hid.HidDeviceProfile;
let btAddr: common.BluetoothAddress = {
  "address": "11:22:33:44:55:66",
  "addressType": common.BluetoothAddressType.REAL,
};
let deviceAddress: partnerAgent.PartnerDeviceAddress = {
  "bluetoothAddress": btAddr,
};
let deviceId = "00:11:22:33:44:55";
let deviceCapability: partnerAgent.DeviceCapability = {
  "supportBR": true,
  "supportBleAdvertiser": true,
};
let businessCapability: partnerAgent.BusinessCapability = {
  "supportMediaControl": true,
  "supportTelephonyControl": true,
};
let partnerAgentExtensionAbilityName: string = "testAbilityName";

let phyValue: ble.PhyValue = {
  txPhy : ble.BlePhy.BLE_PHY_1M,
  rxPhy : ble.BlePhy.BLE_PHY_2M,
  phyMode : ble.CodedPhyMode.BLE_PHY_CODED_S2,
};

function sleep(delay : number) : Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay))
}
function onReceiveEvent_boolean(data : boolean){
    console.info('[bluetooth_js]hid registerHidDevice result'+ JSON.stringify(data));
    expect(data).assertTrue();
}
function onReceiveEvent_value(data : ble.PhyValue){
    console.info('bluetooth PhyValue txPhy = ' + JSON.stringify(data));
}
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
function getAdvertisingParams2() {
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
    manufactureData: [],
    serviceData: [],
    advertiseName: "testName",
  };
  let advResponse: ble.AdvertiseData = {
    serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
    manufactureData: [],
    serviceData: [],
    advertiseName: "testName",
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
    beforeAll(async (done : Function) =>  {
      device = ble.createGattClientDevice('00:11:22:33:44:55');
      console.info('[bt_arkts] client readPhy success');
      gattServer = ble.createGattServer();
      console.info('[bt_arkts] client readPhy success');
      done();
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
     * @tc.name   testStopAdvertisingNop
     * @tc.number testStopAdvertisingNop
     * @tc.desc   test stopAdvertising by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStopAdvertisingAsyncCallbackNop
     * @tc.number testStopAdvertisingAsyncCallbackNop
     * @tc.desc   test stopAdvertising by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testEnableAdvertisingNop
     * @tc.number testEnableAdvertisingNop
     * @tc.desc   test enableAdvertising by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testEnableAdvertisingAsyncCallbackNop
     * @tc.number testEnableAdvertisingAsyncCallbackNop
     * @tc.desc   test enableAdvertising by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStartAdvertisingNop
     * @tc.number testStartAdvertisingNop
     * @tc.desc   test startAdvertising by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStartAdvertising1Nop
     * @tc.number testStartAdvertising1Nop
     * @tc.desc   test startAdvertising1 by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
         it("testStartAdvertising1Nop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
          try {
            let outAdvHandle = await ble.startAdvertising(getAdvertisingParams2());
            hilog.info(Domain, TAG, `startAdvertising without permission ret: ${outAdvHandle}`);
            expect(true).assertFalse();
          } catch (e) {
            hilog.error(Domain, TAG, `Promise startAdvertising error, error code is: ${e.code}, error message is: ${e.message}`);
            expect(Number(e.code)).assertEqual(PERMISSION_DENIED_CODE);
          }
          done();
        })
    /**
     * @tc.name   testStartAdvertisingAsyncCallbackNop
     * @tc.number testStartAdvertisingAsyncCallbackNop
     * @tc.desc   test startAdvertising by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testDisableAdvertisingNop
     * @tc.number testDisableAdvertisingNop
     * @tc.desc   test disableAdvertising by promise without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testDisableAdvertisingAsyncCallbackNop
     * @tc.number testDisableAdvertisingAsyncCallbackNop
     * @tc.desc   test disableAdvertising by async callback without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStopBLEScanNop
     * @tc.number testStopBLEScanNop
     * @tc.desc   test stopBLEScan without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStartScanNop
     * @tc.number testStartScanNop
     * @tc.desc   test startScan without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStopScanNop
     * @tc.number testStopScanNop
     * @tc.desc   test stopScan without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testGetConnectedBLEDevicesNop
     * @tc.number testGetConnectedBLEDevicesNop
     * @tc.desc   test getConnectedBLEDevices without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetConnectedBLEDevicesNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let bleDevices = ble.getConnectedBLEDevices();
        console.info('getConnectedBLEDevices result:' + JSON.stringify(bleDevices));
      } catch (error) {
        hilog.error(Domain, TAG, `getConnectedBLEDevices error, error code is: ${error.code}, error message is: ${error.message}`);
        if (Number(error.code) == 801) {
          console.info("getConnectedBLEDevices is not support.");
          expect(Number(error.code) == 801).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })

    /**
     * @tc.name   testStartBleScanNop
     * @tc.number testStartBleScanNop
     * @tc.desc   test startBLEScan without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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
     * @tc.name   testStopAdvertisingNoParamNop
     * @tc.number testStopAdvertisingNoParamNop
     * @tc.desc   test stopAdvertising without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testGetConnectedBLEDevicesBleProfileNop
     * @tc.number testGetConnectedBLEDevicesBleProfileNop
     * @tc.desc   test getConnectedBLEDevices BleProfile without permission
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL0
     */
    it("testGetConnectedBLEDevicesBleProfileNop", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async (done: Function) => {
      try {
        let bleDevices = ble.getConnectedBLEDevices(ble.BleProfile.GATT);
        console.info('getConnectedBLEDevices BleProfile result:' + JSON.stringify(bleDevices));
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG, `getConnectedBLEDevices BleProfile error, error code is: ${error.code}, error message is: ${error.message}`);
        if (Number(error.code) == 801) {
          console.info("getConnectedBLEDevices is not support.");
          expect(Number(error.code) == 801).assertTrue();
        } else {
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
      }
      done();
    })

    /**
     * @tc.name   testGATTSERVER_GETCONNECTEDSTATE_NOP
     * @tc.number testGATTSERVER_GETCONNECTEDSTATE_NOP
     * @tc.desc   20251113API22用例覆盖GattServer-getConnectedState without permission .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGATTSERVER_GETCONNECTEDSTATE_NOP', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        let return_status: ble.ProfileConnectionState = gattServer.getConnectedState('01:02:00:02:03:01');
        console.info('[bt_arkts]get status is' + JSON.stringify(return_status))
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts]server ProfileConnectionState 0100 is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGATTCLIENTDEVICE_GETCONNECTEDSTATE_NOP
     * @tc.number testGATTCLIENTDEVICE_GETCONNECTEDSTATE_NOP
     * @tc.desc   20251113API22用例覆盖GattClientDevice-getConnectedState without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGATTCLIENTDEVICE_GETCONNECTEDSTATE_NOP', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        let return_status=device.getConnectedState();
        console.info('[bt_arkts] client ProfileConnectionState 0100 is' + JSON.stringify(return_status))
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts]getConnectedState status is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0100
     * @tc.desc   Test server readPhy without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        await gattServer.readPhy(deviceId);
        console.info('[bt_arkts] server readPhy is success')
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts] server readPhy is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0200
     * @tc.desc   Test server setPhy  without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
      it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_S_NOP_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        let deviceId = "00:11:22:33:44:55";
        await gattServer.setPhy(deviceId , phyValue);
        console.info('[bt_arkts]server setPhy is success')
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts]server setPhy  is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })


    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0100
     * @tc.desc   Test client readPhy without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0100', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        await device.readPhy();
        console.info('[bt_arkts]client readPhy is fail success')
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts]client readPhy is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0200
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0200
     * @tc.desc   Test readPhy without permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLE_C_NOP_0200', TestType.Method | Size.MEDIUMTEST | Level.LEVEL0, async (done : Function) =>  {
      try {
        await device.setPhy(phyValue);
        console.info('[bt_arkts] client readPhy success');
        expect().assertFail();
      } catch (error) {
        console.error(`[bt_arkts]readPhy status is failed, code is ${error.code},message is ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })


  })
}

