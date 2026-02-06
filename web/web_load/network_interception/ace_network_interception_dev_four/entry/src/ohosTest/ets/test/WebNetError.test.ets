/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 202860;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebNetError() {

  describe('WebNetError', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNetError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNetError state success " + JSON.stringify(pages));
        if (!("WebNetError" == pages.name)) {
          console.info("get WebNetError state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebNetError page success");
        }
      } catch (err) {
        console.error("push WebNetError page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebSchemeHandlerResponse"), 10000);
      console.log("waitForComponent WebSchemeHandlerResponse");
      done()
    });

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
        if (data.chload >= 900 || data.rssi <= -80) {
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
     * @tc.name   WebNetErrorList_06000
     * @tc.number SUB_WEB_WEBNETERRORLIST_06000
     * @tc.desc   test WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebNetErrorList_06000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_06000", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("WebNetErrorList_06000", -131, 202870, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
      if (await Utils.waitForExist(() => isReturn, 'WebNetErrorList_06000' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   WebNetErrorList_07600
     * @tc.number SUB_WEB_WEBNETERRORLIST_07600
     * @tc.desc   test WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebNetErrorList_07600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_07600", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("WebNetErrorList_07600", -151, 202880, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
      if (await Utils.waitForExist(() => isReturn, 'WebNetErrorList_07600' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   WebNetErrorList_013600
     * @tc.number SUB_WEB_WEBNETERRORLIST_013600
     * @tc.desc   test WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebNetErrorList_013600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_013600", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("WebNetErrorList_013600", -328, 202890, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
      if (await Utils.waitForExist(() => isReturn, 'WebNetErrorList_013600' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   WebNetErrorList_014600
     * @tc.number SUB_WEB_WEBNETERRORLIST_014600
     * @tc.desc   test WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebNetErrorList_014600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_014600", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("WebNetErrorList_014600", -339, 202900, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
      if (await Utils.waitForExist(() => isReturn, 'WebNetErrorList_014600' + '_returnCheck', 1, 1000)) {
        done();
      }
    })


    /**
     * @tc.name   WebNetErrorList_020800
     * @tc.number SUB_WEB_WEBNETERRORLIST_020800
     * @tc.desc   test WebSchemeHandlerResponse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WebNetErrorList_020800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("WebNetErrorList_020800", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("WebNetErrorList_020800", -507, 202910, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "WebSchemeHandlerResponse");
      if (await Utils.waitForExist(() => isReturn, 'WebNetErrorList_020800' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
