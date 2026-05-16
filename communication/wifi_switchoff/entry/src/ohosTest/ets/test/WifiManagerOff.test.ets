/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import wifiManager from '@ohos.wifiManager';
import common from '@ohos.bluetooth.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Driver,ON,} from '@ohos.UiTest';

let PERMISSION_TEXT: string = "允许";
let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
    "ssid": "publicTest",
    "bssid": "00:11:22:33:44:55",
    "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
    "preSharedKey": "",
    "isHiddenSsid": false,
    "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
};
function sleep(delay: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, delay));
}
async function tryToDisableWifi() {
  try {
    if (wifiManager.isWifiActive()) {
      console.info('[wifi_js] wifi turn on:' + JSON.stringify(wifiManager.isWifiActive()));
      wifiManager.disableWifi();
    } else {
      console.info('[wifi_js] wifi turn off:' + JSON.stringify(wifiManager.isWifiActive()));
    }
  } catch (error) {
    console.error('[wifi_js] switch error.code:' + JSON.stringify(error.code) + 'error.message:' +
      JSON.stringify(error.message));
  }
}

async function tryToEnableWifi() {
  try {
    if (wifiManager.isWifiActive()) {
      console.info('[wifi_js] wifi turn on:' + JSON.stringify(wifiManager.isWifiActive()));
    } else {
      console.info('[wifi_js] wifi turn off:' + JSON.stringify(wifiManager.isWifiActive()));
      wifiManager.enableWifi();
    }
  } catch (error) {
    console.error('[wifi_js] switch error.code:' + JSON.stringify(error.code) + 'error.message:' +
      JSON.stringify(error.message));
  }
}

async function clickRequestPermission(text: string) {
  console.info('[bluetooth_js] clickRequestPermission start');
  let driver = Driver.create();
  await driver.delayMs(3000);
  try {
    let button = await driver.findComponent(ON.text(text));
    await button.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info('[bluetooth_js] clickRequestPermission failed. ' + err);
  }
  try {
    let button1 = await driver.findComponent(ON.text(PERMISSION_TEXT));
    await button1.click();
    await driver.delayMs(3000);
    console.info('[bluetooth_js] click PERMISSION_TEXT end');
  } catch (err) {
    console.info('[bluetooth_js] click PERMISSION_TEXT failed. ' + err);
  }
}

export default function wifiManagerOffTest() {
  describe('wifiManagerOffTest', () => {
    beforeAll(async (done: Function) => {
      await clickRequestPermission(PERMISSION_TEXT);
      await sleep(2000);
      await tryToDisableWifi();
      console.info('beforeAll called')
      done();
    })
    beforeEach(async (done: Function) => {
      console.info('beforeEach called')
      done();
    })
    afterEach(() => {
      console.info('afterEach called')
    })
    afterAll(async (done: Function) => {
      console.info('afterAll start')
      await tryToEnableWifi();
      console.info('afterAll end')
      done();
    })
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0100
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0100
     * @tc.desc   Test removeCandidateConfig API Promise - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0100';
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.removeCandidateConfig(0);
          console.info(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0200
     * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Callback_2501001_001
     * @tc.desc   Test removeCandidateConfig API Callback - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0200';
        console.info(`${caseName} test start`);
        try {
          wifiManager.removeCandidateConfig(0, (err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect(Number(err.code) === 2501001).assertTrue();
            } else {
              console.log(`${caseName} get result success `, data);
              expect().assertFail();
            }
          });
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0300
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0300
     * @tc.desc   Test connectToCandidateConfig API - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0300';
        console.info(`${caseName} test start`);
        try {
          wifiManager.connectToCandidateConfig(0);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0400
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0400
     * @tc.desc   Test getLinkedInfo API Promise - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0400';
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getLinkedInfo();
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0500
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0500
     * @tc.desc   Test getLinkedInfo API Callback - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0500';
        console.info(`${caseName} test start`);
        try {
          wifiManager.getLinkedInfo((err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect(Number(err.code) === 2501001).assertTrue();
            } else {
              console.log(`${caseName} get result success`, data);
              expect().assertFail();
            }
          });
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0600
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0600
     * @tc.desc   Test removeDevice API - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0600';
        console.info(`${caseName} test start`);
        try {
          wifiManager.removeDevice(0);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0700
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0700
     * @tc.desc   Test getLinkedInfoSync API - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0700';
        console.info(`${caseName} test start`);
        try {
          wifiManager.getLinkedInfoSync();
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0800
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0800
     * @tc.desc   Test connectToNetwork API - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0800';
        console.info(`${caseName} test start`);
        try {
          wifiManager.connectToNetwork(0);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0900
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0900
     * @tc.desc   Test connectToCandidateConfigWithUserAction API Promise - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0900';
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.connectToCandidateConfigWithUserAction(0);
          console.info(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1000
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1000
     * @tc.desc   Test connectToCandidateConfigWithUserAction API Promise - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_0900';
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.addDeviceConfig(wifiDeviceConfig)
          console.info(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      })

    /**
     * @tc.name   SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1100
     * @tc.number SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1100
     * @tc.desc   Test getLinkedInfo API Callback - verify 2501001 error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'SUB_COMMUNICATION_WIFIMANAGER_SWITCHOFF_1100';
        console.info(`${caseName} test start`);
        try {
          wifiManager.addDeviceConfig(wifiDeviceConfig, (err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect(Number(err.code) === 2501001).assertTrue();
            } else {
              console.log(`${caseName} get result success`, data);
              expect().assertFail();
            }
          });
        } catch (error) {
          console.error("${caseName} error, errCode:" + error.code + ",errMessage:" + error.message);
          expect(Number(error.code) === 2501001).assertTrue();
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}