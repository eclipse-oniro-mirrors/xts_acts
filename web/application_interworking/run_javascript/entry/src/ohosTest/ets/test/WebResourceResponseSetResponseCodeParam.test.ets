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
 * WITHOUT WARRANTIES OR CONDITIONS OF any kind, either express or implied.
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

export default function webResourceResponseSetResponseCodeParam() {

  describe('webResourceResponseSetResponseCodeParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetResponseCodeParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetResponseCodeParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetResponseCodeParam' == pages.name)) {
          console.info('get webResourceResponseSetResponseCodeParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetResponseCodeParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetResponseCodeParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetResponseCodeParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetResponseCodeParamButton==>');
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
      console.info('webResourceResponseSetResponseCodeParam afterEach start');
      done();
    })


    /**
     * @tc.name   testSetResponseCodeNull001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSECODE_NULL_0100
     * @tc.desc   test WebResourceResponse.setResponseCode with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseCodeNull001', 174500);
      Utils.registerBaseEvent('testSetResponseCodeNull001', 'success', 174510, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseCodeParamButton', 10, '');
    })


    /**
     * @tc.name   testSetResponseCodeUndefined001
     * @tc.number SUB_WEB_WEBRESOURCEERROR_SETRESPONSECODE_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setResponseCode with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseCodeUndefined001', 174500);
      Utils.registerBaseEvent('testSetResponseCodeUndefined001', 'success', 174520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseCodeParamButton', 10, '');
    })
  })
}
