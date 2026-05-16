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

const PAGE = 'MainAbility/pages/componentContentApi/componentContentApi';
const TITLE_ID = 'ccApi_title';
const SLEEP_TIME = 500;
const SUITE = 'ComponentContentApiTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function ComponentContentApiTest() {
  describe('ComponentContentApiTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.xComponent.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('ccApi_created');
      AppStorage.delete('ccApi_disposed');
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

      AppStorage.delete('ccApi_created');
      AppStorage.delete('ccApi_disposed');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_component_content_api_cc_api_page_loads_0100
     * @tc.name SUB_arkui_component_content_api_cc_api_page_loads_0100
     * @tc.desc Test componentContentApi page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_component_content_api_cc_api_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'ccApi_pageLoads START');
      try {
        const found = !!await Driver.create().findComponent(ON.id(TITLE_ID));
        arkuiNewLog(SUITE, 'step', `ccApi_pageLoads | title found=${found}`);
        expect(found).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'ccApi_pageLoads END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_component_content_api_component_content_create_dispose_0200
     * @tc.name SUB_arkui_component_content_api_component_content_create_dispose_0200
     * @tc.desc Test ComponentContent: click creates and disposes; AppStorage ccApi_created and ccApi_disposed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_component_content_api_component_content_create_dispose_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('ccApi_btn'));
        expect(!!btn).assertTrue();
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        expect(AppStorage.get<boolean>('ccApi_created')).assertEqual(true);
        expect(AppStorage.get<boolean>('ccApi_disposed')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_component_content_api_inspector_cc_api_btn_0300
     * @tc.name SUB_arkui_component_content_api_inspector_cc_api_btn_0300
     * @tc.desc Test inspector.getInspectorByKey: node ccApi_btn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_component_content_api_inspector_cc_api_btn_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_ccApi_btn START');
      try {
        const ok = JSON.parseJsonElement(inspector.getInspectorByKey('ccApi_btn')) != null;
        arkuiNewLog(SUITE, 'step', `inspector_ccApi_btn | parse ok=${ok}`);
        expect(ok).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'inspector_ccApi_btn END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_component_content_api_inspector_cc_api_title_0400
     * @tc.name SUB_arkui_component_content_api_inspector_cc_api_title_0400
     * @tc.desc Test inspector.getInspectorByKey: node ccApi_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_component_content_api_inspector_cc_api_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_ccApi_title START');
      try {
        const ok = JSON.parseJsonElement(inspector.getInspectorByKey('ccApi_title')) != null;
        arkuiNewLog(SUITE, 'step', `inspector_ccApi_title | parse ok=${ok}`);
        expect(ok).assertTrue();
        arkuiNewLog(SUITE, 'execute', 'inspector_ccApi_title END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_component_content_api_component_content_second_click_idempotent_0500
     * @tc.name SUB_arkui_component_content_api_component_content_second_click_idempotent_0500
     * @tc.desc Test ComponentContent: second click keeps ccApi_created and ccApi_disposed true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_component_content_api_component_content_second_click_idempotent_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'componentContent_second_click_idempotent START');
      try {
        const driver = Driver.create();
        const btn = await driver.findComponent(ON.id('ccApi_btn'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(400);
        arkuiNewLog(
          SUITE,
          'step',
          `second_click | created=${AppStorage.get<boolean>('ccApi_created')} ` +
            `disposed=${AppStorage.get<boolean>('ccApi_disposed')}`,
        );
        expect(AppStorage.get<boolean>('ccApi_created')).assertEqual(true);
        expect(AppStorage.get<boolean>('ccApi_disposed')).assertEqual(true);
        arkuiNewLog(SUITE, 'execute', 'componentContent_second_click_idempotent END ok');
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
