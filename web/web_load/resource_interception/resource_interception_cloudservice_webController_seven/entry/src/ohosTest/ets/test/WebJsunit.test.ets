/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it , TestType, Size, Level , expect } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 201850;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   imageAccessFalse
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_027
     * @tc.desc   imageAccessFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitImageAccessFalse", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("imageAccessFalse",  "null", 201860, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'imageAccessFalse' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   imageAccessTrue
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_028
     * @tc.desc   imageAccessTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitImageAccessTrue", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("imageAccessTrue", '"load complete"', 201870, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'imageAccessTrue' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   onlineImageAccessFalse
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_029
     * @tc.desc   onlineImageAccessFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onlineImageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnlineImageAccessFalse", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("onlineImageAccessFalse",  "null", 201880, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'onlineImageAccessFalse' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   onlineImageAccessTrue
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_030
     * @tc.desc   onlineImageAccessTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onlineImageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnlineImageAccessTrue", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("onlineImageAccessTrue", '"load image complete"', 201890, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'onlineImageAccessTrue' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   cacheModeOnly
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_033
     * @tc.desc   cacheModeOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cacheModeOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnly", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("cacheModeOnly",  "cacheError", 201900, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'cacheModeOnly' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   cacheModeDefault
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_034
     * @tc.desc   cacheModeDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cacheModeDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeDefault", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("cacheModeDefault", '"index"', 201910, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'cacheModeDefault' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   mixedModeNone
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_035
     * @tc.desc   mixedModeNone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mixedModeNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeNone", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("mixedModeNone", true, 201920, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'mixedModeNone' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   mixedModeAll
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_036
     * @tc.desc   mixedModeAll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mixedModeAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeAll", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("mixedModeAll", 3, 201930, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'mixedModeAll' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}