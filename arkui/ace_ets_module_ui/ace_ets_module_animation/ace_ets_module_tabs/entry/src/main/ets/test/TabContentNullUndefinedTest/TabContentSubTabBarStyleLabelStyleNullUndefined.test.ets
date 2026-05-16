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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { Component, Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TabContentSubTabBarStyleLabelStyleNullUndefinedTest() {
  describe('TabContentSubTabBarStyleLabelStyleNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TabContentSubTabBarStyleLabelStyleNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentNullUndefined/TabContentSubTabBarStyleLabelStyleNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabContentSubTabBarStyleLabelStyleNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("TabContentSubTabBarStyleLabelStyleNullUndefined" == pages.name)) {
          console.info("get TabContentSubTabBarStyleLabelStyleNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabContentSubTabBarStyleLabelStyleNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabContentSubTabBarStyleLabelStyleNullUndefinedTest page error:" + err);
      }
      console.info("TabContentSubTabBarStyleLabelStyleNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001
     * @tc.number TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001
     * @tc.desc   测试TabContent的SubTabBarStyleLabelStyle属性 - undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentLabelStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentLabelStyleUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] default tabBar value is: " + JSON.stringify(objCompare.$attrs.tabBar));
      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] undefined tabBar value is: " + JSON.stringify(obj.$attrs.tabBar));

      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] default tabBar labelStyle value is: " + JSON.stringify(objCompare.$attrs.tabBar.labelStyle));
      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] undefined tabBar labelStyle value is: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.labelStyle)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.labelStyle));

      console.info('[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_001] END');
      done();
    });

    /**
     * @tc.name   TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002
     * @tc.number TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002
     * @tc.desc   测试TabContent的SubTabBarStyleLabelStyle属性 - null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentLabelStyleDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentLabelStyleNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] default labelStyle value is: " + JSON.stringify(objCompare.$attrs.labelStyle));
      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] null labelStyle value is: " + JSON.stringify(obj.$attrs.labelStyle));

      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] default tabBar labelStyle value is: " + JSON.stringify(objCompare.$attrs.tabBar.labelStyle));
      console.info("[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] null tabBar labelStyle value is: " + JSON.stringify(obj.$attrs.tabBar.labelStyle));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.labelStyle)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.labelStyle));

      console.info('[TabContentSubTabBarStyleLabelStyleNullUndefinedTest_002] END');
      done();
    });
  })
}
