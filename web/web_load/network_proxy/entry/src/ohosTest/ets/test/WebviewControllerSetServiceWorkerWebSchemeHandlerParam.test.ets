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

export default function webviewControllerSetServiceWorkerWebSchemeHandlerParam() {

  describe('webviewControllerSetServiceWorkerWebSchemeHandlerParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetServiceWorkerWebSchemeHandlerParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetServiceWorkerWebSchemeHandlerParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetServiceWorkerWebSchemeHandlerParam' == pages.name)) {
          console.info('get webviewControllerSetServiceWorkerWebSchemeHandlerParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetServiceWorkerWebSchemeHandlerParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetServiceWorkerWebSchemeHandlerParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetServiceWorkerWebSchemeHandlerParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetServiceWorkerWebSchemeHandlerParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetServiceWorkerWebSchemeHandlerParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerSchemeEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETSERVICEWORKERWEBSCHEMEHANDLER_SCHEME_EMPTYSTRING_0100
     * @tc.desc   test WebviewController.setServiceWorkerWebSchemeHandler with empty string scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetServiceWorkerWebSchemeHandlerSchemeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetServiceWorkerWebSchemeHandlerSchemeEmptyString001', 177800);
      Utils.registerBaseEvent('testSetServiceWorkerWebSchemeHandlerSchemeEmptyString001', 'success', 177810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerSchemeNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETSERVICEWORKERWEBSCHEMEHANDLER_SCHEME_NULL_0100
     * @tc.desc   test WebviewController.setServiceWorkerWebSchemeHandler with null scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetServiceWorkerWebSchemeHandlerSchemeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetServiceWorkerWebSchemeHandlerSchemeNull001', 177800);
      Utils.registerBaseEvent('testSetServiceWorkerWebSchemeHandlerSchemeNull001', '401', 177820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerSchemeUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETSERVICEWORKERWEBSCHEMEHANDLER_SCHEME_UNDEFINED_0100
     * @tc.desc   test WebviewController.setServiceWorkerWebSchemeHandler with undefined scheme parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetServiceWorkerWebSchemeHandlerSchemeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetServiceWorkerWebSchemeHandlerSchemeUndefined001', 177800);
      Utils.registerBaseEvent('testSetServiceWorkerWebSchemeHandlerSchemeUndefined001', '401', 177830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerHandlerNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETSERVICEWORKERWEBSCHEMEHANDLER_HANDLER_NULL_0100
     * @tc.desc   test WebviewController.setServiceWorkerWebSchemeHandler with null handler parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetServiceWorkerWebSchemeHandlerHandlerNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetServiceWorkerWebSchemeHandlerHandlerNull001', 177800);
      Utils.registerBaseEvent('testSetServiceWorkerWebSchemeHandlerHandlerNull001', 'success', 177840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton', 10, '');
    })

    /**
     * @tc.name   testSetServiceWorkerWebSchemeHandlerHandlerUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETSERVICEWORKERWEBSCHEMEHANDLER_HANDLER_UNDEFINED_0100
     * @tc.desc   test WebviewController.setServiceWorkerWebSchemeHandler with undefined handler parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetServiceWorkerWebSchemeHandlerHandlerUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetServiceWorkerWebSchemeHandlerHandlerUndefined001', 177800);
      Utils.registerBaseEvent('testSetServiceWorkerWebSchemeHandlerHandlerUndefined001', 'success', 177850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetServiceWorkerWebSchemeHandlerParamButton', 10, '');
    })
  })
}
