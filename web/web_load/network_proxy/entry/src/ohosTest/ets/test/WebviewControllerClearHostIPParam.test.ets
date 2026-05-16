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

export default function webviewControllerClearHostIPParam() {

  describe('webviewControllerClearHostIPParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerClearHostIPParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerClearHostIPParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerClearHostIPParam' == pages.name)) {
          console.info('get webviewControllerClearHostIPParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerClearHostIPParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerClearHostIPParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerClearHostIPParamButton'), 10000);
      console.log('waitForComponent webviewControllerClearHostIPParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerClearHostIPParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerClearHostIPParam afterEach start');
      done();
    })

    /**
     * @tc.name   testClearHostIPHostNameEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARHOSTIP_HOSTNAME_EMPTY_0100
     * @tc.desc   test WebviewController.clearHostIP with empty string hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearHostIPHostNameEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitClearHostIPHostNameEmpty001', 179800);
      Utils.registerBaseEvent('testClearHostIPHostNameEmpty001', 'success', 179810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerClearHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testClearHostIPHostNameNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARHOSTIP_HOSTNAME_NULL_0100
     * @tc.desc   test WebviewController.clearHostIP with null hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearHostIPHostNameNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitClearHostIPHostNameNull001', 179800);
      Utils.registerBaseEvent('testClearHostIPHostNameNull001', '401', 179820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerClearHostIPParamButton', 10, '');
    })

    /**
     * @tc.name   testClearHostIPHostNameUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CLEARHOSTIP_HOSTNAME_UNDEFINED_0100
     * @tc.desc   test WebviewController.clearHostIP with undefined hostName parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testClearHostIPHostNameUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitClearHostIPHostNameUndefined001', 179800);
      Utils.registerBaseEvent('testClearHostIPHostNameUndefined001', '401', 179830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerClearHostIPParamButton', 10, '');
    })
  })
}
