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
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE = 'MainAbility/pages/listScrollApi/listScrollApi';
const TITLE_ID = 'listApi_title';
const SLEEP_TIME = 500;
const SUITE = 'ListScrollApiTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function ListScrollApiTest() {
  describe('ListScrollApiTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api24.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('listApi_wire');
      AppStorage.delete('listApi_snap_slow');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(600);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }

      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');

      AppStorage.delete('listApi_wire');
      AppStorage.delete('listApi_snap_slow');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_list_api_page_loads_0100
     * @tc.name SUB_arkui_list_scroll_api_list_api_page_loads_0100
     * @tc.desc Test listScrollApi page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_arkui_list_scroll_api_list_api_page_loads_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        expect(!!await Driver.create().findComponent(ON.id(TITLE_ID))).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_wire_get_list_event_flag_0200
     * @tc.name SUB_arkui_list_scroll_api_wire_get_list_event_flag_0200
     * @tc.desc Test UIListEvent setOn* wiring: AppStorage listApi_wire true after wire button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_scroll_api_wire_get_list_event_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const wire = await driver.findComponent(ON.id('listApi_wire'));
        expect(!!wire).assertTrue();
        await (wire?.click() as Promise<void>);
        await Utils.sleep(400);
        expect(AppStorage.get<boolean>('listApi_wire')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_inspector_list_api_body_0300
     * @tc.name SUB_arkui_list_scroll_api_inspector_list_api_body_0300
     * @tc.desc inspector listApi_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_scroll_api_inspector_list_api_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listApi_body')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_inspector_list_api_title_0400
     * @tc.name SUB_arkui_list_scroll_api_inspector_list_api_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node listApi_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_scroll_api_inspector_list_api_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listApi_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_inspector_list_api_wire_0500
     * @tc.name SUB_arkui_list_scroll_api_inspector_list_api_wire_0500
     * @tc.desc inspector listApi_wire
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_scroll_api_inspector_list_api_wire_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listApi_wire')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_scroll_api_list_api_scroll_snap_slow_toggle_0600
     * @tc.name SUB_arkui_list_scroll_api_list_api_scroll_snap_slow_toggle_0600
     * @tc.desc Test List scrollSnapAnimationSpeed: SLOW vs NORMAL toggle AppStorage listApi_snap_slow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_scroll_api_list_api_scroll_snap_slow_toggle_0600',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const snapBtn = await driver.findComponent(ON.id('listApi_toggleSnap'));
        expect(!!snapBtn).assertTrue();
        await (snapBtn?.click() as Promise<void>);
        await Utils.sleep(200);
        expect(AppStorage.get<boolean>('listApi_snap_slow')).assertEqual(true);
        await (snapBtn?.click() as Promise<void>);
        await Utils.sleep(200);
        expect(AppStorage.get<boolean>('listApi_snap_slow')).assertEqual(false);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
