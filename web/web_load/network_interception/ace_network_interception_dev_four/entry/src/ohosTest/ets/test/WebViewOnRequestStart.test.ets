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

const EVENT_ID_SET_EMIT_KEY = 202960;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewOnRequestStart() {

  describe('webViewOnRequestStart', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewOnRequestStart',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnRequestStart state success " + JSON.stringify(pages));
        if (!("OnRequestStart" == pages.name)) {
          console.info("get OnRequestStart state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push OnRequestStart page success");
        }
      } catch (err) {
        console.error("push OnRequestStart page error: " + err);
      }
      await driver.waitForComponent(ON.id("OnRequestStart"), 10000);
      console.log("waitForComponent OnRequestStart");
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
     * @tc.name   defaultOnRequestStart0100
     * @tc.number SUB_WEB_WEBDEAULTONREQUESTSTART_0100
     * @tc.desc   test WebdefaultOnRequestStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultOnRequestStart0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStart0100", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("defaultOnRequestStart0100", 'https://www.example.com/|GET||true|false|true|true', 202970, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "OnRequestStart");
      if (await Utils.waitForExist(() => isReturn, 'defaultOnRequestStart0100' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   defaultOnRequestStart0200
     * @tc.number SUB_WEB_WEBDEAULTONREQUESTSTART_0200
     * @tc.desc   test WebdefaultOnRequestStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('defaultOnRequestStart0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("defaultOnRequestStart0200", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent("defaultOnRequestStart0200", 'defaultOnRequestStart0200', 202980, () => { isReturn = 1 }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, "OnRequestStart");
      if (await Utils.waitForExist(() => isReturn, 'defaultOnRequestStart0200' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}
