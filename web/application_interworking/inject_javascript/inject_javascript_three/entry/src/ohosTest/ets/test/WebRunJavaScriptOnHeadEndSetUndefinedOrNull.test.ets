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
export default function ActsWebRunJavaScriptHeadEndSetUndefinedOrNullTest() {

  describe('RunJavaScriptOnHeadEndSetUndefinedOrNullTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnHeadEndSetUndefinedOrNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebRunJavaScriptOnHeadEndSetUndefinedOrNull state success ' + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnHeadEndSetUndefinedOrNull" == pages.name)) {
          console.info('get WebRunJavaScriptOnHeadEndSetUndefinedOrNull state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebRunJavaScriptOnHeadEndSetUndefinedOrNull page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebRunJavaScriptOnHeadEndSetUndefinedOrNull page error: ' + err);
      }
      await waitForComponent("RunJavaScriptOnHeadEndSetUndefinedOrNull");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebRunJavaScriptOnHeadEndSetUndefinedOrNull beforeEach start');
      done();
    })

    /**
     * @tc.name   testRunJavaScriptOnHeadEndSetUndefined
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONHEADEND_SetUndefined
     * @tc.desc   test runJavaScriptOnHeadEnd set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptOnHeadEndSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptOnHeadEndSetUndefined", 2511253)
      Utils.registerBaseEvent('testRunJavaScriptOnHeadEndSetUndefined', '"msg"', 25112531, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RunJavaScriptOnHeadEndSetUndefinedOrNull', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptOnHeadEndSetNull
     * @tc.number SUB_ACE_WEB_RUNJAVASCRIPTONHEADEND_SetNull
     * @tc.desc   test runJavaScriptOnHeadEnd set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptOnHeadEndSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptOnHeadEndSetNull", 2511253)
      Utils.registerBaseEvent('testRunJavaScriptOnHeadEndSetNull', '"msg"', 25112532, done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('RunJavaScriptOnHeadEndSetUndefinedOrNull', 10, '');
    })


  })
}
