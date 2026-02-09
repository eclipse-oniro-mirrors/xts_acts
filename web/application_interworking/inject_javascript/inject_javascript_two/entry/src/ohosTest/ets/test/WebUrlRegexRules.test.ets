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
import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebUrlRegexRules() {

  describe('ActsWebUrlRegexRulesTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUrlRegexRules',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebUrlRegexRules state success ' + JSON.stringify(pages));
        if (!("WebUrlRegexRules" == pages.name)) {
          console.info('get WebUrlRegexRules state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebUrlRegexRules page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebUrlRegexRules page error: ' + err);
      }
      await driver.waitForComponent(ON.id("UrlRegexRules"),10000);
      console.log('waitForComponent UrlRegexRules==>');
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
      console.info('WebUrlRegexRules beforeEach start');
      done();
    })


    /**
     * @tc.name   testUrlRegexRules001
     * @tc.number SUB_WEB_URLREGEXRULES_0100
     * @tc.desc   test runJavaScriptOnHeadEnd UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRules001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules001", 251224)
        Utils.registerBaseEvent("testUrlRegexRules001", 'scriptHead:http urlRegexRules ok', 25122401, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules002
     * @tc.number SUB_WEB_URLREGEXRULES_0200
     * @tc.desc   test runJavaScriptOnDocumentStart UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRules002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules002", 251224)
        Utils.registerBaseEvent("testUrlRegexRules002", 'scriptDOMStart:http urlRegexRules ok', 25122402, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules003
     * @tc.number SUB_WEB_URLREGEXRULES_0300
     * @tc.desc   test runJavaScriptOnDocumentEnd UrlRegexRules ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUrlRegexRules003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules003", 251224)
        Utils.registerBaseEvent("testUrlRegexRules003", 'scriptDOMEnd:http urlRegexRules ok', 25122403, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules004
     * @tc.number SUB_WEB_URLREGEXRULES_0400
     * @tc.desc   test UrlRegexRules empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRules004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules004", 251224)
        Utils.registerBaseEvent("testUrlRegexRules004", 'no match', 25122404, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules005
     * @tc.number SUB_WEB_URLREGEXRULES_0500
     * @tc.desc   test UrlRegexRules secondLevelDomain empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRules005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules005", 251224)
        Utils.registerBaseEvent("testUrlRegexRules005", 'no match', 25122405, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules006
     * @tc.number SUB_WEB_URLREGEXRULES_0600
     * @tc.desc   test UrlRegexRules rule empty no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRules006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules006", 251224)
        Utils.registerBaseEvent("testUrlRegexRules006", 'no match', 25122406, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules007
     * @tc.number SUB_WEB_URLREGEXRULES_0700
     * @tc.desc   test UrlRegexRules secondLevelDomain rule empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRules007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules007", 251224)
        Utils.registerBaseEvent("testUrlRegexRules007", 'no match', 25122407, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })


    /**
     * @tc.name   testUrlRegexRules008
     * @tc.number SUB_WEB_URLREGEXRULES_0800
     * @tc.desc   test UrlRegexRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlRegexRules008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules008", 251224)
        Utils.registerBaseEvent("testUrlRegexRules008", 'NdkJsBridge;NdkJsBridge;NdkJsBridge;', 25122408, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules009
     * @tc.number SUB_WEB_URLREGEXRULES_0900
     * @tc.desc   test UrlRegexRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlRegexRules009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules009", 251224)
        Utils.registerBaseEvent("testUrlRegexRules009", 'NdkAsyncJsBridge;NdkAsyncJsBridge;NdkAsyncJsBridge;', 25122409, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules010
     * @tc.number SUB_WEB_URLREGEXRULES_1000
     * @tc.desc   test UrlRegexRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlRegexRules010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules010", 251224)
        Utils.registerBaseEvent("testUrlRegexRules010", 'NdkJsBridgeEx;NdkJsBridgeEx;NdkJsBridgeEx;', 25122410, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

    /**
     * @tc.name   testUrlRegexRules011
     * @tc.number SUB_WEB_URLREGEXRULES_1100
     * @tc.desc   test UrlRegexRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUrlRegexRules011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRules011", 251224)
        Utils.registerBaseEvent("testUrlRegexRules011", 'NdkAsyncJsBridgeEx;NdkAsyncJsBridgeEx;NdkAsyncJsBridgeEx;', 25122411, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRules', 10, '');
    })

  })
}