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

export default function webSchemeHandlerResponseSetStatusTextParam() {

  describe('webSchemeHandlerResponseSetStatusTextParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webSchemeHandlerResponseSetStatusTextParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webSchemeHandlerResponseSetStatusTextParam state success ' + JSON.stringify(pages));
        if (!('webSchemeHandlerResponseSetStatusTextParam' == pages.name)) {
          console.info('get webSchemeHandlerResponseSetStatusTextParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webSchemeHandlerResponseSetStatusTextParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webSchemeHandlerResponseSetStatusTextParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webSchemeHandlerResponseSetStatusTextParamButton'), 10000);
      console.log('waitForComponent webSchemeHandlerResponseSetStatusTextParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webSchemeHandlerResponseSetNetErrorCodeParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webSchemeHandlerResponseSetStatusTextParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetStatusTextEmptyString001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETSTATUSTEXT_EMPTYSTRING_0100
     * @tc.desc   test WebSchemeHandlerResponse.setStatusText with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStatusTextEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStatusTextEmptyString001', 181000);
      Utils.registerBaseEvent('testSetStatusTextEmptyString001', 'success', 181010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetStatusTextParamButton', 10, '');
    })

    /**
     * @tc.name   testSetStatusTextNull001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETSTATUSTEXT_NULL_0100
     * @tc.desc   test WebSchemeHandlerResponse.setStatusText with null type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStatusTextNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStatusTextNull001', 181000);
      Utils.registerBaseEvent('testSetStatusTextNull001', '401', 181020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetStatusTextParamButton', 10, '');
    })

    /**
     * @tc.name   testSetStatusTextUndefined001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETSTATUSTEXT_UNDEFINED_0100
     * @tc.desc   test WebSchemeHandlerResponse.setStatusText with undefined type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStatusTextUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetStatusTextUndefined001', 181000);
      Utils.registerBaseEvent('testSetStatusTextUndefined001', '401', 181030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetStatusTextParamButton', 10, '');
    })
  })
}
