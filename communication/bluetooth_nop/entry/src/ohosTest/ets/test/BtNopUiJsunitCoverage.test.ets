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
import a2dp from '@ohos.bluetooth.a2dp';
import ble from '@ohos.bluetooth.ble';
import socket from '@ohos.bluetooth.socket';
import constant from '@ohos.bluetooth.constant';

const PERMISSION_DENIED_CODE = 201
const PARAM_ERROR_CODE = 401
const TAG: string = 'BtBleTestTag';
const Domain: number = 0x0000;
let a2dpSrc: a2dp.A2dpSourceProfile;
let gattServer: ble.GattServer;
let device: ble.GattClientDevice;


function sleep(delay: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay))
}

export default function btNopUiJsunitCoverageTest() {
  describe('btNopUiJsunitCoverageTest', () => {
    beforeAll(async (done: Function) => {
      a2dpSrc = a2dp.createA2dpSrcProfile();
      gattServer = ble.createGattServer();
      device = ble.createGattClientDevice('00:11:22:33:44:55');
      console.info('beforeAll a2dp createA2dpSrcProfile and ble createGattServer and createGattClientDevice');
      done();
    });
    beforeEach(() => {
      console.info('beforeEach');
    });
    afterEach(() => {
      console.info('afterEach');
    });
    afterAll(() => {
      console.info('afterAll');
    });

    /**
     * @tc.name   testGetPlayingState201Nop
     * @tc.number testGetPlayingState201Nop
     * @tc.desc   getPlayingState interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetPlayingState201Nop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state = a2dpSrc.getPlayingState('00:11:22:33:44:55');
        console.info('[bt_arkts] getPlayingState success without permission');
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG,
          `getPlayingState error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testGetConnectionState201Nop
     * @tc.number testGetConnectionState201Nop
     * @tc.desc   getConnectionState interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetConnectionState201Nop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let a2dpSrc = a2dp.createA2dpSrcProfile(); // 以a2dp举例
        let state: constant.ProfileConnectionState = a2dpSrc.getConnectionState('00:11:22:33:44:55');
        console.info('[bt_arkts] getConnectionState success without permission');
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG,
          `getConnectionState error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testStartAdvertisingNoParamNop
     * @tc.number testStartAdvertisingNoParamNop
     * @tc.desc   startAdvertising interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartAdvertisingNoParamNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let manufactureValueBuffer = new Uint8Array(4);
        let setting: ble.AdvertiseSetting = {
          interval: 150,
          txPower: 0,
          connectable: true,
        };
        let advData: ble.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [],
          serviceData: [],
        };
        ble.startAdvertising(setting, advData);
        console.info('[bt_arkts] startAdvertising success without permission');
        expect(true).assertFalse();
      } catch (error) {
        hilog.error(Domain, TAG,
          `startAdvertising error, error code is: ${error.code}, error message is: ${error.message}`);
        expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
      }
      done();
    })

    /**
     * @tc.name   testStartAdvertisingWithCallbackNop
     * @tc.number testStartAdvertisingWithCallbackNop
     * @tc.desc   startAdvertising with callback interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartAdvertisingWithCallbackNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let manufactureValueBuffer = new Uint8Array(4);
        let setting: ble.AdvertiseSetting = {
          interval: 150,
          txPower: 0,
          connectable: true,
        };
        let advData: ble.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [],
          serviceData: [],
        };
        let advertisingParams: ble.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          duration: 0,
        }
        let functionStartAdvertising = async () => {
          return new Promise<number>((resolve, reject) => {
            ble.startAdvertising(advertisingParams, (error, advId: number) => {
              if (error) {
                reject(error)
              } else {
                resolve(advId);
              }
            });
          })
        }
        try {
          await functionStartAdvertising();
          console.info('[bt_arkts] startAdvertising callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `startAdvertising callback error, error code is: ${error.code}, error message is: ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testStartAdvertisingWithPromiseNop
     * @tc.number testStartAdvertisingWithPromiseNop
     * @tc.desc   startAdvertising with promise interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStartAdvertisingWithPromiseNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let setting: ble.AdvertiseSetting = {
          interval: 150,
          txPower: 0,
          connectable: true,
        };
        let advData: ble.AdvertiseData = {
          serviceUuids: ["00001888-0000-1000-8000-00805f9b34fb"],
          manufactureData: [],
          serviceData: [],
        };
        let advertisingParams: ble.AdvertisingParams = {
          advertisingSettings: setting,
          advertisingData: advData,
          duration: 0,
        }
        try {
          await ble.startAdvertising(advertisingParams);
          console.info('[bt_arkts] startAdvertising promise success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `startAdvertising promise error, error code is: ${error.code}, error message is: ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })



    /**
     * @tc.name   testStopAdvertisingWithCallbackNop
     * @tc.number testStopAdvertisingWithCallbackNop
     * @tc.desc   stopAdvertising with callback interface 201/2902055 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingWithCallbackNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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
          console.info('[bt_arkts] stopAdvertising callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `stopAdvertising callback error, error code is: ${error.code}, error message is: ${error.message}`);
          if (Number(error.code) == 2902055) {
            console.info('[bt_arkts] stopAdvertising callback returns invalid advertising id');
            expect(Number(error.code)).assertEqual(2902055);
          } else {
            expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })

    /**
     * @tc.name   testStopAdvertisingWithPromiseNop
     * @tc.number testStopAdvertisingWithPromiseNop
     * @tc.desc   stopAdvertising with promise interface 201/2902055 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testStopAdvertisingWithPromiseNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let advHandle = 0xFF;
        try {
          await ble.stopAdvertising(advHandle);
          console.info('[bt_arkts] stopAdvertising promise success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `stopAdvertising promise error, error code is: ${error.code}, error message is: ${error.message}`);
          if (Number(error.code) == 2902055) {
            console.info('[bt_arkts] stopAdvertising promise returns invalid advertising id');
            expect(Number(error.code)).assertEqual(2902055);
          } else {
            expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
          }
        }
        done();
      })


    /**
     * @tc.name   testGetDeviceNameCallbackNop
     * @tc.number testGetDeviceNameCallbackNop
     * @tc.desc   getDeviceName callback interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetDeviceNameCallbackNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let functionGetDeviceName = async () => {
          return new Promise<string>((resolve, reject) => {
            device.getDeviceName((error, name) => {
              if (error) {
                reject(error);
              } else {
                resolve(name);
              }
            });
          })
        }
        try {
          await functionGetDeviceName();
          console.info('[bt_arkts] getDeviceName callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `getDeviceName callback error, error code is: ${error.code}, error message is: ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })

    /**
     * @tc.name   testGetDeviceNamePromiseNop
     * @tc.number testGetDeviceNamePromiseNop
     * @tc.desc   getDeviceName promise interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetDeviceNamePromiseNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          await device.getDeviceName();
          console.info('[bt_arkts] getDeviceName promise success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `getDeviceName promise error, error code is: ${error.code}, error message is: ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })



    /**
     * @tc.name   testSppConnectCallbackNop
     * @tc.number testSppConnectCallbackNop
     * @tc.desc   sppConnect callback interface 201 error code test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSppConnectCallbackNop", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let deviceId = "00:11:22:33:44:55";
        let sppOptions: socket.SppOptions = {
          uuid: "00001888-0000-1000-8000-00805f9b34fb",
          secure: false,
          type: socket.SppType.SPP_RFCOMM
        };
        let functionSppConnect = async () => {
          return new Promise<number>((resolve, reject) => {
            socket.sppConnect(deviceId, sppOptions, (error, clientSocket) => {
              if (error) {
                reject(error);
              } else {
                resolve(clientSocket);
              }
            });
          })
        }
        try {
          await functionSppConnect();
          console.info('[bt_arkts] sppConnect callback success without permission');
          expect(true).assertFalse();
        } catch (error) {
          hilog.error(Domain, TAG,
            `sppConnect callback error, error code is: ${error.code}, error message is: ${error.message}`);
          expect(Number(error.code)).assertEqual(PERMISSION_DENIED_CODE);
        }
        done();
      })
  })
}