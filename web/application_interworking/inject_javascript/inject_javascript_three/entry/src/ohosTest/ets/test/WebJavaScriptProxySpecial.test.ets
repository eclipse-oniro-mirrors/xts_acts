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

export default function ActsWebJavaScriptProxySpecial() {

  describe('ActsWebJavaScriptProxySpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebJavaScriptProxySpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebJavaScriptProxySpecial state success ' + JSON.stringify(pages));
        if (!("WebJavaScriptProxySpecial" == pages.name)) {
          console.info('get WebJavaScriptProxySpecial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebJavaScriptProxySpecial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebJavaScriptProxySpecial page error: ' + err);
      }
      await waitForComponent("WebJavaScriptProxySpecialButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebJavaScriptProxySpecial beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebJavaScriptProxySpecial afterEach start');
      done();
    })

    /**
     * @tc.name   testWebJavaScriptProxySetNull
     * @tc.number SUB_ACE_WEB_JAVASCRIPTPROXY_NULL_API_0001
     * @tc.desc   test javaScriptProxy set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptProxySetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptProxySetNull", 150)
      Utils.registerBaseEvent('testWebJavaScriptProxySetNull', 'null', 25112605, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptProxySpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebJavaScriptProxySetUndefined
     * @tc.number SUB_ACE_WEB_JAVASCRIPTPROXY_UNDEFINED_API_0001
     * @tc.desc   test javaScriptProxy set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebJavaScriptProxySetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebJavaScriptProxySetUndefined", 150)
      Utils.registerBaseEvent('testWebJavaScriptProxySetUndefined', 'null', 25112606, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebJavaScriptProxySpecialButton', 10, '');
    })

  })
}
