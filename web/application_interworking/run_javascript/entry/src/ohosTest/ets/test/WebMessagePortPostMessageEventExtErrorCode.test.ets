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
export default function webMessagePortPostMessageEventExtErrorCode() {

  describe('webMessagePortPostMessageEventExtErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessagePortPostMessageEventExtErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webMessagePortPostMessageEventExtErrorCode state success ' + JSON.stringify(pages));
        if (!('webMessagePortPostMessageEventExtErrorCode' == pages.name)) {
          console.info('get webMessagePortPostMessageEventExtErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webMessagePortPostMessageEventExtErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webMessagePortPostMessageEventExtErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webMessagePortPostMessageEventExtErrorCodeButton'),10000);
      console.log('waitForComponent webMessagePortPostMessageEventExtErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webMessagePortPostMessageEventExtErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webMessagePortPostMessageEventExtErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testPostMessageEventExtErrorCodeNull001
     * @tc.number SUB_WEB_WEBMESSAGEPORT_POSTMESSAGEEVENTEXT_ERRORCODE_NULL_0100
     * @tc.desc   test WebMessagePort.postMessageEventExt with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageEventExtErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageEventExtErrorCodeNull001', 172300);
      Utils.registerBaseEvent('testPostMessageEventExtErrorCodeNull001', '401', 172310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessagePortPostMessageEventExtErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testPostMessageEventExtErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBMESSAGEPORT_POSTMESSAGEEVENTEXT_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebMessagePort.postMessageEventExt with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPostMessageEventExtErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitPostMessageEventExtErrorCodeUndefined001', 172300);
      Utils.registerBaseEvent('testPostMessageEventExtErrorCodeUndefined001', '401', 172320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessagePortPostMessageEventExtErrorCodeButton', 10, '');
    })
  })
}
