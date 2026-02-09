/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

let emitKey = "";

export default function ActsAceDeleteJavaScriptRegister() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('DeleteJavaScriptRegisterUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewDeleteJavaScriptRegister',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewBFCacheSuspendPlayer state success ' + JSON.stringify(pages));
        if (!("webviewDeleteJavaScriptRegister" == pages.name)) {
          console.info('get index state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push index state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push index page error:' + err);
      }
      await driver.waitForComponent(ON.id("deleteJavaScriptRegister_withOutRefresh"), 10000);
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
    });


    /**
     * @tc.name   testWebView_deleteJavaScriptRegister_0001
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0001
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_deleteJavaScriptRegister_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0001", '"success"', 10072, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('deleteWithoutRefresh', 172410)
      sendEventByKey('deleteJavaScriptRegister_withOutRefresh', 10, '');
      // setTimeout(() => {
      //   sendEventByKey('runJavaScript', 10, '');
      // }, 500)
    });

    /**
     * @tc.name   testWebView_deleteJavaScriptRegister_0002
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0002
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_deleteJavaScriptRegister_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0002",
        '"ReferenceError: testObjName is not defined"', 10073,
        done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('deleteWithRefresh', 172410)
      sendEventByKey('deleteJavaScriptRegister_withRefresh', 10, '');
      //setTimeout(() => {
       // sendEventByKey('runJavaScript', 10, '');
      //}, 1000)
    });


    /**
     * @tc.name   testWebView_deleteJavaScriptRegister_0003
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0003
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_deleteJavaScriptRegister_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0003",
        '17100008Failed to delete JavaScriptProxy because it does not exist.', 10074, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('deleteJavaScriptRegister_name_err', 10, '');
    });


    /**
     * @tc.name   testWebView_deleteJavaScriptRegister_0004
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0004
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_deleteJavaScriptRegister_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0004",
        "401BusinessError 401: Parameter error. The type of 'name' must be string.", 10075, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('deleteJavaScriptRegister_name_null', 10, '');
    });
  });
}