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

export default function webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam() {

  describe('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam state success ' + JSON.stringify(pages));
        if (!('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam' == pages.name)) {
          console.info('get webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton'), 10000);
      console.log('waitForComponent webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParam afterEach start');
      done();
    })

    /**
     * @tc.name   testRemoveIntelligentTrackingPreventionBypassingListHostListNull001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_HOSTLIST_NULL_0100
     * @tc.desc   test WebviewController.removeIntelligentTrackingPreventionBypassingList with null hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListHostListNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRemoveIntelligentTrackingPreventionBypassingListHostListNull001', 178800);
      Utils.registerBaseEvent('testRemoveIntelligentTrackingPreventionBypassingListHostListNull001', true, 178810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton', 10, '');
    })

    /**
     * @tc.name   testRemoveIntelligentTrackingPreventionBypassingListHostListUndefined001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_HOSTLIST_UNDEFINED_0100
     * @tc.desc   test WebviewController.removeIntelligentTrackingPreventionBypassingList with undefined hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListHostListUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRemoveIntelligentTrackingPreventionBypassingListHostListUndefined001', 178800);
      Utils.registerBaseEvent('testRemoveIntelligentTrackingPreventionBypassingListHostListUndefined001', true, 178820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton', 10, '');
    })

    /**
     * @tc.name   testRemoveIntelligentTrackingPreventionBypassingListHostListEmptyArray001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_HOSTLIST_EMPTYARRAY_0100
     * @tc.desc   test WebviewController.removeIntelligentTrackingPreventionBypassingList with empty array hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListHostListEmptyArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRemoveIntelligentTrackingPreventionBypassingListHostListEmptyArray001', 178800);
      Utils.registerBaseEvent('testRemoveIntelligentTrackingPreventionBypassingListHostListEmptyArray001', true, 178830, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton', 10, '');
    })

    /**
     * @tc.name   testRemoveIntelligentTrackingPreventionBypassingListHostListNormal001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_HOSTLIST_NORMAL_0100
     * @tc.desc   test WebviewController.removeIntelligentTrackingPreventionBypassingList with normal hostList parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListHostListNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitRemoveIntelligentTrackingPreventionBypassingListHostListNormal001', 178800);
      Utils.registerBaseEvent('testRemoveIntelligentTrackingPreventionBypassingListHostListNormal001', true, 178840, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webviewControllerRemoveIntelligentTrackingPreventionBypassingListParamButton', 10, '');
    })
  })
}
