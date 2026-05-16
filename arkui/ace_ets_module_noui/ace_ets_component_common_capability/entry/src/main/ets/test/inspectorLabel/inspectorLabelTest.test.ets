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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function inspectorLabelTest() {
  describe('InspectorLabelTest', () => {
    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/inspectorLabel/inspectorLabelTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get InspectorLabelTest state pages: " + JSON.stringify(pages));
        if (!("inspectorLabelTest" == pages.name)) {
          console.info("get InspectorLabelTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push InspectorLabelTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push InspectorLabelTest page error: " + err);
        expect().assertFail();
      }
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100
     * @tc.desc   测试 inspectorLabel 正常入参
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] START');

      let strJson: string = getInspectorByKey('text_inspectorLabel_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] obj is: " + JSON.stringify(obj.$attrs));

      let inspectorLabelValue: ESObject = obj.$attrs.inspectorLabel;
      expect(inspectorLabelValue === 'TEST_LABEL').assertTrue();
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_VALID_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200
     * @tc.desc   测试 inspectorLabel null 参数，应为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200] START');

      let strJson: string = getInspectorByKey('text_inspectorLabel_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200] obj is: " + JSON.stringify(obj.$attrs));

      let inspectorLabelValue: ESObject = obj.$attrs.inspectorLabel;
      expect(inspectorLabelValue === undefined).assertTrue();
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_NULL_0200] END');
    });

    /**
     * @tc.name   SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300
     * @tc.desc   测试 inspectorLabel undefined 参数，应为空字符串
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] START');

      let strJson: string = getInspectorByKey('text_inspectorLabel_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] obj is: " + JSON.stringify(obj.$attrs));

      let inspectorLabelValue: ESObject = obj.$attrs.inspectorLabel;
      expect(inspectorLabelValue === undefined).assertTrue();
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_UNDEFINED_0300] END');
    });

    /**
     * @tc.name   SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400
     * @tc.number SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400
     * @tc.desc   测试 inspectorLabel 空字符串参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400', Level.LEVEL0, async () => {
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] START');

      let strJson: string = getInspectorByKey('text_inspectorLabel_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] obj is: " + JSON.stringify(obj.$attrs));

      let inspectorLabelValue: ESObject = obj.$attrs.inspectorLabel;
      expect(inspectorLabelValue === undefined).assertTrue();
      console.info('[SUB_ARKUI_INSPECTORLABEL_PARAM_EMPTY_0400] END');
    });
  });
}