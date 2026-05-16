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

export default function webResourceResponseSetResponseDataParam() {

  describe('webResourceResponseSetResponseDataParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetResponseDataParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetResponseDataParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetResponseDataParam' == pages.name)) {
          console.info('get webResourceResponseSetResponseDataParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetResponseDataParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetResponseDataParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetResponseDataParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetResponseDataParamButton==>');
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
      console.info('webResourceResponseSetResponseDataParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetResponseDataNull001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_NULL_0100
     * @tc.desc   test WebResourceResponse.setResponseData with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataNull001', 174000);
      Utils.registerBaseEvent('testSetResponseDataNull001', 'success', 174010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseDataUndefined001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setResponseData with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataUndefined001', 174000);
      Utils.registerBaseEvent('testSetResponseDataUndefined001', 'success', 174020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseDataEmptyString001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_EMPTYSTRING_0100
     * @tc.desc   test WebResourceResponse.setResponseData with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataEmptyString001', 174000);
      Utils.registerBaseEvent('testSetResponseDataEmptyString001', 'success', 174030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseDataNumber001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_NUMBER_0100
     * @tc.desc   test WebResourceResponse.setResponseData with number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataNumber001', 174000);
      Utils.registerBaseEvent('testSetResponseDataNumber001', 'success', 174040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseDataNumberZero001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_NUMBERZERO_0100
     * @tc.desc   test WebResourceResponse.setResponseData with number zero parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataNumberZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataNumberZero001', 174000);
      Utils.registerBaseEvent('testSetResponseDataNumberZero001', 'success', 174050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseDataNumberNegative001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEDATA_NUMBERNEGATIVE_0100
     * @tc.desc   test WebResourceResponse.setResponseData with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseDataNumberNegative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseDataNumberNegative001', 174000);
      Utils.registerBaseEvent('testSetResponseDataNumberNegative001', 'success', 174060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseDataParamButton', 10, '');
    })
  })
}
