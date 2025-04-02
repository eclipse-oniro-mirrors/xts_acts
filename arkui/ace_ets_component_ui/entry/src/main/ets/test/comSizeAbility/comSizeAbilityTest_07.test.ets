/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { expect, it, afterEach, afterAll, beforeEach, beforeAll, describe } from "@ohos/hypium"
import router from '@ohos.router';
import { PointerMatrix, WindowMode, ResizeDirection, DisplayRotation, MatchPattern, BY, ON, UiWindow, Driver, Component, UiComponent, UiDriver } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/utils/Common';
import componentUtils from '@ohos.arkui.componentUtils';
export default function comSizeAbilityTest_07 () {
  describe('comSizeAbilityTestJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("comSizeAbilityTestJsunit beforeEach start")
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_07'
      }
      try {
        router.clear()
        let pages = router.getState()
        console.info("get comSizeAbilityTestJsunit state pages: " + JSON.stringify(pages))
        if (!("comSizeAbilityTest" == pages.name)) {
          console.info("get comSizeAbilityTestJsunit state pages.name: " + JSON.stringify(pages.name))
          let result = await router.push(options)
          await CommonFunc.sleep(1000);
          console.info("push comSizeAbilityTestJsunit success: " + JSON.stringify(result))
        }
      } catch (err) {
        console.error ("push comSizeAbilityTestJsunit page error: " + err)
        expect().assertFail()
      }
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_20', 0, async  (done: Function) => {
      console.info('comSizeAbilityTestJsunit_20 START')
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let button1 = await driver.findComponent(ON.id('btn_MenuItemGroup'))
      await button1.click()
      await CommonFunc.sleep(2000)
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("MenuItemGroup_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("MenuItemGroup_Father");
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('MenuItemGroup_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_20] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_20] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_20] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_20] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_20] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_20] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_20] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_20] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_20] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_21', 0, async  (done: Function) => {
      console.info('comSizeAbilityTestJsunit_21 START')
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let button1 = await driver.findComponent(ON.id('btn_MenuItem'))
      await button1.click()
      await CommonFunc.sleep(2000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("MenuItem_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("MenuItem_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('MenuItem_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_21] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_21] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_21] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_21] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_21] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_21] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_21] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_21] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_21] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.abs(SizeWidth - Math.round(vp2px(90))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(vp2px(90))) <= 1).assertTrue();
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_21] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_22', 0, async  (done: Function) => {
      console.info('comSizeAbilityTestJsunit_22 START')
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button1 = await driver.findComponent(ON.id('btn_Menu'))
      await button1.click()
      await CommonFunc.sleep(2000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("Menu_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("Menu_Father");
      let Size = modePosition.size
      let SizeWidth = Size.width
      let SizeHeight = Size.height
      let LocalOffset = modePosition1.localOffset
      let WindowOffset = modePosition.windowOffset
      let ScreenOffset = modePosition.screenOffset
      let Translate = modePosition.translate
      let Transform = modePosition.transform
      let Scale = modePosition.scale
      let Rotate = modePosition.rotate
      let button = await driver.findComponent(ON.id('Menu_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_22] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_22] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_22] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_22] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_22] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_22] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_22] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_22] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_22] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.abs(SizeWidth - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(SizeHeight - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_22] END')
      await CommonFunc.sleep(1000);
      done()
    })
  })
}