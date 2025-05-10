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
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebViewIncognitoMode1() {
  describe('ActsAceWebViewIncognitoMode1', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewIncognitoMode1',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info('get webViewIncognitoMode1 state success ' + JSON.stringify(pages));
        if (!('webViewIncognitoMode1' == pages.name)) {
          console.info('get webViewIncognitoMode1 state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info('push webViewIncognitoMode1 state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewIncognitoMode1 page error:' + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(1000);
      done();
    })



    /*
     *@tc.number SUB_ACE_WEB_INCOGNITOMODE_API_0005
     *@tc.name testWebViewClearAllCookiesSyncIncognito
     *@tc.desc test clearAllCookiesSync incognito
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewClearAllCookiesSyncIncognito', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitWebViewIncognitoMode05'
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent('testWebViewIncognitoMode05', 'success', 8023, done);
      sendEventByKey('webViewIncognitoModeButton1', 10, '');
    })


  })
}
