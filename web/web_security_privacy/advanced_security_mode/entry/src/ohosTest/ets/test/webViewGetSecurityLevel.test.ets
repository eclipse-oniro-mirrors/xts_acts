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
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest';
import wifiMg from '@ohos.wifiManager';

// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewGetSecurityLevel() {
  describe('ActsAceWebViewGetSecurityLevel', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewGetSecurityLevel',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewGetSecurityLevel state success " + JSON.stringify(pages));
        if (!("webViewGetSecurityLevel" == pages.name)) {
          console.info("get webViewGetSecurityLevel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewGetSecurityLevel state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewGetSecurityLevel page error:" + err);
      }
      await waitForComponent("webViewGetSecurityLevelButton");
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
      done();
    })


    /**
     * @tc.name   testWebViewGetSecurityLevelNone
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0001
     * @tc.desc   test getSecurityLevel NONE 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetSecurityLevelNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewGetSecurityLevel01"
      Utils.emitEvent(emitKey, 160030);
      Utils.registerEvent("testWebViewGetSecurityLevelNone", 'success', 160040, done);
      sendEventByKey('webViewGetSecurityLevelButton', 10, '');
    })

    /**
     * @tc.name   testWebViewGetSecurityLevelSecure
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0002
     * @tc.desc   test getSecurityLevel SECURE 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewGetSecurityLevelSecure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebViewGetSecurityLevelSecure", 160030);
      Utils.registerBaseEvent('testWebViewGetSecurityLevelSecure', 1, 25102202, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(1)
        })
      sendEventByKey('webViewGetSecurityLevelButton', 10, '');
    })

    /**
     * @tc.name   testWebViewGetSecurityLevelWarning
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0003
     * @tc.desc   test getSecurityLevel WARNING 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewGetSecurityLevelWarning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebViewGetSecurityLevelWarning", 160030);
      Utils.registerBaseEvent('testWebViewGetSecurityLevelWarning', 2, 25102203, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(2)
        })
      sendEventByKey('webViewGetSecurityLevelButton', 10, '');
    })

    /**
     * @tc.name   testWebViewGetSecurityLevelDangerous
     * @tc.number SUB_ACE_WEB_GETSECURITYLEVEL_API_0004
     * @tc.desc   test getSecurityLevel DANGEROUS 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebViewGetSecurityLevelDangerous', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebViewGetSecurityLevelDangerous", 160030);
      Utils.registerBaseEvent('testWebViewGetSecurityLevelDangerous', 3, 25102204, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(3)
        })
      sendEventByKey('webViewGetSecurityLevelButton', 10, '');
    })

  })
}
