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

export default function webResourceResponseSetResponseEncodingParam() {

  describe('webResourceResponseSetResponseEncodingParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetResponseEncodingParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetResponseEncodingParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetResponseEncodingParam' == pages.name)) {
          console.info('get webResourceResponseSetResponseEncodingParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetResponseEncodingParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetResponseEncodingParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetResponseEncodingParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetResponseEncodingParamButton==>');
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
      console.info('webResourceResponseSetResponseEncodingParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetResponseEncodingNull001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEENCODING_NULL_0100
     * @tc.desc   test WebResourceResponse.setResponseEncoding with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseEncodingNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseEncodingNull001', 174100);
      Utils.registerBaseEvent('testSetResponseEncodingNull001', 'success', 174110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseEncodingParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseEncodingUndefined001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEENCODING_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setResponseEncoding with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseEncodingUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseEncodingUndefined001', 174100);
      Utils.registerBaseEvent('testSetResponseEncodingUndefined001', 'success', 174120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseEncodingParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseEncodingEmptyString001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSEENCODING_EMPTYSTRING_0100
     * @tc.desc   test WebResourceResponse.setResponseEncoding with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseEncodingEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseEncodingEmptyString001', 174100);
      Utils.registerBaseEvent('testSetResponseEncodingEmptyString001', 'success', 174130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseEncodingParamButton', 10, '');
    })
  })
}
