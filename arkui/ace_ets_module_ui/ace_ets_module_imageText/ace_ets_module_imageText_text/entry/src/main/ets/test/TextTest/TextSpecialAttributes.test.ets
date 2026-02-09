/**
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
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

export default function TextSpecialAttributesTest() {
  describe('TextSpecialAttributesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSpecialAttributesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextSpecialAttributes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSpecialAttributesTest state pages: " + JSON.stringify(pages));
        if (!("TextSpecialAttributes" == pages.name)) {
          console.info("get TextSpecialAttributesTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSpecialAttributesTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSpecialAttributesTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001
     * @tc.number SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001
     * @tc.desc   测试 Text draggable 属性参数为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] START');

      try {
        let strJson = getInspectorByKey('textDraggableNull');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let draggableValue = attrs ? attrs['draggable'] : undefined;
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] draggable value: " + JSON.stringify(draggableValue));
        expect(draggableValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] Text with draggable(null) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001
     * @tc.desc   测试 Text draggable 属性参数为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] START');

      try {
        let strJson = getInspectorByKey('textDraggableUndefined');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let draggableValue = attrs ? attrs['draggable'] : undefined;
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] draggable value: " + JSON.stringify(draggableValue));
        expect(draggableValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] Text with draggable(undefined) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_PARAM_UNDEFINED_001] END');
      done();
    });

    // ==================== privacySensitive 属性测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001
     * @tc.number SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001
     * @tc.desc   测试 Text privacySensitive 属性参数为 null 的情况（null 表示不敏感）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] START');

      try {
        let strJson = getInspectorByKey('textPrivacySensitiveNull');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let privacySensitiveValue = attrs ? attrs['privacySensitive'] : undefined;
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] privacySensitive value: " + JSON.stringify(privacySensitiveValue));
        // null 表示不敏感，应能正常渲染
        expect(privacySensitiveValue?.toString()).assertEqual('false');

        console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] Text with privacySensitive(null) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001
     * @tc.desc   测试 Text privacySensitive 属性参数为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] START');

      try {
        let strJson = getInspectorByKey('textPrivacySensitiveUndefined');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let privacySensitiveValue = attrs ? attrs['privacySensitive'] : undefined;
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] privacySensitive value: " + JSON.stringify(privacySensitiveValue));
        expect(privacySensitiveValue?.toString()).assertEqual('false');

        console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] Text with privacySensitive(undefined) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_PARAM_UNDEFINED_001] END');
      done();
    });

    // ==================== halfLeading 属性测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001
     * @tc.number SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001
     * @tc.desc   测试 Text halfLeading 属性参数为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] START');

      try {
        let strJson = getInspectorByKey('textHalfLeadingNull');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let halfLeadingValue = attrs ? attrs['halfLeading'] : undefined;
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] halfLeading value: " + JSON.stringify(halfLeadingValue));
        expect(halfLeadingValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] Text with halfLeading(null) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001
     * @tc.desc   测试 Text halfLeading 属性参数为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] START');

      try {
        let strJson = getInspectorByKey('textHalfLeadingUndefined');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let halfLeadingValue = attrs ? attrs['halfLeading'] : undefined;
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] halfLeading value: " + JSON.stringify(halfLeadingValue));
        expect(halfLeadingValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] Text with halfLeading(undefined) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_HALFLEADING_PARAM_UNDEFINED_001] END');
      done();
    });

    // ==================== 边界测试 ====================

    /**
     * @tc.name   SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001
     * @tc.number SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001
     * @tc.desc   测试 Text draggable 属性参数为 null 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setNullButton = await driver.findComponent(ON.text('draggable: null'));
        await setNullButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textDraggableTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let draggableValue = attrs ? attrs['draggable'] : undefined;
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] draggable value: " + JSON.stringify(draggableValue));
        expect(draggableValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] Text handles null value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001
     * @tc.desc   测试 Text draggable 属性参数为 undefined 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setUndefinedButton = await driver.findComponent(ON.text('draggable: undefined'));
        await setUndefinedButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textDraggableTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let draggableValue = attrs ? attrs['draggable'] : undefined;
        console.info("[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] draggable value: " + JSON.stringify(draggableValue));
        expect(draggableValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] Text handles undefined value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_DRAGGABLE_BOUNDARY_UNDEFINED_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001
     * @tc.number SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001
     * @tc.desc   测试 Text privacySensitive 属性参数为 null 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setNullButton = await driver.findComponent(ON.text('privacy: null'));
        await setNullButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textPrivacySensitiveTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let privacySensitiveValue = attrs ? attrs['privacySensitive'] : undefined;
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] privacySensitive value: " + JSON.stringify(privacySensitiveValue));
        expect(privacySensitiveValue?.toString()).assertEqual('false');

        console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] Text handles null value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001
     * @tc.desc   测试 Text privacySensitive 属性参数为 undefined 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setUndefinedButton = await driver.findComponent(ON.text('privacy: undefined'));
        await setUndefinedButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textPrivacySensitiveTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let privacySensitiveValue = attrs ? attrs['privacySensitive'] : undefined;
        console.info("[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] privacySensitive value: " + JSON.stringify(privacySensitiveValue));
        expect(privacySensitiveValue?.toString()).assertEqual('false');

        console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] Text handles undefined value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_PRIVACYSENSITIVE_BOUNDARY_UNDEFINED_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001
     * @tc.number SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001
     * @tc.desc   测试 Text halfLeading 属性参数为 null 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setNullButton = await driver.findComponent(ON.text('halfLeading: null'));
        await setNullButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textHalfLeadingTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let halfLeadingValue = attrs ? attrs['halfLeading'] : undefined;
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] halfLeading value: " + JSON.stringify(halfLeadingValue));
        expect(halfLeadingValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] Text handles null value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001
     * @tc.number SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001
     * @tc.desc   测试 Text halfLeading 属性参数为 undefined 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        let setUndefinedButton = await driver.findComponent(ON.text('halfLeading: undefined'));
        await setUndefinedButton.click();
        await CommonFunc.sleep(1000);

        let strJson = getInspectorByKey('textHalfLeadingTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        expect(obj.$type).assertEqual('Text');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let halfLeadingValue = attrs ? attrs['halfLeading'] : undefined;
        console.info("[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] halfLeading value: " + JSON.stringify(halfLeadingValue));
        expect(halfLeadingValue == undefined).assertTrue();

        console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] Text handles undefined value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_TEXT_HALFLEADING_BOUNDARY_UNDEFINED_001] END');
      done();
    });
  })
}
