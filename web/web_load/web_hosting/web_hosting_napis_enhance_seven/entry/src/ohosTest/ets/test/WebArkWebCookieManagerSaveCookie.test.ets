/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebArkWebCookieManagerSaveCookie() {

  describe('ActsWebArkWebCookieManagerSaveCookieTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebArkWebCookieManagerSaveCookie',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebArkWebCookieManagerSaveCookie state success " + JSON.stringify(pages));
        if (!("WebArkWebCookieManagerSaveCookie" == pages.name)) {
          console.info("get WebArkWebCookieManagerSaveCookie state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebArkWebCookieManagerSaveCookie page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebArkWebCookieManagerSaveCookie page error: " + err);
      }
      await driver.waitForComponent(ON.id("ArkWebCookieManagerSaveCookieTest"),10000);
      console.log("waitForComponent ArkWebCookieManagerSaveCookieTest==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("WebArkWebCookieManagerSaveCookie beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebArkWebCookieManagerSaveCookie afterEach start");
      await Utils.sleep(2000);
      console.info("WebArkWebCookieManagerSaveCookie afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIESYNC_0001
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieSync001
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieSync no cookie ok
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebCookieManager_SaveCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync001", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync001", "0", 2025072501, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIESYNC_0002
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieSync002
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieSync  set cookie ok
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebCookieManager_SaveCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync002", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync002", "0", 2025072502, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIESYNC_0003
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieSync003
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieSync  非ui线程 ok
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOH_ArkWebCookieManager_SaveCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync003", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync003", "0", 2025072503, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIEASYNC_0001
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieAsync001
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieAsync  set nullptr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testOH_ArkWebCookieManager_SaveCookieAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync001", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync001", "1", 2025072504, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIEASYNC_0002
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieAsync002
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieAsync  OH_ArkWeb_OnCookieSaveCallback ok
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebCookieManager_SaveCookieAsync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync002", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync002", "0", 2025072505, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })

    /*
    * @tc.number     : SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_SAVECOOKIEASYNC_0003
    * @tc.name       : testOH_ArkWebCookieManager_SaveCookieAsync003
    * @tc.desc       : test OH_ArkWebCookieManager_SaveCookieAsync  OH_ArkWeb_OnCookieSaveCallback 非ui线程 ok
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testOH_ArkWebCookieManager_SaveCookieAsync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync003", 725)
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync003", "0", 2025072506, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('ArkWebCookieManagerSaveCookieTest', 10, '');
    })


  })
}
