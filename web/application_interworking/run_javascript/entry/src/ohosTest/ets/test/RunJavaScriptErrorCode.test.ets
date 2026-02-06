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

import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function runJavaScriptErrorCode() {

  describe('runJavaScriptErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/runJavaScriptErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get runJavaScriptErrorCode state success ' + JSON.stringify(pages));
        if (!('runJavaScriptErrorCode' == pages.name)) {
          console.info('get runJavaScriptErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push runJavaScriptErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push runJavaScriptErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('runJavaScriptPromiseErrorCodeButton'),10000);
      console.log('waitForComponent runJavaScriptPromiseErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('runJavaScriptErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('runJavaScriptErrorCode afterEach start');
      done();
    })

    /*
     * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_PROMISE_ERRORCODE_0100
     * @tc.name       : testRunJavaScriptPromiseErrorCode001
     * @tc.desc       : test runJavaScript promise error code 401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRunJavaScriptPromiseErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptPromiseErrorCode001', 171220);
      Utils.registerBaseEvent('testRunJavaScriptPromiseErrorCode001', '401', 171230, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptPromiseErrorCodeButton', 10, '');
    })

    /*
     * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_CALLBACK_ERRORCODE_0100
     * @tc.name       : testRunJavaScriptCallbackErrorCode001
     * @tc.desc       : test runJavaScript callback error code 401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRunJavaScriptCallbackErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptCallbackErrorCode001', 171220);
      Utils.registerBaseEvent('testRunJavaScriptCallbackErrorCode001', '401', 171240, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptPromiseErrorCodeButton', 10, '');
    })
  })
}
