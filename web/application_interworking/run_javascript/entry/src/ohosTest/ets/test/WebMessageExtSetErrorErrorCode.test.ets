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
export default function webMessageExtSetErrorErrorCode() {

  describe('webMessageExtSetErrorErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExtSetErrorErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webMessageExtSetErrorErrorCode state success ' + JSON.stringify(pages));
        if (!('webMessageExtSetErrorErrorCode' == pages.name)) {
          console.info('get webMessageExtSetErrorErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webMessageExtSetErrorErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webMessageExtSetErrorErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webMessageExtSetErrorErrorCodeButton'),10000);
      console.log('waitForComponent webMessageExtSetErrorErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webMessageExtSetErrorErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webMessageExtSetErrorErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testSetErrorErrorCodeNull001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETERROR_ERRORCODE_NULL_0100
     * @tc.desc   test WebMessageExt.setError with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetErrorErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetErrorErrorCodeNull001', 172200);
      Utils.registerBaseEvent('testSetErrorErrorCodeNull001', '401', 172210, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetErrorErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testSetErrorErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETERROR_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebMessageExt.setError with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetErrorErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetErrorErrorCodeUndefined001', 172200);
      Utils.registerBaseEvent('testSetErrorErrorCodeUndefined001', '401', 172220, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetErrorErrorCodeButton', 10, '');
    })
  })
}
