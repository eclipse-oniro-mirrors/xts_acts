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

export default function ActsWebJavaScriptOnDocumentStartSpecial() {

  describe('ActsWebJavaScriptOnDocumentStartSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptOnDocumentStartSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebJavaScriptOnDocumentStartSpecial state success ' + JSON.stringify(pages));
        if (!("WebJavaScriptOnDocumentStartSpecial" == pages.name)) {
          console.info('get WebJavaScriptOnDocumentStartSpecial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebJavaScriptOnDocumentStartSpecial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebJavaScriptOnDocumentStartSpecial page error: ' + err);
      }
      await waitForComponent("WebJavaScriptOnDocumentStartSpecialButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebJavaScriptOnDocumentStartSpecial beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebJavaScriptOnDocumentStartSpecial afterEach start');
      done();
    })

    /**
     * @tc.name   testWebJavaScriptOnDocumentStartSetNull
     * @tc.number SUB_ACE_WEB_JAVASCRIPTONDOCUMENTSTART_NULL_API_0001
     * @tc.desc   test javaScriptOnDocumentStart set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptOnDocumentStartSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentStartSetNull", 148)
      Utils.registerBaseEvent('testWebJavaScriptOnDocumentStartSetNull', true, 25112601, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptOnDocumentStartSpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebJavaScriptOnDocumentStartSetUndefined
     * @tc.number SUB_ACE_WEB_JAVASCRIPTONDOCUMENTSTART_UNDEFINED_API_0001
     * @tc.desc   test javaScriptOnDocumentStart set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptOnDocumentStartSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptOnDocumentStartSetUndefined", 148)
      Utils.registerBaseEvent('testWebJavaScriptOnDocumentStartSetUndefined', true, 25112602, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptOnDocumentStartSpecialButton', 10, '');
    })

  })
}
