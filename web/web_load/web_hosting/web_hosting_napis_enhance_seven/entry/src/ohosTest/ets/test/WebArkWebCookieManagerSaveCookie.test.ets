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
import { waitForExist } from './WaitTest.test';

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
          console.info("push WebArkWebCookieManagerSaveCookie page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebArkWebCookieManagerSaveCookie page error: " + err);
      }
      console.log("waitForComponent ArkWebCookieManagerSaveCookieTest==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebArkWebCookieManagerSaveCookie beforeEach start");
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync001", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync001", "0", 148650, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync002", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync002", "0", 148660, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieSync003", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieSync003", "0", 148670, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync001", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync001", "1", 148680, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync002", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync002", "0", 148690, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
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
      Utils.emitEvent("OH_ArkWebCookieManager_SaveCookieAsync003", 147511)
      let isReturn = false;
      Utils.registerBaseEvent("testOH_ArkWebCookieManager_SaveCookieAsync003", "0", 148700, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ArkWebCookieManagerSaveCookieTest",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
    })


  })
}
