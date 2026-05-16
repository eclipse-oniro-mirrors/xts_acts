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

export default function TabContentSubTabBarStylePaddingNullUndefinedTest() {
  describe('TabContentSubTabBarStylePaddingNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TabContentSubTabBarStylePaddingNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentNullUndefined/TabContentSubTabBarStylePaddingNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabContentSubTabBarStylePaddingNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("TabContentSubTabBarStylePaddingNullUndefined" == pages.name)) {
          console.info("get TabContentSubTabBarStylePaddingNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabContentSubTabBarStylePaddingNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabContentSubTabBarStylePaddingNullUndefinedTest page error:" + err);
      }
      console.info("TabContentSubTabBarStylePaddingNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   TabContentSubTabBarStylePaddingNullUndefinedTest_001
     * @tc.number TabContentSubTabBarStylePaddingNullUndefinedTest_001
     * @tc.desc   测试TabContent的SubTabBarStylePadding属性 - undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStylePaddingNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStylePaddingNullUndefinedTest_001] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentPaddingDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentPaddingUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_001] default tabBar value is: " + JSON.stringify(objCompare.$attrs.tabBar));
      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_001] undefined tabBar value is: " + JSON.stringify(obj.$attrs.tabBar));

      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_001] default tabBar padding value is: " + JSON.stringify(objCompare.$attrs.tabBar.padding));
      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_001] undefined tabBar padding value is: " + JSON.stringify(obj.$attrs.tabBar.padding));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.padding)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.padding));;

      console.info('[TabContentSubTabBarStylePaddingNullUndefinedTest_001] END');
      done();
    });

    /**
     * @tc.name   TabContentSubTabBarStylePaddingNullUndefinedTest_002
     * @tc.number TabContentSubTabBarStylePaddingNullUndefinedTest_002
     * @tc.desc   测试TabContent的SubTabBarStylePadding属性 - null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStylePaddingNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStylePaddingNullUndefinedTest_002] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentPaddingDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentPaddingNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_002] default padding value is: " + JSON.stringify(objCompare.$attrs.padding));
      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_002] null padding value is: " + JSON.stringify(obj.$attrs.padding));

      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_002] default tabBar padding value is: " + JSON.stringify(objCompare.$attrs.tabBar.padding));
      console.info("[TabContentSubTabBarStylePaddingNullUndefinedTest_002] null tabBar padding value is: " + JSON.stringify(obj.$attrs.tabBar.padding));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.padding)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.padding));

      console.info('[TabContentSubTabBarStylePaddingNullUndefinedTest_002] END');
      done();
    });
  })
}
