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
export default function webviewControllerRunJavaScriptExtErrorCode() {

  describe('webviewControllerRunJavaScriptExtErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerRunJavaScriptExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerRunJavaScriptExtErrorCode state success ' + JSON.stringify(pages));
        if (!('webviewControllerRunJavaScriptExtErrorCode' == pages.name)) {
          console.info('get webviewControllerRunJavaScriptExtErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerRunJavaScriptExtErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerRunJavaScriptExtErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerRunJavaScriptExtErrorCodeButton'),10000);
      console.log('waitForComponent webviewControllerRunJavaScriptExtErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerRunJavaScriptExtErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerRunJavaScriptExtErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testRunJavaScriptExtErrorCodeEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_ERRORCODE_EMPTY_STRING_0100
     * @tc.desc   test WebviewController.runJavaScriptExt with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtErrorCodeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptExtErrorCodeEmptyString001', 172700);
      Utils.registerBaseEvent('testRunJavaScriptExtErrorCodeEmptyString001', 'success', 172710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtErrorCodeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_ERRORCODE_NULL_0100
     * @tc.desc   test WebviewController.runJavaScriptExt with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptExtErrorCodeNull001', 172700);
      Utils.registerBaseEvent('testRunJavaScriptExtErrorCodeNull001', '401', 172720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testRunJavaScriptExtErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RUNJAVASCRIPTEXT_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebviewController.runJavaScriptExt with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRunJavaScriptExtErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRunJavaScriptExtErrorCodeUndefined001', 172700);
      Utils.registerBaseEvent('testRunJavaScriptExtErrorCodeUndefined001', '401', 172730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRunJavaScriptExtErrorCodeButton', 10, '');
    })
  })
}
