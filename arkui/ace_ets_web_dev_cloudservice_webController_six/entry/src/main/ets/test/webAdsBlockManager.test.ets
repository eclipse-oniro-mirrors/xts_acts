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
import { afterEach, beforeAll, beforeEach, describe, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
// @ts-nocheck
let emitKey = ""

export default function ActsAceWebAdsBlockManager() {
  describe('ActsAceWebAdsBlockManager', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'MainAbility/pages/webAdsBlockManager',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webAdsBlockManager state success " + JSON.stringify(pages));
        if (!("webAdsBlockManager" == pages.name)) {
          console.info("get webAdsBlockManager state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push webAdsBlockManager state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webAdsBlockManager page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      done();
    })

    afterEach(async (done: Function) => {
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent : events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.error("emit emitKey error:" + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0001
     *@tc.name testEnableAdsBlock
     *@tc.desc test EnableAdsBlock
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testEnableAdsBlock', 0, async (done: Function) => {
      emitKey = "emitEnableAdsBlock"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testEnableAdsBlock", true, 1001, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0002
     *@tc.name testIsAdsBlockEnabled
     *@tc.desc test IsAdsBlockEnabled
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testIsAdsBlockEnabled', 0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabled"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testIsAdsBlockEnabled", true, 1002, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0003
     *@tc.name testIsAdsBlockEnabledForCurPage
     *@tc.desc test IsAdsBlockEnabledForCurPage
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testIsAdsBlockEnabledForCurPage', 0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledForCurPage"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testIsAdsBlockEnabledForCurPage", true, 1003, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0004
     *@tc.name testSetAdsBlockRules
     *@tc.desc test SetAdsBlockRules
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testSetAdsBlockRules', 0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRules"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testSetAdsBlockRules", true, 1004, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0005
     *@tc.name testSetAdsBlockRulesFalse
     *@tc.desc test SetAdsBlockRulesFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testSetAdsBlockRulesFalse', 0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRulesFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testSetAdsBlockRulesFalse", true, 1005, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0006
     *@tc.name testAddAdsBlockDisallowedList
     *@tc.desc test AddAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testAddAdsBlockDisallowedList', 0, async (done: Function) => {
      emitKey = "emitAddAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testAddAdsBlockDisallowedList", true, 1006, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0007
     *@tc.name testRemoveAdsBlockDisallowedList
     *@tc.desc test RemoveAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testRemoveAdsBlockDisallowedList', 0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testRemoveAdsBlockDisallowedList", true, 1007, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0008
     *@tc.name testClearAdsBlockDisallowedList
     *@tc.desc test ClearAdsBlockDisallowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testClearAdsBlockDisallowedList', 0, async (done: Function) => {
      emitKey = "emitClearAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testClearAdsBlockDisallowedList", true, 1008, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0009
     *@tc.name testAddAdsBlockAllowedList
     *@tc.desc test AddAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testAddAdsBlockAllowedList', 0, async (done: Function) => {
      emitKey = "emitAddAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testAddAdsBlockAllowedList", true, 1009, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0010
     *@tc.name testRemoveAdsBlockAllowedList
     *@tc.desc test RemoveAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testRemoveAdsBlockAllowedList', 0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testRemoveAdsBlockAllowedList", true, 1010, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0011
     *@tc.name testClearAdsBlockAllowedList
     *@tc.desc test ClearAdsBlockAllowedList
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testClearAdsBlockAllowedList', 0, async (done: Function) => {
      emitKey = "emitClearAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testClearAdsBlockAllowedList", true, 1011, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0012
     *@tc.name testOnAdsBlocked
     *@tc.desc test OnAdsBlocked
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testOnAdsBlocked', 0, async (done: Function) => {
      emitKey = "emitOnAdsBlocked"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testOnAdsBlocked", true, 1012, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0013
     *@tc.name testEnableAdsBlockFalse
     *@tc.desc test EnableAdsBlockFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testEnableAdsBlockFalse', 0, async (done: Function) => {
      emitKey = "emitEnableAdsBlockFalse"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testEnableAdsBlockFalse", true, 1013, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0014
     *@tc.name testIsAdsBlockEnabledCheck
     *@tc.desc test IsAdsBlockEnabledCheck
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testIsAdsBlockEnabledCheck', 0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledCheck"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testIsAdsBlockEnabledCheck", true, 1014, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /*
     *@tc.number SUB_ACE_WEB_AdsBlockManager_API_0015
     *@tc.name testOnAdsBlockedTest
     *@tc.desc test OnAdsBlockedTest
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level 1
     */
    it('testOnAdsBlockedTest', 0, async (done: Function) => {
      emitKey = "emitOnAdsBlockedTest"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("testOnAdsBlockedTest", true, 1015, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

  })
}
