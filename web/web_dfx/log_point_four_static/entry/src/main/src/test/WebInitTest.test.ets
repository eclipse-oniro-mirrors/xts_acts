/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import { UIContext, Router } from '@ohos.arkui.UIContext'
let testAbilityContext:common.UIAbilityContext;
export default function webInitTest() {
  describe('webInitTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.logpointfourtest.static')
      await Utils.msSleep(5000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name        testPrefetchPageInitErrStatic
    * @tc.number      SUB_WEB_PREFETCH_PAGE
    * @tc.desc        test interface of prefetchPage with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPrefetchPageInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrefetchPageInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPrefetchPageInitErr", 17100001, 110700, done);
      Utils.registerEvent("testPrefetchPageInitErr", "Init error. The WebviewController must be associated with a Web component", 110710, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPrefetchPageInitErrStatic002
    * @tc.number      SUB_WEB_PREFETCH_PAGE_002
    * @tc.desc        test interface of prefetchPage with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPrefetchPageInitErrStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrefetchPageInitErr002', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPrefetchPageInitErr002", 17100001, 110701, done);
      Utils.registerEvent("testPrefetchPageInitErr002", "Init error. The WebviewController must be associated with a Web component", 110711, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testCreateWebPrintDocumentAdapterInitErrStatic
    * @tc.number      SUB_WEB_CREATE_WEB_PRINT_DOCUMENT_ADAPTER_ERR
    * @tc.desc        test interface of createWebPrintDocumentAdapter with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testCreateWebPrintDocumentAdapterInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitCreateWebPrintDocumentAdapterInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", 17100001, 110720, done);
      Utils.registerEvent("testCreateWebPrintDocumentAdapterInitErr", "Init error. The WebviewController must be associated with a Web component", 110730, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testSetScrollableInitErrStatic
    * @tc.number      SUB_WEB_SET_SCROLLABLE
    * @tc.desc        test interface of setScrollable with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSetScrollableInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetScrollableInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testSetScrollableInitErr", 17100001, 110740, done);
      Utils.registerEvent("testSetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 110750, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testGetScrollableInitErrStatic
    * @tc.number      SUB_WEB_GET_SCROLLABLE
    * @tc.desc        test interface of getScrollable with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testGetScrollableInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetScrollableInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetScrollableInitErr", 17100001, 110760, done);
      Utils.registerEvent("testGetScrollableInitErr", "Init error. The WebviewController must be associated with a Web component", 110770, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testGetPrintBackgroundInitErrStatic
    * @tc.number      SUB_WEB_GET_PRINT_BACKGROUND
    * @tc.desc        test interface of getPrintBackground with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testGetPrintBackgroundInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetPrintBackgroundInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetPrintBackgroundInitErr", 17100001, 110800, done);
      Utils.registerEvent("testGetPrintBackgroundInitErr", "Init error. The WebviewController must be associated with a Web component", 110810, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testCloseCameraInitErrStatic
    * @tc.number      SUB_WEB_CLOSE_CAMERA
    * @tc.desc        test interface of closeCamera with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testCloseCameraInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitCloseCameraInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testCloseCameraInitErr", 17100001, 110860, done);
      Utils.registerEvent("testCloseCameraInitErr", "Init error. The WebviewController must be associated with a Web component", 110870, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testStopAllMediaInitErrStatic
    * @tc.number      SUB_WEB_STOP_ALL_MEDIA
    * @tc.desc        test interface of stopAllMedia with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testStopAllMediaInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitStopAllMediaInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testStopAllMediaInitErr", 17100001, 110920, done);
      Utils.registerEvent("testStopAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110930, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testResumeAllMediaInitErrStatic
    * @tc.number      SUB_WEB_RESUME_ALL_MEDIA
    * @tc.desc        test interface of resumeAllMedia with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testResumeAllMediaInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitResumeAllMediaInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testResumeAllMediaInitErr", 17100001, 110940, done);
      Utils.registerEvent("testResumeAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110950, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPauseAllMediaInitErrStatic
    * @tc.number      SUB_WEB_PAUSE_ALL_MEDIA_001
    * @tc.desc        test interface of pauseAllMedia with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPauseAllMediaInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPauseAllMediaInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPauseAllMediaInitErr", 17100001, 110960, done);
      Utils.registerEvent("testPauseAllMediaInitErr", "Init error. The WebviewController must be associated with a Web component", 110970, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testCloseAllMediaPresentationsInitErrStatic
    * @tc.number      SUB_WEB_CLOSE_ALL_MEDIA_PRESENTATIONS
    * @tc.desc        test interface of closeAllMediaPresentations with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testCloseAllMediaPresentationsInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitCloseAllMediaPresentationsInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", 17100001, 110980, done);
      Utils.registerEvent("testCloseAllMediaPresentationsInitErr", "Init error. The WebviewController must be associated with a Web component", 110990, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testGetMediaPlaybackStateInitErrStatic
    * @tc.number      SUB_WEB_GET_MEDIA_PLAYBACK_STATE
    * @tc.desc        test interface of getMediaPlaybackState with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testGetMediaPlaybackStateInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetMediaPlaybackStateInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", 17100001, 111000, done);
      Utils.registerEvent("testGetMediaPlaybackStateInitErr", "Init error. The WebviewController must be associated with a Web component", 111010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testPrecompileJavaScriptInitErrStatic
    * @tc.number      SUB_WEB_PRECOMPILE_JAVA_SCRIPT_Err
    * @tc.desc        test interface of precompileJavaScript with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testPrecompileJavaScriptInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitPrecompileJavaScriptInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testPrecompileJavaScriptInitErr", true, 111040, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testSetPathAllowingUniversalAccessInitErrStatic
    * @tc.number      SUB_WEB_SET_PATH_ALLOWING_UNIVERSAL_ACCESS
    * @tc.desc        test interface of setPathAllowingUniversalAccess with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testSetPathAllowingUniversalAccessInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitSetPathAllowingUniversalAccessInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", 17100001, 111060, done);
      Utils.registerEvent("testSetPathAllowingUniversalAccessInitErr", "Init error. The WebviewController must be associated with a Web component", 111070, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testGetLastHitTestInitErrStatic
    * @tc.number      SUB_WEB_GET_LAST_HIT_TEST
    * @tc.desc        test interface of getLastHitTest with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testGetLastHitTestInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetLastHitTestInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetLastHitTestInitErr", 17100001, 111100, done);
      Utils.registerEvent("testGetLastHitTestInitErr", "Init error. The WebviewController must be associated with a Web component", 111110, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name        testGetPageOffsetTestInitErrStatic
    * @tc.number      SUB_WEB_GET_PAGE_OFFSET
    * @tc.desc        test interface of getPageOffset with not been associated with specific Web Components
    * @tc.size        MediumTest
    * @tc.type        Function
    * @tc.level       LEVEL0
    */
    it('testGetPageOffsetTestInitErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitGetPageOffsetTestInitErr', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent("testGetPageOffsetTestInitErr", 17100001, 111120, done);
      Utils.registerEvent("testGetPageOffsetTestInitErr", "Init error. The WebviewController must be associated with a Web component", 111130, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webViewContCreatePdfAndOthersErrorButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}