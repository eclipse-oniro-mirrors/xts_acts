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
import { Driver, ON, MatchPattern } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const PAGE = 'MainAbility/pages/navigationNavDestination/navigationNavDestination';
const TITLE_ID = 'navNd_title';
const SLEEP_TIME = 500;
const SUITE = 'NavigationNavDestinationTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function NavigationNavDestinationTest() {
  describe('NavigationNavDestinationTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('navNd_mode');
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

      AppStorage.delete('navNd_mode');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_navigation_nav_destination_nav_nd_page_loads_0100
     * @tc.name SUB_arkui_navigation_nav_destination_nav_nd_page_loads_0100
     * @tc.desc Test navigationNavDestination page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_navigation_nav_destination_nav_nd_page_loads_0100',
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
     * @tc.number SUB_arkui_navigation_nav_destination_on_ready_mode_0200
     * @tc.name SUB_arkui_navigation_nav_destination_on_ready_mode_0200
     * @tc.desc Test NavDestination onReady: AppStorage navNd_mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_navigation_nav_destination_on_ready_mode_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        await Utils.sleep(500);
        const m = AppStorage.get<string>('navNd_mode');
        if(m){
          expect(!!(m != undefined && m.length > 0)).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }

      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
      }
    });

    /**
     * @tc.number SUB_arkui_navigation_nav_destination_inspector_nav_nd_body_0300
     * @tc.name SUB_arkui_navigation_nav_destination_inspector_nav_nd_body_0300
     * @tc.desc inspector navNd_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_navigation_nav_destination_inspector_nav_nd_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('navNd_body')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_navigation_nav_destination_inspector_nav_nd_title_0400
     * @tc.name SUB_arkui_navigation_nav_destination_inspector_nav_nd_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node navNd_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_navigation_nav_destination_inspector_nav_nd_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('navNd_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_navigation_nav_destination_driver_find_page_text_0500
     * @tc.name SUB_arkui_navigation_nav_destination_driver_find_page_text_0500
     * @tc.desc Test Driver.findComponent: NavDestination page label text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_navigation_nav_destination_driver_find_page_text_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        let t = await d.findComponent(ON.text('page', MatchPattern.EQUALS));
        if (!t) {
          t = await d.findComponent(ON.text('page', MatchPattern.CONTAINS));
        }
        expect(!!t).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
