/**
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

import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebDownloadItemSetNullUndefinedTest() {
  describe('WebDownloadItemSetNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadItemSetNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebDownloadItemSetNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("WebDownloadItemSetNullUndefined" == pages.name)) {
          console.info("get WebDownloadItemSetNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDownloadItemSetNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDownloadItemSetNullUndefinedTest page error: " + err);
      }
      await waitForComponents('WebDownloadItemButton');
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

    afterEach(async (done: Function) => {
      console.info("WebDownloadItemSetNullUndefinedTest afterEach start");
      console.info("WebDownloadItemSetNullUndefinedTest afterEach end");
      done();
    })

    /**
     * @tc.name   testStartEmpty
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_START_0100
     * @tc.desc   test webDownloadItem start set ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartEmpty", 260312)
      Utils.registerBaseEvent("testStartEmpty", 'success', 26031201,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebDownloadItemButton');
    })

    /**
     * @tc.name   testStartNull
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_START_0200
     * @tc.desc   test webDownloadItem start set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartNull", 260312)
      Utils.registerBaseEvent("testStartNull", 'success', 26031202,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebDownloadItemButton');
    })

    /**
     * @tc.name   testStartUndefined
     * @tc.number SUB_WEB_WEBDOWNLOADITEM_START_0300
     * @tc.desc   test webDownloadItem start set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStartUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testStartUndefined", 260312)
      Utils.registerBaseEvent("testStartUndefined", 'success', 26031203,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebDownloadItemButton');
    })


  })
}