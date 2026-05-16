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

export default function webviewControllerAddIntelligentTrackingParam() {

  describe('webviewControllerAddIntelligentTrackingParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerAddIntelligentTrackingParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerAddIntelligentTrackingParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerAddIntelligentTrackingParam' == pages.name)) {
          console.info('get webviewControllerAddIntelligentTrackingParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerAddIntelligentTrackingParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerAddIntelligentTrackingParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerAddIntelligentTrackingParamButton'), 10000);
      console.log('waitForComponent webviewControllerAddIntelligentTrackingParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerAddIntelligentTrackingParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerAddIntelligentTrackingParam afterEach start');
      done();
    })

    /**
     * @tc.name   testAddIntelligentTrackingHostListNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ADDINTELLIGENTTRACKING_HOSTLIST_NULL_0100
     * @tc.desc   test WebviewController.addIntelligentTrackingPreventionBypassingList with null hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddIntelligentTrackingHostListNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddIntelligentTrackingHostListNull001', 172600);
      Utils.registerBaseEvent('testAddIntelligentTrackingHostListNull001', true, 172610, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerAddIntelligentTrackingParamButton', 10, '');
    })

    /**
     * @tc.name   testAddIntelligentTrackingHostListUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ADDINTELLIGENTTRACKING_HOSTLIST_UNDEFINED_0100
     * @tc.desc   test WebviewController.addIntelligentTrackingPreventionBypassingList with undefined hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddIntelligentTrackingHostListUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddIntelligentTrackingHostListUndefined001', 172600);
      Utils.registerBaseEvent('testAddIntelligentTrackingHostListUndefined001', true, 172620, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerAddIntelligentTrackingParamButton', 10, '');
    })

    /**
     * @tc.name   testAddIntelligentTrackingHostListEmptyArray001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ADDINTELLIGENTTRACKING_HOSTLIST_EMPTYARRAY_0100
     * @tc.desc   test WebviewController.addIntelligentTrackingPreventionBypassingList with empty array hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddIntelligentTrackingHostListEmptyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitAddIntelligentTrackingHostListEmptyArray001', 172600);
      Utils.registerBaseEvent('testAddIntelligentTrackingHostListEmptyArray001', true, 172630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerAddIntelligentTrackingParamButton', 10, '');
    })
  })
}
