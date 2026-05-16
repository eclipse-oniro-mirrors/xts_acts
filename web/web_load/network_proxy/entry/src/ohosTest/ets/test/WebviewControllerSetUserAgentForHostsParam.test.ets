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

export default function webviewControllerSetUserAgentForHostsParam() {

  describe('webviewControllerSetUserAgentForHostsParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetUserAgentForHostsParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetUserAgentForHostsParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetUserAgentForHostsParam' == pages.name)) {
          console.info('get webviewControllerSetUserAgentForHostsParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetUserAgentForHostsParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetUserAgentForHostsParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetUserAgentForHostsParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetUserAgentForHostsParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetUserAgentForHostsParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetUserAgentForHostsParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetUserAgentForHostsEmptyString001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETUSERAGENTFORHOSTS_EMPTYSTRING_0100
     * @tc.desc   test WebviewController.setUserAgentForHosts with empty string userAgent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserAgentForHostsEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsEmptyString001', 174000);
      Utils.registerBaseEvent('testSetUserAgentForHostsEmptyString001', 'success', 174010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUserAgentForHostsParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentForHostsNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETUSERAGENTFORHOSTS_NULL_0100
     * @tc.desc   test WebviewController.setUserAgentForHosts with null userAgent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserAgentForHostsNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsNull001', 174000);
      Utils.registerBaseEvent('testSetUserAgentForHostsNull001', '401', 174020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUserAgentForHostsParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentForHostsUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETUSERAGENTFORHOSTS_UNDEFINED_0100
     * @tc.desc   test WebviewController.setUserAgentForHosts with undefined userAgent parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserAgentForHostsUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsUndefined001', 174000);
      Utils.registerBaseEvent('testSetUserAgentForHostsUndefined001', '401', 174030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUserAgentForHostsParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUserAgentForHostsEmptyArray001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETUSERAGENTFORHOSTS_EMPTYARRAY_0100
     * @tc.desc   test WebviewController.setUserAgentForHosts with empty array hosts parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUserAgentForHostsEmptyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUserAgentForHostsEmptyArray001', 174000);
      Utils.registerBaseEvent('testSetUserAgentForHostsEmptyArray001', 'success', 174040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUserAgentForHostsParamButton', 10, '');
    })
  })
}
