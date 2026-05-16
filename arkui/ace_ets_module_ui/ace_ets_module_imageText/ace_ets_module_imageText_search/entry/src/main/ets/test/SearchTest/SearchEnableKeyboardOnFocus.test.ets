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

export default function SearchEnableKeyboardOnFocusTest() {
  describe('SearchEnableKeyboardOnFocusTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchEnableKeyboardOnFocusTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchEnableKeyboardOnFocus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchEnableKeyboardOnFocusTest state pages: " + JSON.stringify(pages));
        if (!("SearchEnableKeyboardOnFocus" == pages.name)) {
          console.info("get SearchEnableKeyboardOnFocusTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchEnableKeyboardOnFocusTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchEnableKeyboardOnFocusTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001
     * @tc.number SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001
     * @tc.desc   测试 Search enableKeyboardOnFocus 属性参数为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] START');

      try {
        // 获取设置了 enableKeyboardOnFocus(null) 的 Search 组件信息
        let strJson = getInspectorByKey('searchEnableKeyboardOnFocusNull');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] component obj is: " +
        JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('Search');
        let strJson2 = getInspectorByKey('searchEnableKeyboardOnFocusDefault');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] component obj is: " +
        JSON.stringify(obj2));

        // 验证 enableKeyboardOnFocus 属性值（null 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue = attrs ? attrs['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue));

        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue2 = attrs2 ? attrs2['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue2));
        // null 作为 boolean 参数时，应被转换为 false 或默认值 true
        expect(enableKeyboardOnFocusValue).assertEqual(enableKeyboardOnFocusValue2);

        console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] Search component ' +
          'with enableKeyboardOnFocus(null) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001
     * @tc.desc   测试 Search enableKeyboardOnFocus 属性参数为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] START');

      try {
        // 获取设置了 enableKeyboardOnFocus(undefined) 的 Search 组件信息
        let strJson = getInspectorByKey('searchEnableKeyboardOnFocusUndefined');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] component obj is: " +
        JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('Search');
        let strJson2 = getInspectorByKey('searchEnableKeyboardOnFocusDefault');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] component obj is: " +
        JSON.stringify(obj2));

        // 验证 enableKeyboardOnFocus 属性值（undefined 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue = attrs ? attrs['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue));

        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue2 = attrs2 ? attrs2['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue2));
        // undefined 作为 boolean 参数时，应被转换为 false 或默认值 true
        expect(enableKeyboardOnFocusValue).assertEqual(enableKeyboardOnFocusValue2);

        console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] Search component ' +
          'with enableKeyboardOnFocus(undefined) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_PARAM_UNDEFINED_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001
     * @tc.number SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001
     * @tc.desc   测试 Search enableKeyboardOnFocus 属性参数为 null 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set null" 按钮
        let setNullButton = await driver.findComponent(ON.text('Set null'));
        await setNullButton.click();
        await CommonFunc.sleep(1000);

        // 验证组件仍然可以正常渲染
        let strJson = getInspectorByKey('searchEnableKeyboardOnFocusTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] component obj is: " +
        JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('Search');

        // 验证 enableKeyboardOnFocus 属性值（null 被视为 falsy 值）
        let strJson2 = getInspectorByKey('searchEnableKeyboardOnFocusDefault');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] component obj is: " +
        JSON.stringify(obj2));

        // 验证 enableKeyboardOnFocus 属性值（null 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue = attrs ? attrs['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue));

        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue2 = attrs2 ? attrs2['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue2));
        // 组件属性动态切换应能正常处理 null 值
        expect(enableKeyboardOnFocusValue).assertEqual(enableKeyboardOnFocusValue2);
        console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] Search handles null value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001
     * @tc.number SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001
     * @tc.desc   测试 Search enableKeyboardOnFocus 属性参数为 undefined 时的边界行为
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set undefined" 按钮
        let setUndefinedButton = await driver.findComponent(ON.text('Set undefined'));
        await setUndefinedButton.click();
        await CommonFunc.sleep(1000);

        // 验证组件仍然可以正常渲染
        let strJson = getInspectorByKey('searchEnableKeyboardOnFocusTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] component obj is: " +
        JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('Search');

        // 验证 enableKeyboardOnFocus 属性值（undefined 应保持默认值）
        let strJson2 = getInspectorByKey('searchEnableKeyboardOnFocusDefault');
        let obj2: Record<string, Object> = JSON.parse(strJson2);
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] component obj is: " +
        JSON.stringify(obj2));

        // 验证 enableKeyboardOnFocus 属性值（undefined 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue = attrs ? attrs['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue));

        let attrs2 = obj2['$attrs'] as Record<string, Object>;
        let enableKeyboardOnFocusValue2 = attrs2 ? attrs2['enableKeyboardOnFocus'] : undefined;
        console.info("[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] enableKeyboardOnFocus value: " +
        JSON.stringify(enableKeyboardOnFocusValue2));
        // 组件属性动态切换应能正常处理 undefined 值
        expect(enableKeyboardOnFocusValue).assertEqual(enableKeyboardOnFocusValue2);

        console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] undefined value correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_SEARCH_ENABLEKEYBOARDONFOCUS_BOUNDARY_UNDEFINED_001] END');
      done();
    });
  })
}
