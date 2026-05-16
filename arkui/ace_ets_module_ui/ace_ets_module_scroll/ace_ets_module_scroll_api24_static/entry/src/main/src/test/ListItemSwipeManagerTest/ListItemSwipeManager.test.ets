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

const PAGE = 'MainAbility/pages/listItemSwipeManager/listItemSwipeManager';
const TITLE_ID = 'listSwipe_title';
const SLEEP_TIME = 500;
const SUITE = 'ListItemSwipeManagerTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function ListItemSwipeManagerTest() {
  describe('ListItemSwipeManagerTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api24.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('listSwipe_ok');
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

      AppStorage.delete('listSwipe_ok');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_list_item_swipe_manager_list_swipe_page_loads_0100
     * @tc.name SUB_arkui_list_item_swipe_manager_list_swipe_page_loads_0100
     * @tc.desc Test listItemSwipeManager page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_item_swipe_manager_list_swipe_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
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
     * @tc.number SUB_arkui_list_item_swipe_manager_expand_collapse_api_ok_0200
     * @tc.name SUB_arkui_list_item_swipe_manager_expand_collapse_api_ok_0200
     * @tc.desc Test ListItemSwipeActionDirection START/END expand-collapse API AppStorage flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_item_swipe_manager_expand_collapse_api_ok_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('listSwipe_btn'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        expect(AppStorage.get<boolean>('listSwipe_ok')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_item_swipe_manager_inspector_list_swipe_item_0300
     * @tc.name SUB_arkui_list_item_swipe_manager_inspector_list_swipe_item_0300
     * @tc.desc Test inspector.getInspectorByKey: node listSwipe_item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_item_swipe_manager_inspector_list_swipe_item_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listSwipe_item')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_item_swipe_manager_inspector_list_swipe_list_0400
     * @tc.name SUB_arkui_list_item_swipe_manager_inspector_list_swipe_list_0400
     * @tc.desc inspector listSwipe_list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_item_swipe_manager_inspector_list_swipe_list_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listSwipe_list')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_list_item_swipe_manager_inspector_list_swipe_title_0500
     * @tc.name SUB_arkui_list_item_swipe_manager_inspector_list_swipe_title_0500
     * @tc.desc Test inspector.getInspectorByKey: node listSwipe_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_list_item_swipe_manager_inspector_list_swipe_title_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('listSwipe_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
