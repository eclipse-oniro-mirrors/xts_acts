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

const PAGE = 'MainAbility/pages/subHeaderV2IdFields/subHeaderV2IdFields';
const TITLE_ID = 'subHdrV2_title';
const SLEEP_TIME = 500;
const SUITE = 'SubHeaderV2IdFieldsTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function SubHeaderV2IdFieldsTest() {
  describe('SubHeaderV2IdFieldsTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.acts.arkui.subHeader.nowear.test.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('subHdrV2_mounted');
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

      AppStorage.delete('subHdrV2_mounted');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_subheader_v2_id_fields_sub_header_v2_page_loads_0100
     * @tc.name SUB_arkui_subheader_v2_id_fields_sub_header_v2_page_loads_0100
     * @tc.desc Test subHeaderV2IdFields page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_v2_id_fields_sub_header_v2_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'subHeaderV2_pageLoads START');
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
     * @tc.number SUB_arkui_subheader_v2_id_fields_sub_hdr_v2_mounted_flag_0200
     * @tc.name SUB_arkui_subheader_v2_id_fields_sub_hdr_v2_mounted_flag_0200
     * @tc.desc subHdrV2_mounted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_v2_id_fields_sub_hdr_v2_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'subHdrV2_mounted_flag START');
      try {
        expect(AppStorage.get<boolean>('subHdrV2_mounted')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_body_0300
     * @tc.name SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_body_0300
     * @tc.desc Test inspector.getInspectorByKey: node subHdrV2_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_subHdrV2_body START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('subHdrV2_body')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_title_0400
     * @tc.name SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_title_0400
     * @tc.desc inspector subHdrV2_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_v2_id_fields_inspector_sub_hdr_v2_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_subHdrV2_title START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('subHdrV2_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_v2_id_fields_driver_find_title_v2_0500
     * @tc.name SUB_arkui_subheader_v2_id_fields_driver_find_title_v2_0500
     * @tc.desc Test Driver.findComponent: SubHeader V2 primary title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_v2_id_fields_driver_find_title_v2_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'driver_find_title_V2 START');
      try {
        const d = Driver.create();
        let t = await d.findComponent(ON.text('V2', MatchPattern.EQUALS));
        if (!t) {
          t = await d.findComponent(ON.text('V2', MatchPattern.CONTAINS));
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
