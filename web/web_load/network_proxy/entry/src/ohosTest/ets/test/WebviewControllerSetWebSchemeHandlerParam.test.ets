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

import { afterEach, beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webviewControllerSetWebSchemeHandlerParam() {

  describe('webviewControllerSetWebSchemeHandlerParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetWebSchemeHandlerParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetWebSchemeHandlerParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetWebSchemeHandlerParam' == pages.name)) {
          console.info('get webviewControllerSetWebSchemeHandlerParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetWebSchemeHandlerParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetWebSchemeHandlerParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetWebSchemeHandlerParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetWebSchemeHandlerParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetWebSchemeHandlerParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetWebSchemeHandlerParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetWebSchemeHandlerSchemeEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETWEBSCHEMEHANDLER_SCHEME_EMPTYSTRING_0100
     * @tc.desc   test WebviewController.setWebSchemeHandler with empty string scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebSchemeHandlerSchemeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebSchemeHandlerSchemeEmptyString001', 176800);
      Utils.registerBaseEvent('testSetWebSchemeHandlerSchemeEmptyString001', 'success', 176810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetWebSchemeHandlerSchemeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETWEBSCHEMEHANDLER_SCHEME_NULL_0100
     * @tc.desc   test WebviewController.setWebSchemeHandler with null scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebSchemeHandlerSchemeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebSchemeHandlerSchemeNull001', 176800);
      Utils.registerBaseEvent('testSetWebSchemeHandlerSchemeNull001', '401', 176820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetWebSchemeHandlerSchemeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETWEBSCHEMEHANDLER_SCHEME_UNDEFINED_0100
     * @tc.desc   test WebviewController.setWebSchemeHandler with undefined scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebSchemeHandlerSchemeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebSchemeHandlerSchemeUndefined001', 176800);
      Utils.registerBaseEvent('testSetWebSchemeHandlerSchemeUndefined001', '401', 176830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetWebSchemeHandlerHandlerNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETWEBSCHEMEHANDLER_HANDLER_NULL_0100
     * @tc.desc   test WebviewController.setWebSchemeHandler with null handler parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebSchemeHandlerHandlerNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebSchemeHandlerHandlerNull001', 176800);
      Utils.registerBaseEvent('testSetWebSchemeHandlerHandlerNull001', 'success', 176840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetWebSchemeHandlerHandlerUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETWEBSCHEMEHANDLER_HANDLER_UNDEFINED_0100
     * @tc.desc   test WebviewController.setWebSchemeHandler with undefined handler parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWebSchemeHandlerHandlerUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetWebSchemeHandlerHandlerUndefined001', 176800);
      Utils.registerBaseEvent('testSetWebSchemeHandlerHandlerUndefined001', 'success', 176850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetWebSchemeHandlerParamButton', 10, '');
    })
  })
}
