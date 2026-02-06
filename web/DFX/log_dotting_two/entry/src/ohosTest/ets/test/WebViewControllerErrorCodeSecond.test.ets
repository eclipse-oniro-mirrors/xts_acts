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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 115550;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerErrorCodeSecond() {

  describe('WebViewControllerErrorCodeSecondTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewControllerErrorCodeSecond',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewControllerErrorCodeSecond state success " + JSON.stringify(pages));
        if (!("webViewControllerErrorCode" == pages.name)) {
          console.info("get webViewControllerErrorCodeSecond state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewControllerErrorCodeSecond page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewControllerErrorCodeSecond page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerErrorCodeSecondButton"), 10000);
      console.log("WebViewControllerErrorCodeSecondButton webView");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewControllerErrorCodeSecond beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADDATA_0100
    * @tc.name       : testLoadDataFullParamsError001
    * @tc.desc       : test loadData error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadDataFullParamsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadDataFullParamsError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testLoadDataFullParamsError001", '17100001', 115560, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ISINCOGNITOMODE_0100
    * @tc.name       : testIsIncognitoModeError001
    * @tc.desc       : test isIncognitoMode error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsIncognitoModeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsIncognitoModeError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testIsIncognitoModeError001", '17100001', 115570, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
   * @tc.number     : SUB_WEB_ERRORCODE_GETLASTJAVASCRIPTPROXYCALLINGFRAMEURL_0100
   * @tc.name       : testGetLastJavascriptProxyCallingFrameUrlError001
   * @tc.desc       : test getLastJavascriptProxyCallingFrameUrl error
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testGetLastJavascriptProxyCallingFrameUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetLastJavascriptProxyCallingFrameUrlError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetLastJavascriptProxyCallingFrameUrlError001", '17100001', 115580, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_SETWEBSCHEMEHANDLER_0100
    * @tc.name       : testSetWebSchemeHandlerError001
    * @tc.desc       : test setWebSchemeHandler error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testSetWebSchemeHandlerError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testSetWebSchemeHandlerError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testSetWebSchemeHandlerError001", '17100001', 115590, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ClEARWEBSCHEMEHANDLER_0100
    * @tc.name       : testClearWebSchemeHandlerError001
    * @tc.desc       : test clearWebSchemeHandler error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testClearWebSchemeHandlerError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testClearWebSchemeHandlerError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testClearWebSchemeHandlerError001", '17100001', 115600, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ENABLEINTELLIGENTTRACKINGPREVENTION_0100
    * @tc.name       : testEnableIntelligentTrackingPreventionError001
    * @tc.desc       : test enableIntelligentTrackingPrevention error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEnableIntelligentTrackingPreventionError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testEnableIntelligentTrackingPreventionError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testEnableIntelligentTrackingPreventionError001", '17100001', 115610, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ISINTELLIGENTTRACKINGPREVENTIONENABLED_0100
    * @tc.name       : testIsIntelligentTrackingPreventionEnabled001
    * @tc.desc       : test isIntelligentTrackingPreventionEnabled error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testIsIntelligentTrackingPreventionEnabled001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testIsIntelligentTrackingPreventionEnabled001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testIsIntelligentTrackingPreventionEnabled001", '17100001', 115620, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_REMOVEINTELLIGENTTRACKINGPREVENTIONBYPASSINGLIST_0100
    * @tc.name       : testRemoveIntelligentTrackingPreventionBypassingListError001
    * @tc.desc       : test removeIntelligentTrackingPreventionBypassingList error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRemoveIntelligentTrackingPreventionBypassingListError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testRemoveIntelligentTrackingPreventionBypassingListError001", '401', 115630, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_GETDEFAULTUSERAGENT_0100
    * @tc.name       : testGetDefaultUserAgent001
    * @tc.desc       : test getDefaultUserAgent
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testGetDefaultUserAgent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGetDefaultUserAgent001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testGetDefaultUserAgent001", true, 115640, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_ENABLEADSBLOCK_0100
    * @tc.name       : testEnableAdsBlockError001
    * @tc.desc       : test enableAdsBlock error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEnableAdsBlockError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testEnableAdsBlockError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testEnableAdsBlockError001", '17100001', 115650, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })

    /*
    * @tc.number     : SUB_WEB_ERRORCODE_LOADURL_0100
    * @tc.name       : testLoadUrlError001
    * @tc.desc       : test loadUrl error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrlError001", EVENT_ID_SET_EMIT_KEY);
      Utils.registerEvent("testLoadUrlError001", '17100002', 115660, done);
      await Utils.waitAndClickComponent(driver, "WebViewControllerErrorCodeSecondButton");
    })
  })
}