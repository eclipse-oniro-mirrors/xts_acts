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

export default function ActsWebJavaScriptAccessSpecial() {

  describe('ActsWebJavaScriptAccessSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptAccessSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebJavaScriptAccessSpecial state success ' + JSON.stringify(pages));
        if (!("WebJavaScriptAccessSpecial" == pages.name)) {
          console.info('get WebJavaScriptAccessSpecial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebJavaScriptAccessSpecial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebJavaScriptAccessSpecial page error: ' + err);
      }
      await waitForComponent("WebJavaScriptAccessSpecialButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebJavaScriptAccessSpecial beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebJavaScriptAccessSpecial afterEach start');
      done();
    })

    /**
     * @tc.name   testWebJavaScriptAccessSetNull
     * @tc.number SUB_ACE_WEB_JAVASCRIPTACCESS_NULL_API_0001
     * @tc.desc   test javaScriptAccess set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptAccessSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptAccessSetNull", 151);
      Utils.registerBaseEvent('testWebJavaScriptAccessSetNull', 'null', 25112607, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptAccessSpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebJavaScriptAccessSetUndefined
     * @tc.number SUB_ACE_WEB_JAVASCRIPTACCESS_UNDEFINED_API_0001
     * @tc.desc   test javaScriptAccess set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptAccessSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptAccessSetUndefined", 151);
      Utils.registerBaseEvent('testWebJavaScriptAccessSetUndefined', 'null', 25112608, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptAccessSpecialButton', 10, '');
    })

  })
}
