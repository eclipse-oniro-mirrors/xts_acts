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

export default function buttonFontFamilyNullTest() {
  describe('buttonFontFamilyNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonFontFamilyNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonNull/ButtonFontFamilyNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonFontFamilyNullTest state pages:" + JSON.stringify(pages));
        if (!("ButtonFontFamilyNullTest" == pages.name)) {
          console.info("get buttonFontFamilyNullTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push buttonFontFamilyNullTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push buttonFontFamilyNullTest page error:" + err);
        expect().assertFail();
      }
      console.info("buttonFontFamilyNullTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   buttonFontFamily_Null_001
     * @tc.number SUB_ARKUI_BUTTON_FONTFAMILY_PARAM_001
     * @tc.desc   Test Button fontFamily with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontFamily_Null_001', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontFamily_Null_001 START');
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('button_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+ '========attrs========')
      expect(!(obj.$attrs.fontFamily)).assertTrue();

      console.info('buttonFontFamily_Null_001 END');
      done();
    });

    /**
     * @tc.name   buttonFontFamily_Undefined_002
     * @tc.number SUB_ARKUI_BUTTON_FONTFAMILY_PARAM_002
     * @tc.desc   Test Button fontFamily with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontFamily_Undefined_002', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontFamily_Undefined_002 START');
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('button_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+ '========attrs========')
      expect(!(obj.$attrs.fontFamily)).assertTrue();

      console.info('buttonFontFamily_Undefined_002 END');
      done();
    });

    /**
     * @tc.name   buttonFontFamily_Empty_003
     * @tc.number SUB_ARKUI_BUTTON_FONTFAMILY_PARAM_003
     * @tc.desc   Test Button fontFamily with empty string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buttonFontFamily_Empty_003', Level.LEVEL1, async (done: Function) => {
      console.info('buttonFontFamily_Empty_003 START');
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('button_fontFamily_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+ '========attrs========')
      expect(!(obj.$attrs.fontFamily)).assertTrue();

      console.info('buttonFontFamily_Empty_003 END');
      done();
    });

  })
}