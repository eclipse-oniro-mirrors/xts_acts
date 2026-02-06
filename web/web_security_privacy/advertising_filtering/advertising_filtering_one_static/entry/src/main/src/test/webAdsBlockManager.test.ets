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

import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { beforeAll, beforeEach, TestType,afterEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
let emitKey = ""
let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebAdsBlockManager() {
  describe('ActsAceWebAdsBlockManager', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.advertisingfilteringonetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });
    /**
     * @tc.name   testEnableAdsBlockStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0001
     * @tc.desc   test EnableAdsBlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdsBlockStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitEnableAdsBlock"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testEnableAdsBlock", true, 1001, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsAdsBlockEnabledStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0002
     * @tc.desc   test IsAdsBlockEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsAdsBlockEnabledStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitIsAdsBlockEnabled"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsAdsBlockEnabled", true, 1002, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsAdsBlockEnabledForCurPageStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0003
     * @tc.desc   test IsAdsBlockEnabledForCurPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsAdsBlockEnabledForCurPageStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitIsAdsBlockEnabledForCurPage"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsAdsBlockEnabledForCurPage", true, 1003, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSetAdsBlockRulesStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0004
     * @tc.desc   test SetAdsBlockRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAdsBlockRulesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
      await Utils.msSleep(2000);
      emitKey = "emitSetAdsBlockRules"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSetAdsBlockRules", true, 1004, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testSetAdsBlockRulesFalseStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0005
     * @tc.desc   test SetAdsBlockRulesFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAdsBlockRulesFalseStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
      await Utils.msSleep(2000);
      emitKey = "emitSetAdsBlockRulesFalse"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testSetAdsBlockRulesFalse", true, 1005, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAddAdsBlockDisallowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0006
     * @tc.desc   test AddAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddAdsBlockDisallowedListStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
      await Utils.msSleep(2000);
      emitKey = "emitAddAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testAddAdsBlockDisallowedList", true, 1006, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testRemoveAdsBlockDisallowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0007
     * @tc.desc   test RemoveAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveAdsBlockDisallowedListStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitRemoveAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testRemoveAdsBlockDisallowedList", true, 1007, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testClearAdsBlockDisallowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0008
     * @tc.desc   test ClearAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearAdsBlockDisallowedListStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitClearAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearAdsBlockDisallowedList", true, 1008, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testAddAdsBlockAllowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0009
     * @tc.desc   test AddAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAddAdsBlockAllowedListStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitAddAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testAddAdsBlockAllowedList", true, 1009, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testRemoveAdsBlockAllowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0010
     * @tc.desc   test RemoveAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveAdsBlockAllowedListStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitRemoveAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testRemoveAdsBlockAllowedList", true, 1010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testClearAdsBlockAllowedListStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0011
     * @tc.desc   test ClearAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearAdsBlockAllowedListStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
      await Utils.msSleep(2000);
      emitKey = "emitClearAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testClearAdsBlockAllowedList", true, 1011, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })


    /**
     * @tc.name   testEnableAdsBlockFalseStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0013
     * @tc.desc   test EnableAdsBlockFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnableAdsBlockFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitEnableAdsBlockFalse"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testEnableAdsBlockFalse", true, 1013, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testIsAdsBlockEnabledCheckStatic
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0014
     * @tc.desc   test IsAdsBlockEnabledCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsAdsBlockEnabledCheckStatic',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      emitKey = "emitIsAdsBlockEnabledCheck"
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testIsAdsBlockEnabledCheck", true, 1014, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
      await Utils.msSleep(2000);
      done();
    })
  })
}
