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

export default function webviewControllerPostMessageParam() {

  describe('webviewControllerPostMessageParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerPostMessageParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerPostMessageParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerPostMessageParam' == pages.name)) {
          console.info('get webviewControllerPostMessageParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerPostMessageParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerPostMessageParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerPostMessageParamButton'), 10000);
      console.log('waitForComponent webviewControllerPostMessageParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerPostMessageParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerPostMessageParam afterEach start');
      done();
    })

    /**
     * @tc.name   testPostMessageNameEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_NAME_EMPTY_0100
     * @tc.desc   test WebviewController.postMessage with empty string name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageNameEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageNameEmpty001', 172500);
      Utils.registerBaseEvent('testPostMessageNameEmpty001', '401', 172510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageNameNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_NAME_NULL_0100
     * @tc.desc   test WebviewController.postMessage with null name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageNameNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageNameNull001', 172500);
      Utils.registerBaseEvent('testPostMessageNameNull001', '401', 172520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageNameUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_NAME_UNDEFINED_0100
     * @tc.desc   test WebviewController.postMessage with undefined name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageNameUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageNameUndefined001', 172500);
      Utils.registerBaseEvent('testPostMessageNameUndefined001', '401', 172530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessagePortsNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_PORTS_NULL_0100
     * @tc.desc   test WebviewController.postMessage with null ports parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessagePortsNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessagePortsNull001', 172500);
      Utils.registerBaseEvent('testPostMessagePortsNull001', '401', 172540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessagePortsUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_PORTS_UNDEFINED_0100
     * @tc.desc   test WebviewController.postMessage with undefined ports parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessagePortsUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessagePortsUndefined001', 172500);
      Utils.registerBaseEvent('testPostMessagePortsUndefined001', '401', 172550, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessagePortsEmptyArray001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_PORTS_EMPTYARRAY_0100
     * @tc.desc   test WebviewController.postMessage with empty array ports parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessagePortsEmptyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessagePortsEmptyArray001', 172500);
      Utils.registerBaseEvent('testPostMessagePortsEmptyArray001', '401', 172560, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageUriEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_URI_EMPTY_0100
     * @tc.desc   test WebviewController.postMessage with empty string uri parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageUriEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageUriEmpty001', 172500);
      Utils.registerBaseEvent('testPostMessageUriEmpty001', '401', 172570, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageUriNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_URI_NULL_0100
     * @tc.desc   test WebviewController.postMessage with null uri parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageUriNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageUriNull001', 172500);
      Utils.registerBaseEvent('testPostMessageUriNull001', '401', 172580, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageUriUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_POSTMESSAGE_URI_UNDEFINED_0100
     * @tc.desc   test WebviewController.postMessage with undefined uri parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageUriUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageUriUndefined001', 172500);
      Utils.registerBaseEvent('testPostMessageUriUndefined001', '401', 172590, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerPostMessageParamButton', 10, '');
    })
  })
}
