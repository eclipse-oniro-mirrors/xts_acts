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

const PAGE = 'MainAbility/pages/dialogButtonOptionsTextAlign/dialogButtonOptionsTextAlign';
const TITLE_ID = 'dlgBtnOpt_title';
const SLEEP_TIME = 500;
const SUITE = 'DialogButtonOptionsTextAlignTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function DialogButtonOptionsTextAlignTest() {
  describe('DialogButtonOptionsTextAlignTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('dlgBtnOpt_textAlign');
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
      AppStorage.delete('dlgBtnOpt_textAlign');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_page_loads_0100
     * @tc.name SUB_arkui_dialog_button_options_text_align_page_loads_0100
     * @tc.desc Test dialogButtonOptionsTextAlign page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'dialogButtonOptionsTextAlign_pageLoads START');
      try {
        const n = await Driver.create().findComponent(ON.id(TITLE_ID));
        expect(n !== undefined).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'dialogButtonOptionsTextAlign_pageLoads END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_primary_button_text_align_center_action_0200
     * @tc.name SUB_arkui_dialog_button_options_text_align_primary_button_text_align_center_action_0200
     * @tc.desc Test AlertDialog primary button: ButtonOptions.textAlign written to AppStorage dlgBtnOpt_textAlign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_primary_button_text_align_center_action_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'primaryButton_textAlign_center_action START');
      try {
        const driver = Driver.create();
        const openBtn = await driver.findComponent(ON.id('dlgBtnOpt_open'));
        expect(!!openBtn).assertTrue();
        await (openBtn?.click() as Promise<void>);
        await Utils.sleep(800);
        let ok = await driver.findComponent(ON.text('OK', MatchPattern.EQUALS));
        if (!ok) {
          ok = await driver.findComponent(ON.text('确定', MatchPattern.EQUALS));
        }
        expect(!!ok).assertTrue();
        await (ok?.click() as Promise<void>);
        await Utils.sleep(400);
        expect(AppStorage.get<string>('dlgBtnOpt_textAlign')).assertEqual('center');
        arkuiNewLog(SUITE, 'execute', 'primaryButton_textAlign_center_action END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_inspector_open_button_node_0300
     * @tc.name SUB_arkui_dialog_button_options_text_align_inspector_open_button_node_0300
     * @tc.desc Test inspector.getInspectorByKey: node dlgBtnOpt_open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_inspector_open_button_node_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_openButton_node START');
      try {
        const node = JSON.parseJsonElement(inspector.getInspectorByKey('dlgBtnOpt_open'));
        expect(node != null).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'inspector_openButton_node END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_inspector_title_node_0400
     * @tc.name SUB_arkui_dialog_button_options_text_align_inspector_title_node_0400
     * @tc.desc Test inspector.getInspectorByKey: node dlgBtnOpt_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_inspector_title_node_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_title_node START');
      try {
        const node = JSON.parseJsonElement(inspector.getInspectorByKey('dlgBtnOpt_title'));
        expect(node != null).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'inspector_title_node END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_app_storage_align_key_cleared_before_case_0500
     * @tc.name SUB_arkui_dialog_button_options_text_align_app_storage_align_key_cleared_before_case_0500
     * @tc.desc Test AppStorage: dlgBtnOpt_textAlign undefined before opening dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_app_storage_align_key_cleared_before_case_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'appStorage_align_key_cleared_before_case START');
      try {
        expect(AppStorage.get<string>('dlgBtnOpt_textAlign') === undefined).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'appStorage_align_key_cleared_before_case END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_dialog_button_options_text_align_driver_find_open_button_stable_0600
     * @tc.name SUB_arkui_dialog_button_options_text_align_driver_find_open_button_stable_0600
     * @tc.desc Test Driver.findComponent: dlgBtnOpt_open found repeatedly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_dialog_button_options_text_align_driver_find_open_button_stable_0600',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'driver_find_open_button_stable START');
      try {
        const driver = Driver.create();
        const a = await driver.findComponent(ON.id('dlgBtnOpt_open'));
        await Utils.sleep(200);
        const b = await driver.findComponent(ON.id('dlgBtnOpt_open'));
        expect(!!a && !!b).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'driver_find_open_button_stable END');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
