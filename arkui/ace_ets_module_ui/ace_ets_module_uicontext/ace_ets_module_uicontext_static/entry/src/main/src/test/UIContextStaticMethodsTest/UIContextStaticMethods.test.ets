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

const PAGE = 'MainAbility/pages/uiContextStaticMethods/uiContextStaticMethods';
const TITLE_ID = 'uiCtxSt_title';
const SLEEP_TIME = 500;
const SUITE = 'UIContextStaticMethodsTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function UIContextStaticMethodsTest() {
  describe('UIContextStaticMethodsTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('uiCtxSt_result');
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

      AppStorage.delete('uiCtxSt_result');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_uicontext_static_methods_ui_ctx_st_page_loads_0100
     * @tc.name SUB_arkui_uicontext_static_methods_ui_ctx_st_page_loads_0100
     * @tc.desc Test uiContextStaticMethods page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uicontext_static_methods_ui_ctx_st_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'uiCtxSt_pageLoads START');
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
     * @tc.number SUB_arkui_uicontext_static_methods_snapshot_result_0200
     * @tc.name SUB_arkui_uicontext_static_methods_snapshot_result_0200
     * @tc.desc Test UIContext static methods and getPageRootNode snapshot via invoke button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uicontext_static_methods_snapshot_result_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'static_methods_snapshot_result START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('uiCtxSt_btn'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        const r = AppStorage.get<string>('uiCtxSt_result');
        expect(r !== undefined && r !== 'err').assertTrue();
        expect(r!.includes('all:')).assertTrue();
        expect(r!.includes('root:')).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_title_0300
     * @tc.name SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_title_0300
     * @tc.desc Test inspector.getInspectorByKey: node uiCtxSt_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_title_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_uiCtxSt_title START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('uiCtxSt_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_btn_0400
     * @tc.name SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_btn_0400
     * @tc.desc inspector uiCtxSt_btn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uicontext_static_methods_inspector_ui_ctx_st_btn_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_uiCtxSt_btn START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('uiCtxSt_btn')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uicontext_static_methods_driver_find_invoke_button_twice_0500
     * @tc.name SUB_arkui_uicontext_static_methods_driver_find_invoke_button_twice_0500
     * @tc.desc Test Driver.findComponent: uiCtxSt_btn found repeatedly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uicontext_static_methods_driver_find_invoke_button_twice_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'driver_find_invoke_button_twice START');
      try {
        const d = Driver.create();
        const a = await d.findComponent(ON.id('uiCtxSt_btn'));
        await Utils.sleep(200);
        const b = await d.findComponent(ON.id('uiCtxSt_btn'));
        expect(!!a && !!b).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
