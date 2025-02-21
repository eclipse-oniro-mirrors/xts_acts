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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import componentUtils from '@ohos.arkui.componentUtils';
export default function comSizeAbilityTest_10 () {
  describe('comSizeAbilityTestJsunit', function () {
    beforeEach(async function (done) {
      console.info("comSizeAbilityTestJsunit beforeEach start")
      let options = {
        uri: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_10'
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
    it('comSizeAbilityTestJsunit_26', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_26 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("Path_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("Path_Father");
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Path_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_26] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_26] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_26] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_26] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_26] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_26] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_26] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_26] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_26] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth)).assertEqual(Math.round(vp2px(210)));
      expect(Math.round(SizeHeight)).assertEqual(Math.round(vp2px(132)));
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_26] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_27', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_27 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("Polygon_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("Polygon_Father");
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Polygon_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_27] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_27] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_27] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_27] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_27] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_27] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_27] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_27] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_27] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth)).assertEqual(Math.round(vp2px(210)));
      expect(Math.round(SizeHeight)).assertEqual(Math.round(vp2px(140)));
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_27] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_28', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_28 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("Polyline_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("Polyline_Father");
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
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('Polyline_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_28] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_28] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_28] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_28] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_28] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_28] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_28] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_28] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_28] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth)).assertEqual(Math.round(vp2px(210)));
      expect(Math.round(SizeHeight)).assertEqual(Math.round(vp2px(125)));
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_28] END')
      await CommonFunc.sleep(1000);
      done()
    })
  })
}