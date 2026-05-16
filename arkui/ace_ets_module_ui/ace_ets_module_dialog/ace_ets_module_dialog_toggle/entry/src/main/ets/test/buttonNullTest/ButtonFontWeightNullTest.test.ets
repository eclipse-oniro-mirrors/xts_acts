/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function buttonFontWeightNullTest() {
  describe('buttonFontWeightNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonFontWeightNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonNull/ButtonFontWeightNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonFontWeightNullTest state pages:" + JSON.stringify(pages));
        if (!("ButtonFontWeightNullTest" == pages.name)) {
          console.info("get buttonFontWeightNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push buttonFontWeightNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonFontWeightNullTest page error:" + err);
        expect().assertFail();
      }
      console.info("buttonFontWeightNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   buttonFontWeight_Null_001
     * @tc.number SUB_ARKUI_BUTTON_FONTWEIGHT_PARAM_001
     * @tc.desc   Test Button fontWeight with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontWeight_Null_001', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontWeight_Null_001 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');

      console.info('buttonFontWeight_Null_001 END');
      done();
    });

    /**
     * @tc.name   buttonFontWeight_Undefined_002
     * @tc.number SUB_ARKUI_BUTTON_FONTWEIGHT_PARAM_002
     * @tc.desc   Test Button fontWeight with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontWeight_Undefined_002', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontWeight_Undefined_002 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');

      console.info('buttonFontWeight_Undefined_002 END');
      done();
    });

    /**
     * @tc.name   buttonFontWeight_StringBold_003
     * @tc.number SUB_ARKUI_BUTTON_FONTWEIGHT_PARAM_003
     * @tc.desc   Test Button fontWeight with string 'bold' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontWeight_StringBold_003', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontWeight_StringBold_003 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontWeight_string_bold');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');

      console.info('buttonFontWeight_StringBold_003 END');
      done();
    });

    /**
     * @tc.name   buttonFontWeight_StringNormal_004
     * @tc.number SUB_ARKUI_BUTTON_FONTWEIGHT_PARAM_004
     * @tc.desc   Test Button fontWeight with string 'normal' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontWeight_StringNormal_004', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontWeight_StringNormal_004 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontWeight_string_normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');

      console.info('buttonFontWeight_StringNormal_004 END');
      done();
    });

    /**
     * @tc.name   buttonFontWeight_StringEmpty_005
     * @tc.number SUB_ARKUI_BUTTON_FONTWEIGHT_PARAM_005
     * @tc.desc   Test Button fontWeight with empty string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontWeight_StringEmpty_005', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontWeight_StringEmpty_005 START');
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('button_fontWeight_string_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');

      console.info('buttonFontWeight_StringEmpty_005 END');
      done();
    });

  })
}