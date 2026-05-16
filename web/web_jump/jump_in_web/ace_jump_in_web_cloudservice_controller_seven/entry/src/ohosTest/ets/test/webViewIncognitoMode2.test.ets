/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsAceWebViewIncognitoMode2() {
  describe('ActsAceWebViewIncognitoMode2', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewIncognitoMode2',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewIncognitoMode2 state success ' + JSON.stringify(pages));
        if (!('webViewIncognitoMode2' == pages.name)) {
          console.info('get webViewIncognitoMode2 state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewIncognitoMode2 state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewIncognitoMode2 page error:' + err);
      }
      await waitForComponent("webViewIncognitoModeButton2");
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
      done();
    })

    /**
     * @tc.name   testWebViewClearAllCookiesSyncNormal
     * @tc.number SUB_ACE_WEB_INCOGNITOMODE2_API_0006
     * @tc.desc   test clearAllCookiesSync normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewClearAllCookiesSyncNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewIncognitoMode06', 134250);
      Utils.registerEvent('emitWebViewIncognitoMode06', 'success', 134260, done);
      sendEventByKey('webViewIncognitoModeButton2', 10, '');
    })

  })
}
