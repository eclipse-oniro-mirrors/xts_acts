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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function getFilteredInspectorTreeByIdDepthBoundaryTest() {
  describe('GetFilteredInspectorTreeByIdDepthBoundaryTest', () => {
    beforeAll(async () => {
      console.info('[GetFilteredInspectorTreeByIdDepthBoundaryTest] 测试前置开始');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/UIContextTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!('UIContextTest' == pages.name)) {
          await router.push(options);
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error('[GetFilteredInspectorTreeByIdDepthBoundaryTest] push page error: ' + err);
      }
      console.info('[GetFilteredInspectorTreeByIdDepthBoundaryTest] 测试前置结束');
    });

    afterEach(async () => {
      console.info('[GetFilteredInspectorTreeByIdDepthBoundaryTest] afterEach called');
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为最小边界值0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_0'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text01_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('testId');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为最小边界值+1（即1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_1'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text02_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('testId');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MIN_BOUNDARY_PLUS_ONE_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为典型有效值（即100）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_100'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text03_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('testId');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_TYPICAL_VALUE_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为最大边界值-1（即2147483646）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_max_minus_one'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text04_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('testId');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_MINUS_ONE_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为最大边界值（即2147483647）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_max'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text05_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('testId');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_MAX_BOUNDARY_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数小于最小边界值（即-1），期望抛出错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_negative'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text06_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('401');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_BELOW_MIN_BOUNDARY_0600] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数大于最大边界值（即2147483648），期望抛出错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_above_max'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text07_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('401');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_ABOVE_MAX_BOUNDARY_0700] END');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800
     * @tc.name   SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800
     * @tc.desc   测试getFilteredInspectorTreeById方法的depth参数为较大的负数（即-2147483648），期望抛出错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800', Level.LEVEL2, async (done: Function) => {
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(2000);
      
      let scrollBar: Component = await driver.findComponent(ON.id('main_scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('btn_depth_large_negative'));
      await btn.click();
      
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text08_id');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800] strJson: ' + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800] response: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('401');
      console.info('[SUB_ARKUI_UICONTEXT_GETFILTEREDINSPECTORTREEBYID_DEPTH_LARGE_NEGATIVE_VALUE_0800] END');
      done();
    });
  })
}