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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function LoadingProgressPropertiesNullUndefinedTest() {
  describe('LoadingProgressPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/LoadingProgressPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LoadingProgressPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("LoadingProgressPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get LoadingProgressPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(4000);
          console.info("push LoadingProgressPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LoadingProgressPropertiesNullUndefinedTest page error " + err);
      }
      done()
    });

    /**
     * @tc.name   loadingProgressColor_null_0100
     * @tc.number SUB_ARKUI_LOADINGPROGRESS_COLOR_NULL_0100
     * @tc.desc   Test LoadingProgress color property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('loadingProgressColor_null_0100', Level.LEVEL0, async () => {
      console.info('[loadingProgressColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('LoadingProgress_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('LoadingProgress_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[loadingProgressColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[loadingProgressColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[loadingProgressColor_null_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[loadingProgressColor_null_0100] null color is: " + JSON.stringify(obj.$attrs.color));

      // null 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[loadingProgressColor_null_0100] END');
    })

    /**
     * @tc.name   loadingProgressColor_undefined_0100
     * @tc.number SUB_ARKUI_LOADINGPROGRESS_COLOR_UNDEFINED_0100
     * @tc.desc   Test LoadingProgress color property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('loadingProgressColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[loadingProgressColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('LoadingProgress_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('LoadingProgress_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[loadingProgressColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[loadingProgressColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[loadingProgressColor_undefined_0100] default color is: " + JSON.stringify(objCompare.$attrs.color));
      console.info("[loadingProgressColor_undefined_0100] undefined color is: " + JSON.stringify(obj.$attrs.color));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[loadingProgressColor_undefined_0100] END');
    })

    /**
     * @tc.name   loadingProgressContentModifier_null_0100
     * @tc.number SUB_ARKUI_LOADINGPROGRESS_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test LoadingProgress contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('loadingProgressContentModifier_null_0100', Level.LEVEL0, async () => {
      console.info('[loadingProgressContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('LoadingProgress_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('LoadingProgress_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[loadingProgressContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[loadingProgressContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[loadingProgressContentModifier_null_0100] END');
    })

    /**
     * @tc.name   loadingProgressContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_LOADINGPROGRESS_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test LoadingProgress contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('loadingProgressContentModifier_undefined_0100', Level.LEVEL0, async () => {
      console.info('[loadingProgressContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('LoadingProgress_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('LoadingProgress_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[loadingProgressContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[loadingProgressContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual(objCompare.$type);
      console.info('[loadingProgressContentModifier_undefined_0100] END');
    })
  })
}
