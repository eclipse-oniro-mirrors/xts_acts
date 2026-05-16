/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect , beforeEach, Level } from '@ohos/hypium';
import Utils from './common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function ScrollCrossAttributeTest() {

  describe('ScrollCrossAttributeTest', () => {

    let PAGE_TAG = 'ScrollCrossAttribute';

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });
    /**
     * @tc.name   ScrollCrossAttributeTest001
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0070
     * @tc.desc   C侧创建Scroll并设置滚动条宽度为20，开启跨语言，TS侧改变滚动条宽度测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest001', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.scrollBarWidth).assertEqual(100)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest002
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0100
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧改变属性测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest002', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_nocross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNodeFalse');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.scrollBarWidth).assertEqual(20)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest003
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0010
     * @tc.desc   C侧创建Scroll，开启跨语言通道，TS侧设置背景色测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest003', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest001] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.backgroundColor).assertEqual("#FF000000")
    });
    /**
     * @tc.name   ScrollCrossAttributeTest004
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0080
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置属性测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest004', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest004] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_nocross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNodeFalse');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest004] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.backgroundColor).assertEqual("#FF00FFFF")
    });
    /**
     * @tc.name   ScrollCrossAttributeTest005
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0040
     * @tc.desc   C侧创建Scroll，开启跨语言，TS侧调用scroller控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest005', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest004] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('scroller_currentOffset');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest004] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertLarger(0)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest006
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0090
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest006', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest006] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_nocross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('scroller_currentOffset');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest006] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual(0)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest007
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0130
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest007', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest007] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_enablePaging_un_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest007] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.enablePaging).assertEqual(undefined)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest008
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0020
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest008', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest008] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest008] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.scrollBar).assertEqual(BarState.On)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest009
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0030
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest009', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest009] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest009] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.enablePaging).assertEqual(true)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest010
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0060
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest010', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest010] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest010] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest011
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0060
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest011', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest011] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_enableScrollInteraction_false_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest011] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest012
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0050
     * @tc.desc   C侧创建Scroll，关闭跨语言通道，TS侧设置控制器滚动测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest012', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest012] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('callback_msg');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest011] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.content).assertEqual("callback")
    });
    /**
     * @tc.name   ScrollCrossAttributeTest013
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0120
     * @tc.desc   TS侧关闭跨语言，C侧设置属性给TS侧scroll测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest013', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}_TS`, done);
      console.info("[ScrollCrossAttributeTest013] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("capiNode"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('typeNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest013] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.edgeEffect).assertEqual(EdgeEffect.Spring)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest014
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0120
     * @tc.desc   TS侧关闭跨语言，C侧设置属性给TS侧scroll测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest014', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}_TS_False`, done);
      console.info("[ScrollCrossAttributeTest014] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("capiNode"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('typeNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest014] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.edgeEffect).assertEqual(EdgeEffect.None)
    });
    /**
     * @tc.name   ScrollCrossAttributeTest015
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0110
     * @tc.desc   TS侧关闭跨语言，C侧设置属性给TS侧scroll测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest015', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}_TS_True`, done);
      console.info("[ScrollCrossAttributeTest015] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("capiNode"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('typeNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest015] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.edgeEffect).assertEqual(EdgeEffect.Spring)
    });

    /**
     * @tc.name   ScrollCrossAttributeTest016
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_TS&C_0070
     * @tc.desc   C侧创建Scroll并设置滚动条宽度为20，开启跨语言，OH_ArkUI_NodeUtils_GetCrossLanguageOption测试
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ScrollCrossAttributeTest016', Level.LEVEL0, async (done: Function) => {
      await Utils.pushPage(`${PAGE_TAG}`, done);
      console.info("[ScrollCrossAttributeTest016] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);
      let clickCAPINode_cross = await driver.findComponent(ON.id("clickCAPINode_width_cross"))
      await Utils.sleep(500);
      await clickCAPINode_cross.click()
      await Utils.sleep(500);
      let scrollJson = getInspectorByKey('capiNode');
      let obj: ESObject = JSON.parse(scrollJson);
      console.info("[ScrollCrossAttributeTest016] component obj is: " + JSON.stringify(obj));
      await Utils.sleep(500);
      expect(obj.$attrs.scrollBarWidth).assertEqual(100)
    });
  })
}
