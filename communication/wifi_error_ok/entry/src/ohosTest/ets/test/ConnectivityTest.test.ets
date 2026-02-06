/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import wifindktest from 'libwifindk.so';
import wifiMg from '@ohos.wifiManager';

const KEY_CODE_EVENT_OK = 0;

export default function ConnectivityTest() {
  describe('ConnectivityTest', () => {

    /**
     * @tc.name   testConnectivityKitGetWifiStatus0100
     * @tc.number SUB_ConnectivityKit_GetWifiStatus_0100
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectivityKitGetWifiStatus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testConnectivityKitGetWifiStatus0100 start====");
          let result: number = wifindktest.GetWifiStatus();
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testConnectivityKitGetWifiStatus0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testConnectivityKitGetWifiStatus0101
     * @tc.number SUB_ConnectivityKit_GetWifiStatus_0101
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectivityKitGetWifiStatus0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testConnectivityKitGetWifiStatus0101 start====");
          let result: number = wifindktest.GetWifiStatus0101();
          console.info("====>testConnectivityKitGetWifiStatus0101 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testConnectivityKitGetWifiStatus0101 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testConnectivityKitGetWifiStatus0102
     * @tc.number SUB_ConnectivityKit_GetWifiStatus_0102
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectivityKitGetWifiStatus0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testConnectivityKitGetWifiStatus0102 start====");
          let result: number = wifindktest.GetWifiStatus0102();
          console.info("====>testConnectivityKitGetWifiStatus0102 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testConnectivityKitGetWifiStatus0102 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testConnectivityKitGetWifiStatus0103
     * @tc.number SUB_ConnectivityKit_GetWifiStatus_0103
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConnectivityKitGetWifiStatus0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testConnectivityKitGetWifiStatus0103 start====");
          let result: number = wifindktest.GetWifiStatus0103();
          console.info("====>testConnectivityKitGetWifiStatus0103 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testConnectivityKitGetWifiStatus0103 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0100
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0100
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0100 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0100();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0100 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0101
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0101
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0101 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0101();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0101 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0101 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0102
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0102
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0102 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0102();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0102 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0102 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0103
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0103
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0103 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0103();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0103 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0103 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0104
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0104
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0104 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0104();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0104 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0104 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0105
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0105
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0105 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0105();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0105 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0105 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0106
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0106
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0106 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0106();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0106 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0106 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0107
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0107
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0107 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0107();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0107 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0107 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0108
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0108
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0108 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0107();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0108 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0108 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0109
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0109
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0109 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0107();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0109 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0109 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   testCOMMUNICATION_BLUETOOTH_NAPI_0110
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_NAPI_0110
     * @tc.desc   testing OH_Wifi_IsWifiEnabled interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCOMMUNICATION_BLUETOOTH_NAPI_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0110 start====");
          let result: number = wifindktest.GetBluetoothSwitchState0100();
          console.info("====>testCOMMUNICATION_BLUETOOTH_NAPI_0110 start====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testCOMMUNICATION_BLUETOOTH_NAPI_0110 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0100
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0100
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0100 start====");
          let result: number = wifindktest.GetDeviceMacAddress0100();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0100 END====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0100 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0200
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0200
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0200 start====");
          let result: number = wifindktest.GetDeviceMacAddress0200();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0200 END====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0200 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0300
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0300
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0300 start====");
          let result: number = wifindktest.GetDeviceMacAddress0300();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0300 END ====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0300 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })

    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0400
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0400
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0400 start====");
          let result: number = wifindktest.GetDeviceMacAddress0400();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0400 END====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0400 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })

    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0500
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0500
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          wifiMg.disableWifi();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0500 start====");
          let result: number = wifindktest.GetDeviceMacAddress0500();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0500 END====" + result);
          expect(KEY_CODE_EVENT_OK).assertEqual(result);
          wifiMg.enableWifi();
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0500 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })

    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0600
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0600
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0600 start====");
          let result: number = wifindktest.GetDeviceMacAddress0600();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0600 END====" + result);
          expect(result).assertEqual(201);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0600 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0700
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0700
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0700 start====");
          let result: number = wifindktest.GetDeviceMacAddress0700();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0700 END====" + result);
          expect(result).assertEqual(801);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0700 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFI_NAPI_0800
     * @tc.number SUB_COMMUNICATION_WIFI_NAPI_0800
     * @tc.desc   testing OH_Wifi_GetDeviceMacAddress interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_COMMUNICATION_WIFI_NAPI_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0800 start====");
          let result: number = wifindktest.GetDeviceMacAddress0800();
          console.info("====>SUB_COMMUNICATION_WIFI_NAPI_0800 END====" + result);
          expect(result).assertEqual(2501000);
          done()
        } catch (err) {
          console.error("====>SUB_COMMUNICATION_WIFI_NAPI_0800 catch err: " + err);
          expect(false).assertEqual(KEY_CODE_EVENT_OK);
        }
      })
  
  })
}
