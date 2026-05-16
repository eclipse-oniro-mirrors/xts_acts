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

export default function webviewControllerSetCustomUserAgentParam() {

  describe('webviewControllerSetCustomUserAgentParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetCustomUserAgentParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetCustomUserAgentParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetCustomUserAgentParam' == pages.name)) {
          console.info('get webviewControllerSetCustomUserAgentParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetCustomUserAgentParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetCustomUserAgentParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetCustomUserAgentParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetCustomUserAgentParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetCustomUserAgentParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetCustomUserAgentParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetCustomUserAgentNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETCUSTOMUSERAGENT_NULL_0100
     * @tc.desc   test WebviewController.setCustomUserAgent with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomUserAgentNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetCustomUserAgentNull001', 173800);
      Utils.registerBaseEvent('testSetCustomUserAgentNull001', '401', 173810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetCustomUserAgentParamButton', 10, '');
    })

    /**
     * @tc.name   testSetCustomUserAgentUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETCUSTOMUSERAGENT_UNDEFINED_0100
     * @tc.desc   test WebviewController.setCustomUserAgent with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomUserAgentUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetCustomUserAgentUndefined001', 173800);
      Utils.registerBaseEvent('testSetCustomUserAgentUndefined001', '401', 173820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetCustomUserAgentParamButton', 10, '');
    })

    /**
     * @tc.name   testSetCustomUserAgentEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETCUSTOMUSERAGENT_Empty_0100
     * @tc.desc   test WebviewController.setCustomUserAgent with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomUserAgentEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetCustomUserAgentEmpty001', 173800);
      Utils.registerBaseEvent('testSetCustomUserAgentEmpty001', 'success', 173830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetCustomUserAgentParamButton', 10, '');
    })
  })
}
