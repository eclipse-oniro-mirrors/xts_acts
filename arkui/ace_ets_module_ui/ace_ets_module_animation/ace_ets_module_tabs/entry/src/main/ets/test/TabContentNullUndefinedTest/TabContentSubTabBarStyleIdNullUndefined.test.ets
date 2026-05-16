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

export default function TabContentSubTabBarStyleIdNullUndefinedTest() {
  describe('TabContentSubTabBarStyleIdNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TabContentSubTabBarStyleIdNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentNullUndefined/TabContentSubTabBarStyleIdNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabContentSubTabBarStyleIdNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("TabContentSubTabBarStyleIdNullUndefined" == pages.name)) {
          console.info("get TabContentSubTabBarStyleIdNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabContentSubTabBarStyleIdNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabContentSubTabBarStyleIdNullUndefinedTest page error:" + err);
      }
      console.info("TabContentSubTabBarStyleIdNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   TabContentSubTabBarStyleIdNullUndefinedTest_001
     * @tc.number TabContentSubTabBarStyleIdNullUndefinedTest_001
     * @tc.desc   测试TabContent的SubTabBarStyleId属性 - undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleIdNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleIdNullUndefinedTest_001] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentIdDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentIdUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_001] default tabBar value is: " + JSON.stringify(objCompare.$attrs.tabBar));
      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_001] undefined tabBar value is: " + JSON.stringify(obj.$attrs.tabBar));

      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_001] default tabBar id value is: " + JSON.stringify(objCompare.$attrs.tabBar.id));
      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_001] undefined tabBar id value is: " + JSON.stringify(obj.$attrs.tabBar.id));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.id)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.id));;

      console.info('[TabContentSubTabBarStyleIdNullUndefinedTest_001] END');
      done();
    });

    /**
     * @tc.name   TabContentSubTabBarStyleIdNullUndefinedTest_002
     * @tc.number TabContentSubTabBarStyleIdNullUndefinedTest_002
     * @tc.desc   测试TabContent的SubTabBarStyleId属性 - null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleIdNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleIdNullUndefinedTest_002] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentIdDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentIdNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_002] default id value is: " + JSON.stringify(objCompare.$attrs.id));
      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_002] null id value is: " + JSON.stringify(obj.$attrs.id));

      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_002] default tabBar id value is: " + JSON.stringify(objCompare.$attrs.tabBar.id));
      console.info("[TabContentSubTabBarStyleIdNullUndefinedTest_002] null tabBar id value is: " + JSON.stringify(obj.$attrs.tabBar.id));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.id)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.id));

      console.info('[TabContentSubTabBarStyleIdNullUndefinedTest_002] END');
      done();
    });
  })
}
