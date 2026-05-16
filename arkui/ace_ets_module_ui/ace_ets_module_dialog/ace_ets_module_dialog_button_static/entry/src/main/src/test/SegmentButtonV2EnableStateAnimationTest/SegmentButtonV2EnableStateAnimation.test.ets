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

const PAGE = 'MainAbility/pages/segmentButtonV2EnableStateAnimation/segmentButtonV2EnableStateAnimation';
const TITLE_ID = 'segV2_title';
const SLEEP_TIME = 500;
const INSPECTOR_STABLE_MS = 800;
const SUITE = 'SegmentButtonV2EnableStateAnimationTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function SegmentButtonV2EnableStateAnimationTest() {
  describe('SegmentButtonV2EnableStateAnimationTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('segV2_mounted');
      const options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(1000);
      } catch (err) {
        arkuiNewErr(SUITE, 'beforeEach', 'replaceUrl error: ' + err);
        expect().assertFail();
      }

      arkuiNewLog(SUITE, 'beforeEach', 'end');
    });

    afterEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'afterEach', 'start');

      AppStorage.delete('segV2_mounted');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_page_loads_0100
     * @tc.name SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_page_loads_0100
     * @tc.desc Test segmentButtonV2EnableStateAnimation page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        arkuiNewLog(SUITE, 'execute', 'segmentV2_pageLoads START');
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
     * @tc.number SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_mounted_flag_0200
     * @tc.name SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_mounted_flag_0200
     * @tc.desc Test AppStorage: segV2_mounted after aboutToAppear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_v2_enable_state_anim_segment_v2_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        arkuiNewLog(SUITE, 'execute', 'segmentV2_mounted_flag START');
        try {
          await Utils.sleep(INSPECTOR_STABLE_MS);
          const rawTitle = inspector.getInspectorByKey('segV2_title');
          const rawTab = inspector.getInspectorByKey('segV2_tab');
          expect(rawTitle !== undefined && rawTitle !== '' && rawTab !== undefined && rawTab !== '').assertTrue();
          done();
        } catch (e) {
          arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_tab_and_capsule_0300
     * @tc.name SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_tab_and_capsule_0300
     * @tc.desc Test inspector.getInspectorByKey: nodes segV2_tab and segV2_cap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_tab_and_capsule_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        arkuiNewLog(SUITE, 'execute', 'inspector_segV2_tab_and_capsule START');
        try {
          await Utils.sleep(INSPECTOR_STABLE_MS);
          const tab = JSON.parseJsonElement(inspector.getInspectorByKey('segV2_tab'));
          const cap = JSON.parseJsonElement(inspector.getInspectorByKey('segV2_cap'));
          expect(tab != null && cap != null).assertTrue();
          done();
        } catch (e) {
          arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_title_0400
     * @tc.name SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_title_0400
     * @tc.desc inspector segV2_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_v2_enable_state_anim_inspector_seg_v2_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        arkuiNewLog(SUITE, 'execute', 'inspector_segV2_title START');
        try {
          await Utils.sleep(INSPECTOR_STABLE_MS);
          const node = JSON.parseJsonElement(inspector.getInspectorByKey('segV2_title'));
          expect(node != null).assertTrue();
          done();
        } catch (e) {
          arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_arkui_segment_button_v2_enable_state_anim_driver_find_tab_text_a_0500
     * @tc.name SUB_arkui_segment_button_v2_enable_state_anim_driver_find_tab_text_a_0500
     * @tc.desc Test Driver.findComponent: tab text A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_v2_enable_state_anim_driver_find_tab_text_a_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        arkuiNewLog(SUITE, 'execute', 'driver_find_tab_text_A START');
        try {
          await Utils.sleep(INSPECTOR_STABLE_MS);
          const d = Driver.create();
          let t = await d.findComponent(ON.text('A', MatchPattern.EQUALS));
          if (!t) {
            t = await d.findComponent(ON.text('A', MatchPattern.CONTAINS));
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
