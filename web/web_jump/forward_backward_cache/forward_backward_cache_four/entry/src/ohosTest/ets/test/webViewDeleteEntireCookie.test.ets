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
import { describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';


export default function webViewDeleteEntireCookie() {
  describe('ActsAceWebDevWebViewDeleteEntireCookieTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewDeleteEntireCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewDeleteEntireCookie state success ' + JSON.stringify(pages));
        if (!('webViewDeleteEntireCookie' == pages.name)) {
          console.info('get webViewDeleteEntireCookie state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewDeleteEntireCookie page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewDeleteEntireCookie page error: ' + err);
      }
      await waitForComponent('webViewDeleteEntireCookie');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webViewDeleteEntireCookie beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webViewDeleteEntireCookie afterEach start');
      done();
    })

    /**
     * @tc.name   testDeleteEntireCookie
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWCOOKIE_API_0200
     * @tc.desc   test interface of existCookie after deleteentirecookie
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteEntireCookie', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitDeleteEntireCookie', 137350);
      Utils.registerEvent('emitDeleteEntireCookie', false, 137360, done);
      sendEventByKey('webViewDeleteEntireCookie', 10, '');
    })
  })
}