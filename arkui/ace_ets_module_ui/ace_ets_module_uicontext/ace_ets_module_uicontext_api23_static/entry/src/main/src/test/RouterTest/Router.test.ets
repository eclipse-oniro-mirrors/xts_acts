/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME = 1000;

export default function RouterTest() {
  describe('RouterTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("[ARKUI_NEW] RouterTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.uicontext.api23.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] RouterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/routerTest/routerTest',
      };
      try {
        await Utils.sleep(500);
        const routerInstance = AppStorage.get<Router>("router");
        if (routerInstance) {
          routerInstance.clear();
          let pages = routerInstance.getState();
          console.info("[ARKUI_NEW] RouterTest state pages: " + JSON.stringify(pages));
          if (!('TextLineSpacing' == pages.name)) {
            routerInstance.replaceUrl(options);
          }
        }
        await Utils.sleep(1500);
      } catch (err) {
        console.error("[ARKUI_NEW] RouterTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info("[ARKUI_NEW] RouterTest afterEach start");
      // Only clear keys used by this case; do not remove 'router' to avoid affecting others
      if (AppStorage.get<Router>('routerForTest') != undefined) {
        AppStorage.delete('routerForTest');
      }
      await Utils.sleep(SLEEP_TIME);
      console.info("[ARKUI_NEW] RouterTest afterEach end");
    });

    /**
     * @tc.number RouterTest_001
     * @tc.name routerClear
     * @tc.desc Test Router method: clear，用例内直接调用接口，不依托页面
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('routerClear', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RouterTest execute: routerClear START');
      try {
        const routerInstance = AppStorage.get<Router>('routerForTest');
        expect(routerInstance !== undefined).assertTrue();
        if (routerInstance) {
          routerInstance.clear();
          console.info('[ARKUI_NEW] RouterTest router.clear() succeeded');
        }
        console.info('[ARKUI_NEW] RouterTest execute: routerClear END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RouterTest execute: routerClear error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number RouterTest_002
     * @tc.name routerGetStackSize
     * @tc.desc Test Router method: getStackSize; call API in case, no page dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('routerGetStackSize', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] RouterTest execute: routerGetStackSize START');
      try {
        const routerInstance = AppStorage.get<Router>('routerForTest');
        expect(routerInstance !== undefined).assertTrue();
        if (routerInstance) {
          let stackSize: number = routerInstance.getStackSize();
          console.info('[ARKUI_NEW] RouterTest router.getStackSize() = ' + stackSize);
          expect(stackSize >= 0).assertTrue();
        }
        console.info('[ARKUI_NEW] RouterTest execute: routerGetStackSize END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] RouterTest execute: routerGetStackSize error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
