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

export default function webSchemeHandlerResponseSetUrlParam() {

  describe('webSchemeHandlerResponseSetUrlParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webSchemeHandlerResponseSetUrlParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webSchemeHandlerResponseSetUrlParam state success ' + JSON.stringify(pages));
        if (!('webSchemeHandlerResponseSetUrlParam' == pages.name)) {
          console.info('get webSchemeHandlerResponseSetUrlParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webSchemeHandlerResponseSetUrlParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webSchemeHandlerResponseSetUrlParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webSchemeHandlerResponseSetUrlParamButton'), 10000);
      console.log('waitForComponent webSchemeHandlerResponseSetUrlParamButton==>');
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
      console.info('webSchemeHandlerResponseSetUrlParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetUrlEmptyString001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETURL_EMPTYSTRING_0100
     * @tc.desc   test WebSchemeHandlerResponse.setUrl with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlEmptyString001', 179000);
      Utils.registerBaseEvent('testSetUrlEmptyString001', 'success', 179010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetUrlParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlNull001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETURL_NULL_0100
     * @tc.desc   test WebSchemeHandlerResponse.setUrl with null type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlNull001', 179000);
      Utils.registerBaseEvent('testSetUrlNull001', '401', 179020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetUrlParamButton', 10, '');
    })

    /**
     * @tc.name   testSetUrlUndefined001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETURL_UNDEFINED_0100
     * @tc.desc   test WebSchemeHandlerResponse.setUrl with undefined type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetUrlUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetUrlUndefined001', 179000);
      Utils.registerBaseEvent('testSetUrlUndefined001', '401', 179030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetUrlParamButton', 10, '');
    })
  })
}
