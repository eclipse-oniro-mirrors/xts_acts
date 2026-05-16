/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitWebViewCookieTrack"

export default function ActsAcewebViewCookieTrack() {
  describe('ActsAcewebViewCookieTrack', () :void=> {

    beforeAll(async (): Promise<void> => {

    });
    beforeEach(async () => {
      console.info("web beforeEach start");

    })

    /**
     * @tc.name        testRemoveIntelligentTrackingPreventionBypassingListError001
     * @tc.number      SUB_WEB_ERRORCODE_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0100
     * @tc.desc        test removeIntelligentTrackingPreventionBypassingList error
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", '401', 202503208, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /**
     * @tc.name        testRemoveIntelligentTrackingPreventionBypassingListError002
     * @tc.number      SUB_WEB_ERRORCODE_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0200
     * @tc.desc        test removeIntelligentTrackingPreventionBypassingList error
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('testRemoveIntelligentTrackingPreventionBypassingListError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testRemoveIntelligentTrackingPreventionBypassingListError002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testRemoveIntelligentTrackingPreventionBypassingListError002", true, 12823182, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /**
     * @tc.name   testCookieTrackClearTrackingPreventionStatic
     * @tc.number SUB_ACE_WEB_clearIntelligentTrackingPreventionByPassingList_API_0005
     * @tc.desc   test clearIntelligentTrackingPreventionByPassingList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCookieTrackClearTrackingPreventionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "emitCookieTrackClearTrackingPrevention";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testCookieTrackClearTrackingPrevention", true, 1282, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /**
     * @tc.name   testCookieTrackClearTrackingPreventionStatic02
     * @tc.number SUB_ACE_WEB_clearIntelligentTrackingPreventionByPassingList_API_0006
     * @tc.desc   test clearIntelligentTrackingPreventionByPassingList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCookieTrackClearTrackingPreventionStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "emitCookieTrackClearTrackingPrevention02";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testCookieTrackClearTrackingPrevention02", true, 12823181, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /**
     * @tc.name   testNmErrorCode
     * @tc.number SUB_ACE_WEB_NM_ERROR_CODE_API_000
     * @tc.desc   test clearNmErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNmErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      let emitKey = "emitNmErrorCode";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testNmErrorCode", true, 12823183, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
      await Utils.msSleep(10000);
      done();
    })

    /**
     * @tc.name   emitonSwitchNextStaticPage
     * @tc.number emitonSwitchNextStaticPage_002
     * @tc.desc   test emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextStaticPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewCookieTrackTriggerButton', 10, '');
        await Utils.msSleep(5000)
        done();
      })

  })
}

