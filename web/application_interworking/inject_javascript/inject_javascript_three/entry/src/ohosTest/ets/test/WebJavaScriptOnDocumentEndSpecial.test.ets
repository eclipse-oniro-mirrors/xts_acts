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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsWebJavaScriptOnDocumentEndSpecial() {

  describe('ActsWebJavaScriptOnDocumentEndSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptOnDocumentEndSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebJavaScriptOnDocumentEndSpecial state success ' + JSON.stringify(pages));
        if (!("WebJavaScriptOnDocumentEndSpecial" == pages.name)) {
          console.info('get WebJavaScriptOnDocumentEndSpecial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebJavaScriptOnDocumentEndSpecial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebJavaScriptOnDocumentEndSpecial page error: ' + err);
      }
      await waitForComponent("WebJavaScriptOnDocumentEndSpecialButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebJavaScriptOnDocumentEndSpecial beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebJavaScriptOnDocumentEndSpecial afterEach start');
      done();
    })

    /**
     * @tc.name   testWebJavaScriptOnDocumentEndSetNull
     * @tc.number SUB_ACE_WEB_JAVASCRIPTONDOCUMENTEND_NULL_API_0001
     * @tc.desc   test javaScriptOnDocumentEnd set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptOnDocumentEndSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentEndSetNull", 149)
      Utils.registerBaseEvent('testWebJavaScriptOnDocumentEndSetNull', true, 25112603, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptOnDocumentEndSpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebJavaScriptOnDocumentEndSetUndefined
     * @tc.number SUB_ACE_WEB_JAVASCRIPTONDOCUMENTEND_UNDEFINED_API_0001
     * @tc.desc   test javaScriptOnDocumentEnd set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptOnDocumentEndSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentEndSetUndefined", 149)
      Utils.registerBaseEvent('testWebJavaScriptOnDocumentEndSetUndefined', true, 25112604, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptOnDocumentEndSpecialButton', 10, '');
    })

  })
}
