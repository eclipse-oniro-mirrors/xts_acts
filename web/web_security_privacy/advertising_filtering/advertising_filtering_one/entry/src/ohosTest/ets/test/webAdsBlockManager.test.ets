/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebAdsBlockManager() {
  describe('ActsAceWebAdsBlockManager', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webAdsBlockManager',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webAdsBlockManager state success " + JSON.stringify(pages));
        if (!("webAdsBlockManager" == pages.name)) {
          console.info("get webAdsBlockManager state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webAdsBlockManager state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webAdsBlockManager page error:" + err);
      }
      await driver.waitForComponent(ON.id("webViewSdkSchemeHandler"), 10000);
      console.log("waitForComponent webViewSdkSchemeHandler");
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0001
     *@tc.name testEnableAdsBlock
     *@tc.desc test EnableAdsBlock
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testEnableAdsBlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: Function) => {
      emitKey = "emitEnableAdsBlock"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testEnableAdsBlock", true, 161060, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0002
     *@tc.name testIsAdsBlockEnabled
     *@tc.desc test IsAdsBlockEnabled
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testIsAdsBlockEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabled"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabled", true, 161070, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0003
     *@tc.name testIsAdsBlockEnabledForCurPage
     *@tc.desc test IsAdsBlockEnabledForCurPage
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testIsAdsBlockEnabledForCurPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledForCurPage"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabledForCurPage", true, 161080, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0004
     *@tc.name testSetAdsBlockRules
     *@tc.desc test SetAdsBlockRules
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSetAdsBlockRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRules"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testSetAdsBlockRules", true, 161090, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0005
     *@tc.name testSetAdsBlockRulesFalse
     *@tc.desc test SetAdsBlockRulesFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testSetAdsBlockRulesFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRulesFalse"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testSetAdsBlockRulesFalse", true, 161100, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0006
     *@tc.name testAddAdsBlockDisallowedList
     *@tc.desc test AddAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testAddAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAddAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testAddAdsBlockDisallowedList", true, 161110, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0007
     *@tc.name testRemoveAdsBlockDisallowedList
     *@tc.desc test RemoveAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testRemoveAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testRemoveAdsBlockDisallowedList", true, 161120, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0008
     *@tc.name testClearAdsBlockDisallowedList
     *@tc.desc test ClearAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testClearAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testClearAdsBlockDisallowedList", true, 161130, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0009
     *@tc.name testAddAdsBlockAllowedList
     *@tc.desc test AddAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testAddAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAddAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testAddAdsBlockAllowedList", true, 161140, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0010
     *@tc.name testRemoveAdsBlockAllowedList
     *@tc.desc test RemoveAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testRemoveAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testRemoveAdsBlockAllowedList", true, 161150, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0011
     *@tc.name testClearAdsBlockAllowedList
     *@tc.desc test ClearAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testClearAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testClearAdsBlockAllowedList", true, 161160, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0012
     *@tc.name testOnAdsBlocked
     *@tc.desc test OnAdsBlocked
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testOnAdsBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnAdsBlocked"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testOnAdsBlocked", true, 161170, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0013
     *@tc.name testEnableAdsBlockFalse
     *@tc.desc test EnableAdsBlockFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testEnableAdsBlockFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: Function) => {
      emitKey = "emitEnableAdsBlockFalse"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testEnableAdsBlockFalse", true, 161180, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0014
     *@tc.name testIsAdsBlockEnabledCheck
     *@tc.desc test IsAdsBlockEnabledCheck
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testIsAdsBlockEnabledCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledCheck"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabledCheck", true, 161190, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0015
     *@tc.name testOnAdsBlockedTest
     *@tc.desc test OnAdsBlockedTest
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testOnAdsBlockedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnAdsBlockedTest"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testOnAdsBlockedTest", true, 161200, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

  })
}
