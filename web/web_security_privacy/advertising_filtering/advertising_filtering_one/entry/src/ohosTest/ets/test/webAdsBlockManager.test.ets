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
import wifiMg from '@ohos.wifiManager';

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
        console.info('get webAdsBlockManager state success ' + JSON.stringify(pages));
        if (!("webAdsBlockManager" == pages.name)) {
          console.info('get webAdsBlockManager state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webAdsBlockManager state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webAdsBlockManager page error:' + err);
      }
      await driver.waitForComponent(ON.id("webViewSdkSchemeHandler"), 10000);
      console.log('waitForComponent webViewSdkSchemeHandler');
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      done();
    })

    /**
     * @tc.name   testIsAdsBlockEnableForCurPageFalse
     * @tc.number SUB_ACE_WEB_IsAdsBlockEnableForCurPage_return_false
     * @tc.desc   test isAdsBlockEnableForCurPage return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsAdsBlockEnableForCurPageFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testIsAdsBlockEnableForCurPageFalse", 161050);
      Utils.registerBaseEvent('testIsAdsBlockEnableForCurPageFalse', false, 25102201, done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected)
        })
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testEnableAdsBlock
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0001
     * @tc.desc   test EnableAdsBlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdsBlock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: Function) => {
      emitKey = "emitEnableAdsBlock"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testEnableAdsBlock", true, 161060, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testIsAdsBlockEnabled
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0002
     * @tc.desc   test IsAdsBlockEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAdsBlockEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabled"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabled", true, 161070, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testIsAdsBlockEnabledForCurPage
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0003
     * @tc.desc   test IsAdsBlockEnabledForCurPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAdsBlockEnabledForCurPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledForCurPage"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabledForCurPage", true, 161080, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testSetAdsBlockRules
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0004
     * @tc.desc   test SetAdsBlockRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAdsBlockRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRules"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testSetAdsBlockRules", true, 161090, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testSetAdsBlockRulesFalse
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0005
     * @tc.desc   test SetAdsBlockRulesFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAdsBlockRulesFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetAdsBlockRulesFalse"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testSetAdsBlockRulesFalse", true, 161100, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testAddAdsBlockDisallowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0006
     * @tc.desc   test AddAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAddAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testAddAdsBlockDisallowedList", true, 161110, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testRemoveAdsBlockDisallowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0007
     * @tc.desc   test RemoveAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testRemoveAdsBlockDisallowedList", true, 161120, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testClearAdsBlockDisallowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0008
     * @tc.desc   test ClearAdsBlockDisallowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAdsBlockDisallowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearAdsBlockDisallowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testClearAdsBlockDisallowedList", true, 161130, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testAddAdsBlockAllowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0009
     * @tc.desc   test AddAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitAddAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testAddAdsBlockAllowedList", true, 161140, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testRemoveAdsBlockAllowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0010
     * @tc.desc   test RemoveAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRemoveAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testRemoveAdsBlockAllowedList", true, 161150, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testClearAdsBlockAllowedList
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0011
     * @tc.desc   test ClearAdsBlockAllowedList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearAdsBlockAllowedList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearAdsBlockAllowedList"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testClearAdsBlockAllowedList", true, 161160, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testOnAdsBlocked
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0012
     * @tc.desc   test OnAdsBlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnAdsBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnAdsBlocked"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testOnAdsBlocked", true, 161170, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testEnableAdsBlockFalse
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0013
     * @tc.desc   test EnableAdsBlockFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableAdsBlockFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async (done: Function) => {
      emitKey = "emitEnableAdsBlockFalse"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testEnableAdsBlockFalse", true, 161180, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testIsAdsBlockEnabledCheck
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0014
     * @tc.desc   test IsAdsBlockEnabledCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsAdsBlockEnabledCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitIsAdsBlockEnabledCheck"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testIsAdsBlockEnabledCheck", false, 161190, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

    /**
     * @tc.name   testOnAdsBlockedTest
     * @tc.number SUB_ACE_WEB_AdsBlockManager_API_0015
     * @tc.desc   test OnAdsBlockedTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnAdsBlockedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnAdsBlockedTest"
      Utils.emitEvent(emitKey, 161050);
      Utils.registerEvent("testOnAdsBlockedTest", true, 161200, done);
      sendEventByKey('webViewSdkSchemeHandler', 10, '');
    })

  })
}
