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

const PAGE = 'MainAbility/pages/subHeaderIdFields/subHeaderIdFields';
const TITLE_ID = 'subHdr_title';
const SLEEP_TIME = 500;
const SUITE = 'SubHeaderIdFieldsTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function SubHeaderIdFieldsTest() {
  describe('SubHeaderIdFieldsTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.acts.arkui.subHeader.nowear.test.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('subHdr_mounted');
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

      AppStorage.delete('subHdr_mounted');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_subheader_id_fields_sub_header_id_fields_page_loads_0100
     * @tc.name SUB_arkui_subheader_id_fields_sub_header_id_fields_page_loads_0100
     * @tc.desc Test subHeaderIdFields page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_id_fields_sub_header_id_fields_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'subHeaderIdFields_pageLoads START');
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
     * @tc.number SUB_arkui_subheader_id_fields_sub_hdr_mounted_flag_0200
     * @tc.name SUB_arkui_subheader_id_fields_sub_hdr_mounted_flag_0200
     * @tc.desc Test AppStorage: subHdr_mounted after aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_id_fields_sub_hdr_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'subHdr_mounted_flag START');
      try {
        expect(AppStorage.get<boolean>('subHdr_mounted')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_id_fields_inspector_sub_hdr_body_0300
     * @tc.name SUB_arkui_subheader_id_fields_inspector_sub_hdr_body_0300
     * @tc.desc inspector subHdr_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_id_fields_inspector_sub_hdr_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_subHdr_body START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('subHdr_body')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_id_fields_inspector_sub_hdr_title_0400
     * @tc.name SUB_arkui_subheader_id_fields_inspector_sub_hdr_title_0400
     * @tc.desc inspector subHdr_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_id_fields_inspector_sub_hdr_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_subHdr_title START');
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('subHdr_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_subheader_id_fields_driver_find_primary_title_sub_header_0500
     * @tc.name SUB_arkui_subheader_id_fields_driver_find_primary_title_sub_header_0500
     * @tc.desc Test Driver.findComponent: primary SubHeader title text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_subheader_id_fields_driver_find_primary_title_sub_header_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'driver_find_primary_title_SubHeader START');
      try {
        const d = Driver.create();
        let t = await d.findComponent(ON.text('SubHeader', MatchPattern.EQUALS));
        if (!t) {
          t = await d.findComponent(ON.text('SubHeader', MatchPattern.CONTAINS));
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
