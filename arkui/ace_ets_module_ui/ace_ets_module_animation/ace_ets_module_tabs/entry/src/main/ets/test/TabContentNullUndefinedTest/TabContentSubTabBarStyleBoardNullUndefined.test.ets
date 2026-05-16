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

export default function TabContentSubTabBarStyleBoardNullUndefinedTest() {
  describe('TabContentSubTabBarStyleBoardNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TabContentSubTabBarStyleBoardNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TabContentNullUndefined/TabContentSubTabBarStyleBoardNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TabContentSubTabBarStyleBoardNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("TabContentSubTabBarStyleBoardNullUndefined" == pages.name)) {
          console.info("get TabContentSubTabBarStyleBoardNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabContentSubTabBarStyleBoardNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabContentSubTabBarStyleBoardNullUndefinedTest page error:" + err);
      }
      console.info("TabContentSubTabBarStyleBoardNullUndefinedTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   TabContentSubTabBarStyleBoardNullUndefinedTest_001
     * @tc.number TabContentSubTabBarStyleBoardNullUndefinedTest_001
     * @tc.desc   测试TabContent的SubTabBarStyleBoard属性 - undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleBoardNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleBoardNullUndefinedTest_001] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentBoardDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentBoardUndefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_001] default tabBar value is: " + JSON.stringify(objCompare.$attrs.tabBar));
      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_001] undefined tabBar value is: " + JSON.stringify(obj.$attrs.tabBar));

      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_001] default tabBar board value is: " + JSON.stringify(objCompare.$attrs.tabBar.board));
      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_001] undefined tabBar board value is: " + JSON.stringify(obj.$attrs.tabBar.board));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.board)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.board));;

      console.info('[TabContentSubTabBarStyleBoardNullUndefinedTest_001] END');
      done();
    });

    /**
     * @tc.name   TabContentSubTabBarStyleBoardNullUndefinedTest_002
     * @tc.number TabContentSubTabBarStyleBoardNullUndefinedTest_002
     * @tc.desc   测试TabContent的SubTabBarStyleBoard属性 - null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TabContentSubTabBarStyleBoardNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      console.info('[TabContentSubTabBarStyleBoardNullUndefinedTest_002] START');
      await CommonFunc.sleep(1000);
      // 获取默认值组件的属性
      let strJsonCompare: string = getInspectorByKey('tabContentBoardDefault');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

      // 获取undefined参数组件的属性
      let strJson: string = getInspectorByKey('tabContentBoardNull');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_002] default board value is: " + JSON.stringify(objCompare.$attrs.board));
      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_002] null board value is: " + JSON.stringify(obj.$attrs.board));

      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_002] default tabBar board value is: " + JSON.stringify(objCompare.$attrs.tabBar.board));
      console.info("[TabContentSubTabBarStyleBoardNullUndefinedTest_002] null tabBar board value is: " + JSON.stringify(obj.$attrs.tabBar.board));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.tabBar.board)).assertEqual(JSON.stringify(objCompare.$attrs.tabBar.board));

      console.info('[TabContentSubTabBarStyleBoardNullUndefinedTest_002] END');
      done();
    });
  })
}
