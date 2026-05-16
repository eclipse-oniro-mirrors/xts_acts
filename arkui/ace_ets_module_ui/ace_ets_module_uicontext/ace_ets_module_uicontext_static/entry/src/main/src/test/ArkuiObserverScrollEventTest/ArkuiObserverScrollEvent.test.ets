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

const PAGE = 'MainAbility/pages/arkuiObserverScrollEvent/arkuiObserverScrollEvent';
const TITLE_ID = 'obsScroll_title';
const SLEEP_TIME = 500;
const ROUTE_SETTLE_MS = 800;
const SUITE = 'ArkuiObserverScrollEventTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

export default function ArkuiObserverScrollEventTest() {
  describe('ArkuiObserverScrollEventTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start | startAbility');
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      console.info("ArkuiObserverScrollEventTest beforeEach start");
      AppStorage.delete('obsScroll_axis');
      AppStorage.delete('obsScroll_axis_cb');
      if (AppStorage.get<boolean>('obsScroll_page_mounted') != undefined) {
        AppStorage.delete('obsScroll_page_mounted');
      }
      let options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("ArkuiObserverScrollEventTest state pages: " + JSON.stringify(pages));
        console.info("ArkuiObserverScrollEventTest state pages.name: " + pages.name);
        routerInstance.replaceUrl(options);
        await Utils.sleep(ROUTE_SETTLE_MS);
      } catch (err) {
        console.error("ArkuiObserverScrollEventTest replaceUrl error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start | cleanup AppStorage');
      AppStorage.delete('obsScroll_axis');
      AppStorage.delete('obsScroll_axis_cb');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_observer_scroll_event_obs_scroll_page_loads_0100
     * @tc.name SUB_arkui_observer_scroll_event_obs_scroll_page_loads_0100
     * @tc.desc Test arkuiObserverScrollEvent page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_observer_scroll_event_obs_scroll_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName = 'obsScroll_pageLoads';
      arkuiNewLog(SUITE, 'execute', `${caseName} START`);
      try {
        arkuiNewLog(SUITE, 'step', `${caseName} | Driver.findComponent id=${TITLE_ID}`);
        const found = !!await Driver.create().findComponent(ON.id(TITLE_ID));
        arkuiNewLog(SUITE, 'step', `${caseName} | findComponent result=${found}`);
        expect(found).assertTrue();
        arkuiNewLog(SUITE, 'execute', `${caseName} END ok`);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', `${caseName} FAIL | ${e}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_observer_scroll_event_on_scroll_event_axis_sample_written_0200
     * @tc.name SUB_arkui_observer_scroll_event_on_scroll_event_axis_sample_written_0200
     * @tc.desc Test UIObserver.onScrollEvent: button click writes AppStorage obsScroll_axis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_observer_scroll_event_on_scroll_event_axis_sample_written_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName = 'onScrollEvent_axis_sample_written';
      arkuiNewLog(SUITE, 'execute', `${caseName} START`);
      try {
        const driver = Driver.create();
        arkuiNewLog(SUITE, 'step', `${caseName} | findComponent obsScroll_btn`);
        const btn = await driver.findComponent(ON.id('obsScroll_btn'));
        arkuiNewLog(SUITE, 'step', `${caseName} | btn found=${!!btn}`);
        expect(!!btn).assertTrue();
        arkuiNewLog(SUITE, 'step', `${caseName} | click obsScroll_btn`);
        await btn!.click();
        await Utils.sleep(300);
        const axis = AppStorage.get<string>('obsScroll_axis');
        if(axis){
          arkuiNewLog(SUITE, 'step', `${caseName} | AppStorage obsScroll_axis=${axis}`);
          expect(!!(axis != undefined && axis.length > 0)).assertTrue();
          arkuiNewLog(SUITE, 'execute', `${caseName} END ok`);
          done();
        } else {
          expect().assertFail();
          done();
        }
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', `${caseName} FAIL | ${e}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_observer_scroll_event_inspector_obs_scroll_host_0300
     * @tc.name SUB_arkui_observer_scroll_event_inspector_obs_scroll_host_0300
     * @tc.desc Test inspector.getInspectorByKey: node obsScroll_host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_observer_scroll_event_inspector_obs_scroll_host_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName = 'inspector_obsScroll_host';
      arkuiNewLog(SUITE, 'execute', `${caseName} START`);
      try {
        arkuiNewLog(SUITE, 'step', `${caseName} | getInspectorByKey obsScroll_host`);
        const raw = inspector.getInspectorByKey('obsScroll_host');
        const ok = JSON.parseJsonElement(raw) != null;
        arkuiNewLog(SUITE, 'step', `${caseName} | parseJsonElement ok=${ok}`);
        expect(ok).assertTrue();
        arkuiNewLog(SUITE, 'execute', `${caseName} END ok`);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', `${caseName} FAIL | ${e}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_observer_scroll_event_inspector_obs_scroll_title_0400
     * @tc.name SUB_arkui_observer_scroll_event_inspector_obs_scroll_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node obsScroll_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_observer_scroll_event_inspector_obs_scroll_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName = 'inspector_obsScroll_title';
      arkuiNewLog(SUITE, 'execute', `${caseName} START`);
      try {
        arkuiNewLog(SUITE, 'step', `${caseName} | getInspectorByKey obsScroll_title`);
        const ok = JSON.parseJsonElement(inspector.getInspectorByKey('obsScroll_title')) != null;
        arkuiNewLog(SUITE, 'step', `${caseName} | parse ok=${ok}`);
        expect(ok).assertTrue();
        arkuiNewLog(SUITE, 'execute', `${caseName} END ok`);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', `${caseName} FAIL | ${e}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_observer_scroll_event_inspector_obs_scroll_btn_0500
     * @tc.name SUB_arkui_observer_scroll_event_inspector_obs_scroll_btn_0500
     * @tc.desc Test inspector.getInspectorByKey: node obsScroll_btn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_observer_scroll_event_inspector_obs_scroll_btn_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName = 'inspector_obsScroll_btn';
      arkuiNewLog(SUITE, 'execute', `${caseName} START`);
      try {
        arkuiNewLog(SUITE, 'step', `${caseName} | getInspectorByKey obsScroll_btn`);
        const ok = JSON.parseJsonElement(inspector.getInspectorByKey('obsScroll_btn')) != null;
        arkuiNewLog(SUITE, 'step', `${caseName} | parse ok=${ok}`);
        expect(ok).assertTrue();
        arkuiNewLog(SUITE, 'execute', `${caseName} END ok`);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', `${caseName} FAIL | ${e}`);
        expect().assertFail();
        done();
      }
    });
  });
}
