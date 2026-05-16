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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import webview from '@ohos.web.webview'

let testAbilityContext:common.UIAbilityContext;
export default function webViewControllerPart3Test() {

  describe('WebViewControllerPart3', () => {

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsacewebhistoryenhancedtesttwo.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testRestoreWebStateStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RESTOREWEBSTATE_0100
     * @tc.desc   test restoreWebState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRestoreWebStateStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRestoreWebState001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testRestoreWebState001", "index", 100083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testSerializeWebStateErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SERIALIZEWEBSTATE_0100
     * @tc.desc   test serializeWebState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeWebStateErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testSerializeWebStateErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testSerializeWebStateErrorCode001", 17100001, 110083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testResumeMicrophoneErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_RESUMEMICROPHONE_0100
     * @tc.desc   test resumeMicrophone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResumeMicrophoneErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testResumeMicrophoneErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testResumeMicrophoneErrorCode001", 17100001, 120083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testPauseMicrophoneErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_PAUSEMICROPHONE_0100
     * @tc.desc   test pauseMicrophone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPauseMicrophoneErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testPauseMicrophoneErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testPauseMicrophoneErrorCode001", 17100001, 130083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testStopMicrophoneErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_STOPMICROPHONE_0100
     * @tc.desc   test stopMicrophone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopMicrophoneErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testStopMicrophoneErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testStopMicrophoneErrorCode001", 17100001, 140083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testRequestFocusErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_REQUESTFOCUS_0100
     * @tc.desc   test requestFocus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRequestFocusErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRequestFocusErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testRequestFocusErrorCode001", 17100001, 150083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetCustomUserAgentErrorCodeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETCUSTOMUSERAGENT_0100
     * @tc.desc   test getCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCustomUserAgentErrorCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetCustomUserAgentErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetCustomUserAgentErrorCode001", 17100001, 160083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testGetPageHeightErrorCode001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETPAGEHEIGHT_0100
     * @tc.desc   test getPageHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPageHeightErrorCode001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetPageHeightErrorCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testGetPageHeightErrorCode001", 17100001, 101083, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebViewGetRenderProcessModeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETRENDERPROCESSMODE_0100
     * @tc.desc   test getRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetRenderProcessModeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebViewGetRenderProcessMode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebViewGetRenderProcessMode001", 1, 108006, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testWebViewGetRenderProcessModeStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETRENDERPROCESSMODE_0200
     * @tc.desc   test getRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewGetRenderProcessModeStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testWebViewGetRenderProcessMode002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testWebViewGetRenderProcessMode002", 0, 108003, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitWebSiteIsolationModeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SITEISOLATIONMODE_0100
     * @tc.desc   test SiteIsolationMode PARTIAL
     * @tc.type   ENUMVALUE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationModeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitWebSiteIsolationMode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitWebSiteIsolationMode001",webview.SiteIsolationMode.PARTIAL, 20250920, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitWebSiteIsolationModeStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SITEISOLATIONMODE_0200
     * @tc.desc   test SiteIsolationMode STRICT
     * @tc.type   ENUMVALUE
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitWebSiteIsolationModeStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitWebSiteIsolationMode002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitWebSiteIsolationMode002",webview.SiteIsolationMode.STRICT, 20250921, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitAvoidVisibleViewportBottomStatic001
     * @tc.number SUB_ACE_EMITAVOIDVISIBLEVIEWPORTBOTTOM_API_0001
     * @tc.desc   test avoidVisibleViewportBottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitAvoidVisibleViewportBottom001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitAvoidVisibleViewportBottom001", 50, 153920, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitAvoidVisibleViewportBottomErrCodeStatic001
     * @tc.number SUB_ACE_EMITAVOIDVISIBLEVIEWPORTBOTTOM_ERRORCODE_0001
     * @tc.desc   test avoidVisibleViewportBottom errorCode 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomErrCodeStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitAvoidVisibleViewportBottomErrCode001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitAvoidVisibleViewportBottomErrCode001", 17100001, 20250827, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitAvoidVisibleViewportBottomErrCodeStatic002
     * @tc.number SUB_ACE_EMITAVOIDVISIBLEVIEWPORTBOTTOM_ERRORCODE_0002
     * @tc.desc   test avoidVisibleViewportBottom errorCode 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomErrCodeStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitAvoidVisibleViewportBottomErrCode002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitAvoidVisibleViewportBottomErrCode002", 801, 20250910, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   testRestoreWebStateStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ENABLEWHOLEWEBPAGEDRAWUING_01001
     * @tc.desc   test enableWholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRestoreWebStateStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRestoreWebState002", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testRestoreWebState002", "17100001", 1000831, done);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitEnableWholeWebPageDrawingStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_GETRENDERPROCESSMODE_20250830
     * @tc.desc   test getRenderProcessMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitEnableWholeWebPageDrawingStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> =>   {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitEnableWholeWebPageDrawing001", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitEnableWholeWebPageDrawing001", true, 20250830, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.name   emitonSwitchNextStaticPage
     * @tc.number emitonSwitchNextPage21
     * @tc.desc   emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitonSwitchNextStaticPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitonSwitchNextPage', 10);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebViewControllerTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

  })
}
