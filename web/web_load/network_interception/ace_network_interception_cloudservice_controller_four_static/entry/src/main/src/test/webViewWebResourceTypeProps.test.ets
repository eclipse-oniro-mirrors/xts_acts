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
import { Level, Size, TestType, beforeAll, beforeEach, describe, it ,afterEach} from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import { WebNetErrorList } from '@ohos.web.netErrorList'

let emitKey = ""
let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebViewWebResourceTypeProps() {
  describe('ActsAceWebViewWebResourceTypeProps', () => {

    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsacenetworkinterceptioncloudservicecontrollerfourtest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testWebView_webResourceType_MAIN_FRAME
     * @tc.number SUB_ACE_WEB_webResourceType_MAIN_FRAME_0001
     * @tc.desc   test webResourceType MAIN_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_MAIN_FRAME"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_MAIN_FRAME", true, 1343, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_SUB_FRAME
     * @tc.number SUB_ACE_WEB_webResourceType_SUB_FRAME_0001
     * @tc.desc   test webResourceType SUB_FRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_SUB_FRAME',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_SUB_FRAME"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_SUB_FRAME", true, 1344, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_STYLE_SHEET
     * @tc.number SUB_ACE_WEB_webResourceType_STYLE_SHEET_0001
     * @tc.desc   test webResourceType STYLE_SHEET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_STYLE_SHEET"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_STYLE_SHEET", true, 1345, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_SCRIPT
     * @tc.number SUB_ACE_WEB_webResourceType_SCRIPT_0001
     * @tc.desc   test webResourceType SCRIPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_SCRIPT"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_SCRIPT", true, 1346, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_IMAGE
     * @tc.number SUB_ACE_WEB_webResourceType_IMAGE_0001
     * @tc.desc   test webResourceType IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_IMAGE"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_IMAGE", true, 1347, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_FONT_RESOURCE
     * @tc.number SUB_ACE_WEB_webResourceType_FONT_RESOURCE_0001
     * @tc.desc   test webResourceType FONT_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_FONT_RESOURCE"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_FONT_RESOURCE", true, 1348, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_OBJECT
     * @tc.number SUB_ACE_WEB_webResourceType_OBJECT_0001
     * @tc.desc   test webResourceType OBJECT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_OBJECT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_OBJECT"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_OBJECT", true, 1349, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_MEDIA
     * @tc.number SUB_ACE_WEB_webResourceType_MEDIA_0001
     * @tc.desc   test webResourceType MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_MEDIA"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_MEDIA", true, 1350, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_WORKER
     * @tc.number SUB_ACE_WEB_webResourceType_WORKER_0001
     * @tc.desc   test webResourceType WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_WORKER"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_WORKER", true, 1351, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_SHARED_WORKER
     * @tc.number SUB_ACE_WEB_webResourceType_SHARED_WORKER_0001
     * @tc.desc   test webResourceType SHARED_WORKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_SHARED_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_SHARED_WORKER"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_SHARED_WORKER", true, 1352, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_PREFETCH
     * @tc.number SUB_ACE_WEB_webResourceType_PREFETCH_0001
     * @tc.desc   test webResourceType PREFETCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_PREFETCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_PREFETCH"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_PREFETCH", true, 1353, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_FAVICON
     * @tc.number SUB_ACE_WEB_webResourceType_FAVICON_0001
     * @tc.desc   test webResourceType FAVICON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_FAVICON"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_FAVICON", true, 1354, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })
    /**
     * @tc.name   testWebView_webResourceType_XHR
     * @tc.number SUB_ACE_WEB_webResourceType_XHR_0001
     * @tc.desc   test webResourceType XHR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_XHR"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_XHR", true, 1355, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })
    /**
     * @tc.name   testWebView_webResourceType_PING
     * @tc.number SUB_ACE_WEB_webResourceType_PING_0001
     * @tc.desc   test webResourceType PING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_PING',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_PING"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_PING", true, 1356, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_CSP_REPORT
     * @tc.number SUB_ACE_WEB_webResourceType_CSP_REPORT_0001
     * @tc.desc   test webResourceType CSP_REPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_CSP_REPORT',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_CSP_REPORT"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_CSP_REPORT", true, 1357, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })

    /**
     * @tc.name   testWebView_webResourceType_Other_Props
     * @tc.number SUB_ACE_WEB_webResourceType_Other_Props_0001
     * @tc.desc   test webResourceType Other_Props
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebView_webResourceType_Other_Props', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      emitKey = "emitWebView_webResourceType_Other_Props"
      await Utils.msSleep(2000)
      Utils.emitEvent(emitKey, 10);
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebView_webResourceType_Other_Props", true, 1358, done);
      inspector.sendEventByKey('webViewWebResourceTypeProps', 10, '');
      await Utils.msSleep(2000)
      done()
    })
  })
}
