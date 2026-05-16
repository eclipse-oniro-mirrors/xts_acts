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

export default function webviewControllerSetUrlTrustListParam() {

  describe('webviewControllerSetUrlTrustListParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerSetUrlTrustListParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerSetUrlTrustListParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerSetUrlTrustListParam' == pages.name)) {
          console.info('get webviewControllerSetUrlTrustListParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerSetUrlTrustListParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerSetUrlTrustListParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerSetUrlTrustListParamButton'), 10000);
      console.log('waitForComponent webviewControllerSetUrlTrustListParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerSetUrlTrustListParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerSetUrlTrustListParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetUrlTrustListEmpty001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_EMPTY_0100
     * @tc.desc   test WebviewController.setUrlTrustList with empty string urlTrustList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListEmpty001', 180800);
      Utils.registerBaseEvent('testSetUrlTrustListEmpty001', 'success', 180810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUrlTrustListParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_NULL_0100
     * @tc.desc   test WebviewController.setUrlTrustList with null urlTrustList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListNull001', 180800);
      Utils.registerBaseEvent('testSetUrlTrustListNull001', '401', 180820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUrlTrustListParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlTrustListUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_UNDEFINED_0100
     * @tc.desc   test WebviewController.setUrlTrustList with undefined urlTrustList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlTrustListUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlTrustListUndefined001', 180800);
      Utils.registerBaseEvent('testSetUrlTrustListUndefined001', '401', 180830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerSetUrlTrustListParamButton', 10, '');
    })
  })
}
