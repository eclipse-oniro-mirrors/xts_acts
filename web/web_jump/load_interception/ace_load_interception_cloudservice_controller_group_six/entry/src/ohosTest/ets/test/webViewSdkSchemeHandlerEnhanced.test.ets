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

import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsAceWebViewSdkSchemeHandlerEnhanced() {
  describe('ActsAceWebViewSdkSchemeHandlerEnhanced', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewSdkSchemeHandlerEnhanced',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewSdkSchemeHandlerEnhanced state success ' + JSON.stringify(pages));
        if (!('webViewSdkSchemeHandlerEnhanced' == pages.name)) {
          console.info('get webViewSdkSchemeHandlerEnhanced state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webViewSdkSchemeHandlerEnhanced state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewSdkSchemeHandlerEnhanced page error:' + err);
      }
      await waitForComponent('webViewSdkSchemeHandlerEnhanced');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("ActsAceWebViewSdkSchemeHandlerEnhanced beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("ActsAceWebViewSdkSchemeHandlerEnhanced afterEach start");
      done();
    })

    /**
     * @tc.name   testWebViewSdkSchemeHandler_setUrl_null
     * @tc.number SUB_ACE_WEB_SdkSchemeHandler_setUrl_null_API_0001
     * @tc.desc   test SdkSchemeHandler_setUrl_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewSdkSchemeHandler_setUrl_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent('emitWebViewSdkSchemeHandler_setUrl_null', 134300);
        Utils.registerEvent('emitWebViewSdkSchemeHandler_setUrl_null', true, 134310, done);
        sendEventByKey('webViewSdkSchemeHandlerEnhanced', 10, '');
    })
  })
}
