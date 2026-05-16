/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { TabsNestedScrollMode } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;

export default function TabsNestedTest() {
  describe('TabsNestedTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.tabsNested.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabsNested/TabsNestedIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('[ARKUI_NEW] TabsNestedTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'TabsNestedIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('[ARKUI_NEW] TabsNestedTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest afterEach start');
      await Utils.sleep(SLEEP_TIME);
      console.info('[ARKUI_NEW] TabsNestedTest afterEach end');
    });

    /**
     * @tc.number SUB_ARKUI_ACE_TABSNESTED_0100
     * @tc.name tabsNestedSelfOnlyEnum
     * @tc.desc TabsNestedScrollMode.SELF_ONLY equals 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsNestedSelfOnlyEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnlyEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(TabsNestedScrollMode.SELF_ONLY).assertEqual(0);
        console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnlyEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnlyEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_TABSNESTED_0200
     * @tc.name tabsNestedSelfFirstEnum
     * @tc.desc TabsNestedScrollMode.SELF_FIRST equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsNestedSelfFirstEnum', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirstEnum START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        expect(TabsNestedScrollMode.SELF_FIRST).assertEqual(1);
        console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirstEnum END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirstEnum error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_TABSNESTED_0300
     * @tc.name tabsNestedSelfOnly
     * @tc.desc Inspector: Tabs with nestedScroll(SELF_ONLY)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsNestedSelfOnly', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnly START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('tabsNestedSelfOnly');
        console.info('[ARKUI_NEW] tabsNestedSelfOnly strJson = ' + strJson);
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnly END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfOnly error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_TABSNESTED_0400
     * @tc.name tabsNestedSelfFirst
     * @tc.desc Inspector: Tabs with nestedScroll(SELF_FIRST)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsNestedSelfFirst', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirst START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('tabsNestedSelfFirst');
        console.info('[ARKUI_NEW] tabsNestedSelfFirst strJson = ' + strJson);
        let node = JSON.parseJsonElement(strJson);
        expect(node != null && node != undefined).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null && attrs != undefined).assertTrue();
        console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirst END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TabsNestedTest execute: tabsNestedSelfFirst error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_ACE_TABSNESTED_0500
     * @tc.name tabsNestedUndefined
     * @tc.desc Inspector: Tabs with nestedScroll(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsNestedUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('tabsNestedUndefined');
        let node = JSON.parseJsonElement(strJson);
        expect(node != null).assertTrue();
        let attrs = node.getElement('$attrs');
        expect(attrs != null).assertTrue();
        console.info('[ARKUI_NEW] tabsNestedUndefined attrs exist, strJson length = ' + strJson.length);
        console.info('[ARKUI_NEW] TabsNestedTest execute: tabsNestedUndefined END');
        done();
      } catch (error) {
        console.error('[ARKUI_NEW] TabsNestedTest execute: tabsNestedUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });
  });
}
