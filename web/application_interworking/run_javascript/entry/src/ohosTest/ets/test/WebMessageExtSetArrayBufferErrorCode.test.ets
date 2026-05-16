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
export default function webMessageExtSetArrayBufferErrorCode() {

  describe('webMessageExtSetArrayBufferErrorCodeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webMessageExtSetArrayBufferErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webMessageExtSetArrayBufferErrorCode state success ' + JSON.stringify(pages));
        if (!('webMessageExtSetArrayBufferErrorCode' == pages.name)) {
          console.info('get webMessageExtSetArrayBufferErrorCode state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webMessageExtSetArrayBufferErrorCode page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webMessageExtSetArrayBufferErrorCode page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webMessageExtSetArrayBufferErrorCodeButton'),10000);
      console.log('waitForComponent webMessageExtSetArrayBufferErrorCodeButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webMessageExtSetArrayBufferErrorCode beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webMessageExtSetArrayBufferErrorCode afterEach start');
      done();
    })

    /**
     * @tc.name   testSetArrayBufferErrorCodeNull001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_ERRORCODE_NULL_0100
     * @tc.desc   test WebMessageExt.setArrayBuffer with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetArrayBufferErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetArrayBufferErrorCodeNull001', 172100);
      Utils.registerBaseEvent('testSetArrayBufferErrorCodeNull001', '401', 172110, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetArrayBufferErrorCodeButton', 10, '');
    })

    /**
     * @tc.name   testSetArrayBufferErrorCodeUndefined001
     * @tc.number SUB_WEB_WEBMESSAGEEXT_SETARRAYBUFFER_ERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebMessageExt.setArrayBuffer with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetArrayBufferErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetArrayBufferErrorCodeUndefined001', 172100);
      Utils.registerBaseEvent('testSetArrayBufferErrorCodeUndefined001', '401', 172120, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webMessageExtSetArrayBufferErrorCodeButton', 10, '');
    })
  })
}
