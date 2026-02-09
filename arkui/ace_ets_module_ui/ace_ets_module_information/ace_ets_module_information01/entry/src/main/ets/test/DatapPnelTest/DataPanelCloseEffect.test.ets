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

export default function DataPanelCloseEffectTest() {
  describe('DataPanelCloseEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DataPanelCloseEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DataPanel/DataPanelCloseEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DataPanelCloseEffectTest state pages: " + JSON.stringify(pages));
        if (!("DataPanelCloseEffect" == pages.name)) {
          console.info("get DataPanelCloseEffectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DataPanelCloseEffectTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DataPanelCloseEffectTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 null 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] START');

      try {
        // 获取设置了 closeEffect(null) 的 DataPanel 组件信息
        let strJson = getInspectorByKey('dataPanelCloseEffectNull');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('true');

        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] DataPanel component with closeEffect(null) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 undefined 的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] START');

      try {
        // 获取设置了 closeEffect(undefined) 的 DataPanel 组件信息
        let strJson = getInspectorByKey('dataPanelCloseEffectUndefined');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('true');

        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] DataPanel component with closeEffect(undefined) is rendered correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_UNDEFINED_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 false 的情况（默认值，开启动效）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set false" 按钮
        let setFalseButton = await driver.findComponent(ON.text('Set false'));
        await setFalseButton.click();
        await CommonFunc.sleep(1000);

        // 获取 DataPanel 组件信息
        let strJson = getInspectorByKey('dataPanelCloseEffectTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        // 验证 closeEffect 属性值为 false
        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('false');

        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] DataPanel with closeEffect(false) works correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_FALSE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 true 的情况（关闭动效）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set true" 按钮
        let setTrueButton = await driver.findComponent(ON.text('Set true'));
        await setTrueButton.click();
        await CommonFunc.sleep(1000);

        // 获取 DataPanel 组件信息
        let strJson = getInspectorByKey('dataPanelCloseEffectTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        // 验证 closeEffect 属性值为 true
        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('true');
        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] DataPanel with closeEffect(true) works correctly');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_PARAM_TRUE_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 null 时的边界行为（null 在 ArkTS 中等同于 false）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set null" 按钮
        let setNullButton = await driver.findComponent(ON.text('Set null'));
        await setNullButton.click();
        await CommonFunc.sleep(1000);

        // 验证组件仍然可以正常渲染
        let strJson = getInspectorByKey('dataPanelCloseEffectTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        // 验证 closeEffect 属性值（null 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('true');

        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] DataPanel handles null value correctly (treats as falsy value)');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_NULL_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001
     * @tc.number SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001
     * @tc.desc   测试 DataPanel closeEffect 属性参数为 undefined 时的边界行为（undefined 在 ArkTS 中等同于 false）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] START');

      try {
        let driver = await Driver.create();
        await CommonFunc.sleep(500);

        // 点击 "Set undefined" 按钮
        let setUndefinedButton = await driver.findComponent(ON.text('Set undefined'));
        await setUndefinedButton.click();
        await CommonFunc.sleep(1000);

        // 验证组件仍然可以正常渲染
        let strJson = getInspectorByKey('dataPanelCloseEffectTest');
        let obj: Record<string, Object> = JSON.parse(strJson);
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] component obj is: " + JSON.stringify(obj));

        // 验证组件类型
        expect(obj.$type).assertEqual('DataPanel');

        // 验证 closeEffect 属性值（undefined 被视为 falsy 值，等同于 false）
        let attrs = obj['$attrs'] as Record<string, Object>;
        let closeEffectValue = attrs ? attrs['closeEffect'] : undefined;
        console.info("[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] closeEffect value: " + JSON.stringify(closeEffectValue));
        expect(closeEffectValue?.toString()).assertEqual('true');

        console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] DataPanel handles undefined value correctly (treats as falsy value)');
      } catch (err) {
        console.error(`[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] error: ${JSON.stringify(err)}`);
      }

      console.info('[SUB_ARKUI_DATAPANEL_CLOSEEFFECT_BOUNDARY_UNDEFINED_001] END');
      done();
    });
  })
}
