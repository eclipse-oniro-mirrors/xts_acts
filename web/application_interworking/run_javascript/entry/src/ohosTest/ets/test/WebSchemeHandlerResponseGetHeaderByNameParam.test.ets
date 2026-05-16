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

export default function webSchemeHandlerResponseGetHeaderByNameParam() {

  describe('webSchemeHandlerResponseGetHeaderByNameParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webSchemeHandlerResponseGetHeaderByNameParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webSchemeHandlerResponseGetHeaderByNameParam state success ' + JSON.stringify(pages));
        if (!('webSchemeHandlerResponseGetHeaderByNameParam' == pages.name)) {
          console.info('get webSchemeHandlerResponseGetHeaderByNameParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webSchemeHandlerResponseGetHeaderByNameParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webSchemeHandlerResponseGetHeaderByNameParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webSchemeHandlerResponseGetHeaderByNameParamButton'), 10000);
      console.log('waitForComponent webSchemeHandlerResponseGetHeaderByNameParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webSchemeHandlerResponseGetHeaderByNameParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webSchemeHandlerResponseGetHeaderByNameParam afterEach start');
      done();
    })

    /**
     * @tc.name   testGetHeaderByNameEmptyString001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_GETHEADERBYNAME_EMPTYSTRING_0100
     * @tc.desc   test WebSchemeHandlerResponse.getHeaderByName with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHeaderByNameEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetHeaderByNameEmptyString001', 179000);
      Utils.registerBaseEvent('testGetHeaderByNameEmptyString001', 'success', 179010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseGetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testGetHeaderByNameNull001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_GETHEADERBYNAME_NULL_0100
     * @tc.desc   test WebSchemeHandlerResponse.getHeaderByName with null name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHeaderByNameNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetHeaderByNameNull001', 179000);
      Utils.registerBaseEvent('testGetHeaderByNameNull001', 'success', 179020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseGetHeaderByNameParamButton', 10, '');
    })

    /**
     * @tc.name   testGetHeaderByNameUndefined001
     * @tc.number SUB_WEB_WEBSCHEMEHANDLERRESPONSE_GETHEADERBYNAME_UNDEFINED_0100
     * @tc.desc   test WebSchemeHandlerResponse.getHeaderByName with undefined name parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetHeaderByNameUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitGetHeaderByNameUndefined001', 179000);
      Utils.registerBaseEvent('testGetHeaderByNameUndefined001', 'success', 179030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webSchemeHandlerResponseGetHeaderByNameParamButton', 10, '');
    })
  })
}
