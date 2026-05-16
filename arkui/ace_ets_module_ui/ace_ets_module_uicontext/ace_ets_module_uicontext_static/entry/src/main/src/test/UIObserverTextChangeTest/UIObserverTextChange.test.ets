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

const PAGE = 'MainAbility/pages/uiObserverTextChange/uiObserverTextChange';
const TITLE_ID = 'txtCh_title';
const SLEEP_TIME = 500;
const SUITE = 'UIObserverTextChangeTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function clearTxtChKeys(): void {
  AppStorage.delete('txtCh_ready');
  AppStorage.delete('txtCh_on_plain_ok');
  AppStorage.delete('txtCh_on_opt_ok');
  AppStorage.delete('txtCh_off_plain_ok');
  AppStorage.delete('txtCh_off_opt_ok');
  AppStorage.delete('txtCh_event');
  AppStorage.delete('txtCh_event_opt');
}

export default function UIObserverTextChangeTest() {
  describe('UIObserverTextChangeTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.ets.module.uicontext.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      clearTxtChKeys();
      const options: router.RouterOptions = { url: PAGE };
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
      clearTxtChKeys();
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_uiobserver_text_change_txt_ch_page_loads_0100
     * @tc.name SUB_arkui_uiobserver_text_change_txt_ch_page_loads_0100
     * @tc.desc Test UIObserver onTextChange page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uiobserver_text_change_txt_ch_page_loads_0100',
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
     * @tc.number SUB_arkui_uiobserver_text_change_txt_ch_ready_flag_0200
     * @tc.name SUB_arkui_uiobserver_text_change_txt_ch_ready_flag_0200
     * @tc.desc Test UIObserver onTextChange page: aboutToAppear sets AppStorage txtCh_ready
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uiobserver_text_change_txt_ch_ready_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(AppStorage.get<boolean>('txtCh_ready') === true).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uiobserver_text_change_txt_ch_inspector_title_0300
     * @tc.name SUB_arkui_uiobserver_text_change_txt_ch_inspector_title_0300
     * @tc.desc Test inspector.getInspectorByKey: node txtCh_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uiobserver_text_change_txt_ch_inspector_title_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('txtCh_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uiobserver_text_change_txt_ch_on_plain_registers_0400
     * @tc.name SUB_arkui_uiobserver_text_change_txt_ch_on_plain_registers_0400
     * @tc.desc Test UIObserver.onTextChange: plain callback registers and sets txtCh_on_plain_ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uiobserver_text_change_txt_ch_on_plain_registers_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        const btn = await d.findComponent(ON.id('txtCh_on_plain'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(300);
        expect(AppStorage.get<boolean>('txtCh_on_plain_ok') === true).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_uiobserver_text_change_txt_ch_on_opt_registers_0500
     * @tc.name SUB_arkui_uiobserver_text_change_txt_ch_on_opt_registers_0500
     * @tc.desc Test UIObserver.onTextChange with ObserverOptions: overload registers and sets txtCh_on_opt_ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_uiobserver_text_change_txt_ch_on_opt_registers_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        const btn = await d.findComponent(ON.id('txtCh_on_opt'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(300);
        expect(AppStorage.get<boolean>('txtCh_on_opt_ok') === true).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
