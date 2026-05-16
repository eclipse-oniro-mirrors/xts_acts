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

const PAGE = 'MainAbility/pages/measureUtilsGetParagraphs/measureUtilsGetParagraphs';
const TITLE_ID = 'muPara_title';
const SLEEP_TIME = 500;
const SUITE = 'MeasureUtilsGetParagraphsTest';

function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function clearMuParaKeys(): void {
  AppStorage.delete('muPara_ready');
  AppStorage.delete('muPara_ok');
  AppStorage.delete('muPara_len');
}

export default function MeasureUtilsGetParagraphsTest() {
  describe('MeasureUtilsGetParagraphsTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.draw.api23.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      clearMuParaKeys();
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
      clearMuParaKeys();
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_measure_utils_get_paragraphs_mu_para_page_loads_0100
     * @tc.name SUB_arkui_measure_utils_get_paragraphs_mu_para_page_loads_0100
     * @tc.desc Test MeasureUtilsGetParagraphs page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_measure_utils_get_paragraphs_mu_para_page_loads_0100',
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
     * @tc.number SUB_arkui_measure_utils_get_paragraphs_mu_para_ready_flag_0200
     * @tc.name SUB_arkui_measure_utils_get_paragraphs_mu_para_ready_flag_0200
     * @tc.desc Test MeasureUtilsGetParagraphs: aboutToAppear sets AppStorage muPara_ready
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_measure_utils_get_paragraphs_mu_para_ready_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(AppStorage.get<boolean>('muPara_ready') === true).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_measure_utils_get_paragraphs_mu_para_get_paragraphs_smoke_0300
     * @tc.name SUB_arkui_measure_utils_get_paragraphs_mu_para_get_paragraphs_smoke_0300
     * @tc.desc Test MeasureUtils.getParagraphs: button click sets muPara_ok and paragraph length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_measure_utils_get_paragraphs_mu_para_get_paragraphs_smoke_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const d = Driver.create();
        const btn = await d.findComponent(ON.id('muPara_btn'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(300);
        expect(AppStorage.get<boolean>('muPara_ok') === true).assertTrue();
        expect((AppStorage.get<number>('muPara_len') ?? 0) >= 1).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_title_0400
     * @tc.name SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node muPara_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('muPara_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_btn_0500
     * @tc.name SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_btn_0500
     * @tc.desc Test inspector.getInspectorByKey: node muPara_btn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_measure_utils_get_paragraphs_mu_para_inspector_btn_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('muPara_btn')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
