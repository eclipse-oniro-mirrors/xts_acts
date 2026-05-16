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
import CommonFunc from '../../../MainAbility/common/Common';

async function startPage(pageUrl: string) {
  let options: router.RouterOptions = {
    url: pageUrl,
  }
  try {
    router.clear();
    let pages = router.getState();
    console.info(`get state pages: ${JSON.stringify(pages)}`);
    let pageName = pageUrl.split('/').pop();
    if (!(pageName === pages.name)) {
      console.info(`get state pages.name: ${JSON.stringify(pages.name)}`);
      let result = await router.pushUrl(options);
      console.info(`push success: ${JSON.stringify(result)}`);
    }
  } catch (err) {
    console.error(`push page error: ${err}`);
    expect().assertFail();
  }
}

export default function accessibilityGroupNullUndefinedTest() {
  describe('AccessibilityGroupNullUndefinedTest', () => {
    beforeAll(async () => {
      await startPage('MainAbility/pages/nullandundefinedcoverage/accessibility/AccessibilityGroupNullUndefined');
      await CommonFunc.sleep(1000);
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(async () => {
    });

    /**
     * @tc.name   accessibilityGroup_false_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_FALSE_001
     * @tc.desc   测试accessibilityGroup传入false参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_false_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_false_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_false_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup默认值为false，传入false应反映该值
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_false_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_NULL_001
     * @tc.desc   测试accessibilityGroup传入null参数（单参数）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_null_001] obj is: " + JSON.stringify(obj.$attrs));

      // 传入null时应返回默认值false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_null_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_UNDEFINED_001
     * @tc.desc   测试accessibilityGroup传入undefined参数（单参数）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

      // 传入undefined时应返回默认值false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_true_options_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_TRUE_OPTIONS_001
     * @tc.desc   测试accessibilityGroup传入true和有效的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_true_options_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_true_options_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_true_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_true_options_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_true_options_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_false_options_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_FALSE_OPTIONS_001
     * @tc.desc   测试accessibilityGroup传入false和有效的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_false_options_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_false_options_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_false_options');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_false_options_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_false_options_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_true_nullOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_TRUE_NULLOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入true和null的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_true_nullOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_true_nullOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_true_nullOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_true_nullOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_true_nullOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_true_undefinedOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_TRUE_UNDEFINEDOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入true和undefined的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_true_undefinedOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_true_undefinedOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_true_undefinedOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_true_undefinedOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_true_undefinedOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_false_nullOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_FALSE_NULLOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入false和null的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_false_nullOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_false_nullOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_false_nullOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_false_nullOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_false_nullOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_false_undefinedOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_FALSE_UNDEFINEDOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入false和undefined的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_false_undefinedOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_false_undefinedOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_false_undefinedOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_false_undefinedOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_false_undefinedOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_null_nullOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_NULL_NULLOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入null和null的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_null_nullOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_null_nullOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_null_nullOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_null_nullOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // 两个参数都为null时应返回默认值false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_null_nullOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_undefined_undefinedOptions_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_UNDEFINED_UNDEFINEDOPTIONS_001
     * @tc.desc   测试accessibilityGroup传入undefined和undefined的accessibilityOptions参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_undefined_undefinedOptions_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_undefined_undefinedOptions_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_undefined_undefinedOptions');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_undefined_undefinedOptions_001] obj is: " + JSON.stringify(obj.$attrs));

      // 两个参数都为undefined时应返回默认值false
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === false).assertTrue();
      console.info('[accessibilityGroup_undefined_undefinedOptions_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_stateControllerRoleType_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_STATECONTROLLERROLETYPE_001
     * @tc.desc   测试accessibilityGroup传入stateControllerRoleType参数（number枚举类型）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_stateControllerRoleType_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_stateControllerRoleType_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_stateControllerRoleType');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_stateControllerRoleType_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_stateControllerRoleType_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_actionControllerRoleType_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_ACTIONCONTROLLERROLETYPE_001
     * @tc.desc   测试accessibilityGroup传入actionControllerRoleType参数（number枚举类型）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_actionControllerRoleType_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_actionControllerRoleType_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_actionControllerRoleType');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_actionControllerRoleType_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_actionControllerRoleType_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_stateControllerId_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_STATECONTROLLERID_001
     * @tc.desc   测试accessibilityGroup传入stateControllerId参数（string类型）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_stateControllerId_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_stateControllerId_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_stateControllerId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_stateControllerId_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_stateControllerId_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_actionControllerId_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_ACTIONCONTROLLERID_001
     * @tc.desc   测试accessibilityGroup传入actionControllerId参数（string类型）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_actionControllerId_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_actionControllerId_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_actionControllerId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_actionControllerId_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_actionControllerId_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_stateControllerId_empty_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_STATECONTROLLERID_EMPTY_001
     * @tc.desc   测试accessibilityGroup传入stateControllerId空字符串参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_stateControllerId_empty_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_stateControllerId_empty_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_stateControllerId_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_stateControllerId_empty_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true，id的空字符串是有效的
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_stateControllerId_empty_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_actionControllerId_empty_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_ACTIONCONTROLLERID_EMPTY_001
     * @tc.desc   测试accessibilityGroup传入actionControllerId空字符串参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_actionControllerId_empty_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_actionControllerId_empty_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_actionControllerId_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_actionControllerId_empty_001] obj is: " + JSON.stringify(obj.$attrs));

      // accessibilityGroup应为true，id的空字符串是有效的
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_actionControllerId_empty_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_stateControllerId_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_STATECONTROLLERID_NULL_001
     * @tc.desc   测试accessibilityGroup传入stateControllerId为null参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_stateControllerId_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_stateControllerId_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_stateControllerId_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_stateControllerId_null_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_stateControllerId_null_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_actionControllerId_null_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_ACTIONCONTROLLERID_NULL_001
     * @tc.desc   测试accessibilityGroup传入actionControllerId为null参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_actionControllerId_null_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_actionControllerId_null_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_actionControllerId_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_actionControllerId_null_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_actionControllerId_null_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_stateControllerId_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_STATECONTROLLERID_UNDEFINED_001
     * @tc.desc   测试accessibilityGroup传入stateControllerId为undefined参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_stateControllerId_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_stateControllerId_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_stateControllerId_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_stateControllerId_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_stateControllerId_undefined_001] END');
    });

    /**
     * @tc.name   accessibilityGroup_actionControllerId_undefined_001
     * @tc.number SUB_ARKUI_ACCESSIBILITYGROUP_PARAM_ACTIONCONTROLLERID_UNDEFINED_001
     * @tc.desc   测试accessibilityGroup传入actionControllerId为undefined参数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('accessibilityGroup_actionControllerId_undefined_001', Level.LEVEL2, async () => {
      console.info('[accessibilityGroup_actionControllerId_undefined_001] START');

      let strJson: string = getInspectorByKey('text_accessibilityGroup_actionControllerId_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[accessibilityGroup_actionControllerId_undefined_001] obj is: " + JSON.stringify(obj.$attrs));

      // 第一个参数为true时，accessibilityGroup应为true
      let accessibilityGroupValue: ESObject = obj.$attrs.accessibilityGroup;
      expect(accessibilityGroupValue === true).assertTrue();
      console.info('[accessibilityGroup_actionControllerId_undefined_001] END');
    });
  });
}
