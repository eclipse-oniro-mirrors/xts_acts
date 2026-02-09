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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsWebRunJavaScriptOnDocumentEndSetUndefinedOrNullTest() {

  describe('RunJavaScriptOnDocumentEndSetUndefinedOrNullTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnDocumentEndSetUndefinedOrNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebRunJavaScriptOnDocumentEndSetUndefinedOrNull state success ' + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnDocumentEndSetUndefinedOrNull" == pages.name)) {
          console.info('get WebRunJavaScriptOnDocumentEndSetUndefinedOrNull state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebRunJavaScriptOnDocumentEndSetUndefinedOrNull page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebRunJavaScriptOnDocumentEndSetUndefinedOrNull page error: ' + err);
      }
      await waitForComponent("RunJavaScriptOnDocumentEndSetUndefinedOrNull");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebRunJavaScriptOnDocumentEndSetUndefinedOrNull beforeEach start');
      done();
    })


    /**
     * @tc.name   testRunJavaScriptOnDocumentEndSetUndefined
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_SetUndefined
     * @tc.desc   test runJavaScriptOnDocumentEnd set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptOnDocumentEndSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptOnDocumentEndSetUndefined", 2511251)
      Utils.registerBaseEvent('testRunJavaScriptOnDocumentEndSetUndefined', '"test msg"', 25112511, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('RunJavaScriptOnDocumentEndSetUndefinedOrNull', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptOnDocumentEndSetNull
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_SetNull
     * @tc.desc   test runJavaScriptOnDocumentEnd set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptOnDocumentEndSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptOnDocumentEndSetNull", 2511251)
      Utils.registerBaseEvent('testRunJavaScriptOnDocumentEndSetNull', '"test msg"', 25112512, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('RunJavaScriptOnDocumentEndSetUndefinedOrNull', 10, '');
    })

  })
}
