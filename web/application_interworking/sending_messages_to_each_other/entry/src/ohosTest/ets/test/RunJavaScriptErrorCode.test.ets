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

import { beforeAll, beforeEach, afterEach,describe, it, expect,TestType,Size,Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function runJavaScriptErrorCode() {

  describe('runJavaScriptErrorCodeTest', () => {

      beforeAll(async (done: Function) => {
        let options: router.RouterOptions = {
          url: 'testability/pages/runJavaScriptErrorCode'
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
        await Utils.waitForComponent(driver,'runJavaScriptErrorCodeButton');
        console.log('runJavaScriptErrorCodeButton waitForComponent===>')
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


    /**
     * @tc.name   testRunJavaScriptPromiseErrorCode001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_PROMISE_ERROR_CODE_0100
     * @tc.desc   test runJavaScript promise error code 17100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptPromiseErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptPromiseErrorCode001", 180210)
      Utils.registerBaseEvent("testWebMessageExtSetStringErrorCode001",17100003, 26031901, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptErrorCodeButton', 10, '');

    })
    /**
     * @tc.name   testRunJavaScriptCallbackErrorCode001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_CALLBACK_ERROR_CODE_0100
     * @tc.desc   test runJavaScript callback error code 17100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptCallbackErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptCallbackErrorCode001", 180210)
      Utils.registerBaseEvent("testRunJavaScriptCallbackErrorCode001",17100003, 26031902, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptErrorCodeButton', 10, '');

    })
    /**
     * @tc.name   testRunJavaScriptCallbackSetEmpty001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_CALLBACK_SET_EMPTY_API_0100
     * @tc.desc   test runJavaScript callback set empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptCallbackSetEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptCallbackSetEmpty001", 180210)
      Utils.registerBaseEvent("testRunJavaScriptCallbackSetEmpty001",'null', 26032501, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptErrorCodeButton', 10, '');
    })
    /**
     * @tc.name   testRunJavaScriptCallbackSetNull001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_CALLBACK_SET_NULL_API_0100
     * @tc.desc   test runJavaScript callback set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptCallbackSetNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptCallbackSetNull001", 180210)
      Utils.registerBaseEvent("testRunJavaScriptCallbackSetNull001",'401', 26032502, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptErrorCodeButton', 10, '');
    })
    /**
     * @tc.name   testRunJavaScriptCallbackSetUndefined001
     * @tc.number SUB_WEB_RUNJAVASCRIPT_CALLBACK_SET_UNDEFINED_API_0100
     * @tc.desc   test runJavaScript callback set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRunJavaScriptCallbackSetUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitRunJavaScriptCallbackSetUndefined001", 180210)
      Utils.registerBaseEvent("testRunJavaScriptCallbackSetUndefined001",'401', 26032503, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('runJavaScriptErrorCodeButton', 10, '');
    })


  })
}
