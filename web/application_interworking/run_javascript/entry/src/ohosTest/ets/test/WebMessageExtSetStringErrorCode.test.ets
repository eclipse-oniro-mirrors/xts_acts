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
export default function webMessageExtSetStringErrorCode() {

  describe('webMessageExtSetStringErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExtSetStringErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webMessageExtSetStringErrorCode state success ' + JSON.stringify(pages));
        if (!('webMessageExtSetStringErrorCode' == pages.name)) {
          console.info('get webMessageExtSetStringErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webMessageExtSetStringErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webMessageExtSetStringErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webMessageExtSetStringErrorCodeButton'),10000);
      console.log('waitForComponent webMessageExtSetStringErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webMessageExtSetStringErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webMessageExtSetStringErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testSetStringErrorCodeEmptyString001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETSTRING_ERRORCODE_EMPTY_STRING_0100
     * @tc.desc   test WebMessageExt.setString with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStringErrorCodeEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStringErrorCodeEmptyString001', 172000);
      Utils.registerBaseEvent('testSetStringErrorCodeEmptyString001', '17100014', 172010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetStringErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testSetStringErrorCodeNull001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETSTRING_ERRORCODE_NULL_0100
     * @tc.desc   test WebMessageExt.setString with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStringErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStringErrorCodeNull001', 172000);
      Utils.registerBaseEvent('testSetStringErrorCodeNull001', '401', 172020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetStringErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testSetStringErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETSTRING_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebMessageExt.setString with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStringErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStringErrorCodeUndefined001', 172000);
      Utils.registerBaseEvent('testSetStringErrorCodeUndefined001', '401', 172030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetStringErrorCodeButton', 10, '');
    })
  })
}
