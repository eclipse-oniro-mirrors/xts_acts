/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, beforeEach, afterEach, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

const SLEEP_TIME = 1000;
const PAGE = 'MainAbility/pages/inspectorLabel/InspectorLabelTest';

export default function InspectorLabelTest() {
  describe('InspectorLabelTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('InspectorLabelTest beforeAll start');
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility('com.arkui.ace.xComponent.static', 'EntryAbility');
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('InspectorLabelTest beforeEach start');
      let options: router.RouterOptions = {
        url: PAGE,
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('InspectorLabelTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'InspectorLabelTest') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('InspectorLabelTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(200);
    });

    /**
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100
     * @tc.name SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100
     * @tc.desc Test inspectorLabel with valid string parameter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_inspectorLabel_valid'));
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] obj is: ' + obj.getElement('$attrs'));
        let inspectorLabelValue = obj.getElement('$attrs').getString('inspectorLabel');
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] inspectorLabelValue: ' + inspectorLabelValue);
        expect(inspectorLabelValue === 'TEST_LABEL').assertTrue();
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] END');
        done();
      } catch (error) {
        console.error('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300
     * @tc.name SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300
     * @tc.desc Test inspectorLabel with undefined parameter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_inspectorLabel_undefined'));
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] obj is: ' + obj.getElement('$attrs'));
        let inspectorLabelValue = obj.getElement('$attrs').tryGetString('inspectorLabel');
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] inspectorLabelValue: ' + inspectorLabelValue);
        expect(inspectorLabelValue === "").assertTrue();
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] END');
        done();
      } catch (error) {
        console.error('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400
     * @tc.name SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400
     * @tc.desc Test inspectorLabel with empty string parameter
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('text_inspectorLabel_empty'));
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] obj is: ' + obj.getElement('$attrs'));
        let inspectorLabelValue = obj.getElement('$attrs').tryGetString('inspectorLabel');
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] inspectorLabelValue: ' + inspectorLabelValue);
        expect(inspectorLabelValue === "").assertTrue();
        console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] END');
        done();
      } catch (error) {
        console.error('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] error: ' + error);
        expect().assertFail();
        done();
      }
    });
  });
}