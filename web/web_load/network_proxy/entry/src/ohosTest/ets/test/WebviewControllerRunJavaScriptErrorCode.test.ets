/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
export default function webviewControllerRunJavaScriptErrorCode() {

  describe('webviewControllerRunJavaScriptErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerRunJavaScriptErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerRunJavaScriptErrorCode state success ' + JSON.stringify(pages));
        if (!('webviewControllerRunJavaScriptErrorCode' == pages.name)) {
          console.info('get webviewControllerRunJavaScriptErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerRunJavaScriptErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerRunJavaScriptErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerRunJavaScriptErrorCodeButton'),10000);
      console.log('waitForComponent webviewControllerRunJavaScriptErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerRunJavaScriptErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerRunJavaScriptErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testRunJavaScriptErrorCodeEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_ERRORCODE_EMPTY_STRING_0100
     * @tc.desc   test WebviewController.runJavaScript with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptErrorCodeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptErrorCodeEmptyString001', 172600);
      Utils.registerBaseEvent('testRunJavaScriptErrorCodeEmptyString001', 'success', 172610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptErrorCodeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_ERRORCODE_NULL_0100
     * @tc.desc   test WebviewController.runJavaScript with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptErrorCodeNull001', 172600);
      Utils.registerBaseEvent('testRunJavaScriptErrorCodeNull001', '401', 172620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPT_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebviewController.runJavaScript with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptErrorCodeUndefined001', 172600);
      Utils.registerBaseEvent('testRunJavaScriptErrorCodeUndefined001', '401', 172630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptErrorCodeButton', 10, '');
    })
  })
}
