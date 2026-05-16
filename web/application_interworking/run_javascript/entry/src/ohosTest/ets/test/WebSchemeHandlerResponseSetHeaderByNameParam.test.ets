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

export default function webSchemeHandlerResponseSetHeaderByNameParam() {

  describe('webSchemeHandlerResponseSetHeaderByNameParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webSchemeHandlerResponseSetHeaderByNameParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webSchemeHandlerResponseSetHeaderByNameParam state success ' + JSON.stringify(pages));
        if (!('webSchemeHandlerResponseSetHeaderByNameParam' == pages.name)) {
          console.info('get webSchemeHandlerResponseSetHeaderByNameParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webSchemeHandlerResponseSetHeaderByNameParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webSchemeHandlerResponseSetHeaderByNameParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webSchemeHandlerResponseSetHeaderByNameParamButton'), 10000);
      console.log('waitForComponent webSchemeHandlerResponseSetHeaderByNameParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webSchemeHandlerResponseSetHeaderByNameParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webSchemeHandlerResponseSetHeaderByNameParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetHeaderByNameEmptyName001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_EMPTYNAME_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with empty name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameEmptyName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameEmptyName001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameEmptyName001', 'success', 182010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHeaderByNameNullName001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_NULLNAME_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with null name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameNullName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameNullName001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameNullName001', '401', 182020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHeaderByNameUndefinedName001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_UNDEFINEDNAME_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with undefined name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameUndefinedName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameUndefinedName001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameUndefinedName001', '401', 182030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHeaderByNameEmptyValue001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_EMPTYVALUE_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with empty value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameEmptyValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameEmptyValue001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameEmptyValue001', 'success', 182040, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHeaderByNameNullValue001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_NULLVALUE_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with null value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameNullValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameNullValue001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameNullValue001', '401', 182050, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testSetHeaderByNameUndefinedValue001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_SETHEADERBYNAME_UNDEFINEDVALUE_0100
     * @tc.desc   test WebSchemeHandlerResponse.setHeaderByName with undefined value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetHeaderByNameUndefinedValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetHeaderByNameUndefinedValue001', 182000);
      Utils.registerBaseEvent('testSetHeaderByNameUndefinedValue001', '401', 182060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseSetHeaderByNameParamButton', 10, '');
    })
  })
}
