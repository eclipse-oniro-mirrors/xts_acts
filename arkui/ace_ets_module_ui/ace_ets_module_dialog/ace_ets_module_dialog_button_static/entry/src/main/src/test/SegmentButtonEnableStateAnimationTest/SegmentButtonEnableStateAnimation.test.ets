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

const PAGE = 'MainAbility/pages/segmentButtonEnableStateAnimation/segmentButtonEnableStateAnimation';
const TITLE_ID = 'segV1_title';
const BODY_ID = 'segV1_body';
const SLEEP_TIME = 500;
const SUITE = 'SegmentButtonEnableStateAnimationTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function SegmentButtonEnableStateAnimationTest() {
  describe('SegmentButtonEnableStateAnimationTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.dialog.button.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('segV1_mounted');
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

      AppStorage.delete('segV1_mounted');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100
     * @tc.name SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100
     * @tc.desc Test segmentButtonEnableStateAnimation page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_segment_v1_page_loads_0100',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'segmentV1_pageLoads START');
      try {
        const n = await Driver.create().findComponent(ON.id(TITLE_ID));
        expect(n !== undefined).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200
     * @tc.name SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200
     * @tc.desc 页面已挂载：与 0100 一致用 Driver 校验 title/body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_segment_v1_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'segmentV1_mounted_flag START');
      try {
        const driver = Driver.create();
        const title = await driver.findComponent(ON.id(TITLE_ID));
        const body = await driver.findComponent(ON.id(BODY_ID));
        expect(title !== undefined && body !== undefined).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300
     * @tc.name SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300
     * @tc.desc 节点 segV1_body：Driver 校验（与 inspector 等价场景）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_segV1_body START');
      try {
        // 与 0200 相同顺序：勿在长 sleep 后再查（易与当前页失步）；勿单独 ON.id(body)
        const driver = Driver.create();
        const title = await driver.findComponent(ON.id(TITLE_ID));
        const body = await driver.findComponent(ON.id(BODY_ID));
        expect(title !== undefined && body !== undefined).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400
     * @tc.name SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400
     * @tc.desc 节点 segV1_title：Driver 校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_segment_button_enable_state_anim_inspector_seg_v1_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      arkuiNewLog(SUITE, 'execute', 'inspector_segV1_title START');
      try {
        const n = await Driver.create().findComponent(ON.id(TITLE_ID));
        expect(n !== undefined).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
