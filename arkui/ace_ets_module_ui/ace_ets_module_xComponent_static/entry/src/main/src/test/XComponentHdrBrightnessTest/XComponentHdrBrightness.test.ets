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

const PAGE = 'MainAbility/pages/xComponentHdrBrightness/xComponentHdrBrightness';
const TITLE_ID = 'xcHdr_title';
const SLEEP_TIME = 500;
const SUITE = 'XComponentHdrBrightnessTest';
function arkuiNewLog(suite: string, phase: string, detail: string): void {
  console.info('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}

function arkuiNewErr(suite: string, phase: string, detail: string): void {
  console.error('[ARKUI_NEW] ' + suite + ' ' + phase + ': ' + detail);
}


export default function XComponentHdrBrightnessTest() {
  describe('XComponentHdrBrightnessTest', () => {
    beforeAll(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeAll', 'start');
      await UtilsTest.startAbility('com.arkui.ace.xComponent.static', 'EntryAbility');
      arkuiNewLog(SUITE, 'beforeAll', 'end');
    });

    beforeEach(async (): Promise<void> => {
      arkuiNewLog(SUITE, 'beforeEach', 'start');
      AppStorage.delete('xcHdr_mounted');
      AppStorage.delete('xcHdr_hdr_brightness_typed');
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

      AppStorage.delete('xcHdr_mounted');
      AppStorage.delete('xcHdr_hdr_brightness_typed');
      await Utils.sleep(SLEEP_TIME);
      arkuiNewLog(SUITE, 'afterEach', 'end');
    });

    /**
     * @tc.number SUB_arkui_xcomponent_hdr_brightness_xc_hdr_page_loads_0100
     * @tc.name SUB_arkui_xcomponent_hdr_brightness_xc_hdr_page_loads_0100
     * @tc.desc Test xComponentHdrBrightness page: route loads and title node exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_xcomponent_hdr_brightness_xc_hdr_page_loads_0100',
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
     * @tc.number SUB_arkui_xcomponent_hdr_brightness_xc_hdr_mounted_flag_0200
     * @tc.name SUB_arkui_xcomponent_hdr_brightness_xc_hdr_mounted_flag_0200
     * @tc.desc Test AppStorage: xcHdr_mounted and xcHdr_hdr_brightness_typed (HdrType DEFAULT/AIHDR paths)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_xcomponent_hdr_brightness_xc_hdr_mounted_flag_0200',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(AppStorage.get<boolean>('xcHdr_mounted')).assertEqual(true);
        expect(AppStorage.get<boolean>('xcHdr_hdr_brightness_typed')).assertEqual(true);
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_body_0300
     * @tc.name SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_body_0300
     * @tc.desc Test inspector: xcHdr_body (HdrType.DEFAULT) and xcHdr_body_ai (HdrType.AIHDR)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_body_0300',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('xcHdr_body')) != null).assertTrue();
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('xcHdr_body_ai')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_title_0400
     * @tc.name SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_title_0400
     * @tc.desc inspector xcHdr_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_xcomponent_hdr_brightness_inspector_xc_hdr_title_0400',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('xcHdr_title')) != null).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_arkui_xcomponent_hdr_brightness_driver_find_xc_text_0500
     * @tc.name SUB_arkui_xcomponent_hdr_brightness_driver_find_xc_text_0500
     * @tc.desc Test Driver.findComponent: node xcHdr_body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      'SUB_arkui_xcomponent_hdr_brightness_driver_find_xc_text_0500',
      Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        expect(!!await Driver.create().findComponent(ON.id('xcHdr_body'))).assertTrue();
        done();
      } catch (e) {
        arkuiNewErr(SUITE, 'execute', 'FAIL | ' + e);
        expect().assertFail();
        done();
      }
    });
  });
}
