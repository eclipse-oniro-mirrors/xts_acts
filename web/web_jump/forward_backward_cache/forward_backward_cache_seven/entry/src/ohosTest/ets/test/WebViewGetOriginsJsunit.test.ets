/**
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webViewOnWindowNewJsunit() {
  describe('ActsAceWebViewGetOriginsJunitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewGetOrigins',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get onWindowNew state success ' + JSON.stringify(pages));
        if (!('WebViewGetOrigins' == pages.name)) {
          console.info('get WebViewGetOrigins state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push WebViewGetOrigins page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebViewGetOrigins page error: ' + err);
      }
      await waitForComponent('GetOriginsButton');
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
      console.info('onWindowNew beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebViewGetOrigins afterEach start');
      console.info('WebViewGetOrigins afterEach end');
      done();
    })

    /**
     * @tc.name   emitGetOrigins01
     * @tc.number SUB_ACE_BASIC_ETS_API_WEBVIEWGETORIGINS_0100
     * @tc.desc   test api GetOrigins promise mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetOrigins01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOrigins01', 137851)
        Utils.registerEvent('emitGetOrigins01', true, 20251016, done);
        sendEventByKey('GetOriginsButton', 10, '');
      })

    /**
     * @tc.name   emitGetOrigins02
     * @tc.number SUB_ACE_BASIC_ETS_API_WEBVIEWGETORIGINS_0200
     * @tc.desc   test api GetOrigins promise mode by load loacal html
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitGetOrigins02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitGetOrigins02', 137851)
        Utils.registerEvent('emitGetOrigins02', true, 20251017, done);
        sendEventByKey('GetOriginsButton', 10, '');
      })



  })
}