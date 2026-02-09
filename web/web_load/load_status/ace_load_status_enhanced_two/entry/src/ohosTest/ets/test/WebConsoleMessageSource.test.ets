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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebConsoleMessageSource() {
  describe('WebConsoleMessageSource', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebConsoleMessageSource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebConsoleMessageSource state success " + JSON.stringify(pages));
        if (!("WebConsoleMessageSource" == pages.name)) {
          console.info("get WebConsoleMessageSource state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push WebConsoleMessageSource page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebConsoleMessageSource page error: " + err);
      }
      await waitForComponent("WebConsoleMessageGetSourceButton");
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
     * @tc.name   testWebConsoleMessageGetSource0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_0001
     * @tc.desc   test onConsole GetSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageGetSource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitWebConsoleMessageGetSource0001", 119060)
      Utils.registerBaseEvent('testWebConsoleMessageGetSource0001', ConsoleMessageSource.CONSOLE_API, 119100, done,
      (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebConsoleMessageGetSourceButton', 10, '');
    })

    /**
     * @tc.name   testWebConsoleMessageSourceXML0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_XML_0001
     * @tc.desc   test onConsole GetSource XML
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceXML0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.XML).assertEqual(0);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceJAVASCRIPT0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_JAVASCRIPT_0001
     * @tc.desc   test onConsole GetSource JAVASCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceJAVASCRIPT0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.JAVASCRIPT).assertEqual(1);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceNETWORK0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_NETWORK_0001
     * @tc.desc   test onConsole GetSource NETWORK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceNETWORK0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.NETWORK).assertEqual(2);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceCONSOLE_API0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_CONSOLE_API_0001
     * @tc.desc   test onConsole GetSource CONSOLE_API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceCONSOLE_API0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.CONSOLE_API).assertEqual(3);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceSTORAGE0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_STORAGE_0001
     * @tc.desc   test onConsole GetSource STORAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceSTORAGE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.STORAGE).assertEqual(4);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceRENDERING0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_RENDERING_0001
     * @tc.desc   test onConsole GetSource RENDERING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceRENDERING0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.RENDERING).assertEqual(5);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceSECURITY0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_SECURITY_0001
     * @tc.desc   test onConsole GetSource SECURITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceSECURITY0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.SECURITY).assertEqual(6);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceOTHER0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_OTHER_0001
     * @tc.desc   test onConsole GetSource OTHER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceOTHER0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.OTHER).assertEqual(7);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceDEPRECATION0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_DEPRECATION_0001
     * @tc.desc   test onConsole GetSource DEPRECATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceDEPRECATION0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.DEPRECATION).assertEqual(8);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceWORKER0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_WORKER_0001
     * @tc.desc   test onConsole GetSource WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceWORKER0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.WORKER).assertEqual(9);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceVIOLATION0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_VIOLATION_0001
     * @tc.desc   test onConsole GetSource VIOLATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceVIOLATION0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.VIOLATION).assertEqual(10);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceINTERVENTION0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_INTERVENTION_0001
     * @tc.desc   test onConsole GetSource INTERVENTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceINTERVENTION0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.INTERVENTION).assertEqual(11);
      done()
    })

    /**
     * @tc.name   testWebConsoleMessageSourceRECOMMENDATION0001
     * @tc.number SUB_WEB_ConsoleMessageGetSource_RECOMMENDATION_0001
     * @tc.desc   test onConsole GetSource RECOMMENDATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebConsoleMessageSourceRECOMMENDATION0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(ConsoleMessageSource.RECOMMENDATION).assertEqual(12);
      done()
    })


  })
}
