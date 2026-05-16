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
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webResourceResponseSetReasonMessageParam() {

  describe('webResourceResponseSetReasonMessageParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetReasonMessageParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetReasonMessageParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetReasonMessageParam' == pages.name)) {
          console.info('get webResourceResponseSetReasonMessageParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetReasonMessageParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetReasonMessageParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetReasonMessageParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetReasonMessageParamButton==>');
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
      console.info('webResourceResponseSetReasonMessageParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetReasonMessageNull001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETREasonMessage_NULL_0100
     * @tc.desc   test WebResourceResponse.setReasonMessage with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetReasonMessageNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetReasonMessageNull001', 174300);
      Utils.registerBaseEvent('testSetReasonMessageNull001', 'success', 174310, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetReasonMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testSetReasonMessageUndefined001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETreasonMessage_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setReasonMessage with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetReasonMessageUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetReasonMessageUndefined001', 174300);
      Utils.registerBaseEvent('testSetReasonMessageUndefined001', 'success', 174320, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetReasonMessageParamButton', 10, '');
    })

    /**
     * @tc.name   testSetReasonMessageEmptyString001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_setreasonMessage_EMPTYSTRING_0100
     * @tc.desc   test WebResourceResponse.setReasonMessage with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetReasonMessageEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetReasonMessageEmptyString001', 174300);
      Utils.registerBaseEvent('testSetReasonMessageEmptyString001', 'success', 174330, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetReasonMessageParamButton', 10, '');
    })
  })
}
