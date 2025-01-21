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
export default function comSizeAbilityTest_16 () {
  describe('comSizeAbilityTestJsunit', function () {
    beforeEach(async function (done) {
      console.info("comSizeAbilityTestJsunit beforeEach start")
      let options = {
        uri: 'MainAbility/pages/comSizeAbility/comSizeAbilityTest_16'
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
    it('comSizeAbilityTestJsunit_41', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_41 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("Tab_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("Tab_Father");
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
      let button = await driver.findComponent(ON.id('Tab_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_41] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_41] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_41] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_41] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_41] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_41] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_41] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_41] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_41] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth)).assertEqual(Math.round(vp2px(240)));
      expect(Math.round(SizeHeight)).assertEqual(Math.round(vp2px(140)));
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_41] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_42', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_42 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("TextArea_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("TextArea_Father");
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
      let button = await driver.findComponent(ON.id('TextArea_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_42] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_42] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_42] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_42] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_42] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_42] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_42] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_42] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_42] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth - vp2px(150)) <= 1).assertTrue();
      expect(Math.round(SizeHeight - vp2px(120)) <= 1).assertTrue();
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_42] END')
      await CommonFunc.sleep(1000);
      done()
    })
    /* *
        * @tc.number: 测试编号
        * @tc.name  : comSizeAbilityTestJsunit_01
        * @tc.desc  : test the size of component
        * @tc.level : Level 2
        */
    it('comSizeAbilityTestJsunit_43', 0, async  function (done) {
      console.info('comSizeAbilityTestJsunit_43 START')
      await CommonFunc.sleep(1000);
      let modePosition:componentUtils.ComponentInfo = componentUtils.getRectangleById("TextClock_Size");
      let modePosition1:componentUtils.ComponentInfo = componentUtils.getRectangleById("TextClock_Father");
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
      let button = await driver.findComponent(ON.id('TextClock_Size'));
      let rect = await button.getBounds();
      console.info("[comSizeAbilityTestJsunit_43] component rect is: " + JSON.stringify(rect))
      console.info("[comSizeAbilityTestJsunit_43] component Size is: " + JSON.stringify(Size))
      console.info("[comSizeAbilityTestJsunit_43] component LocalOffset is: " + JSON.stringify(LocalOffset))
      console.info("[comSizeAbilityTestJsunit_43] component WindowOffset is: " + JSON.stringify(WindowOffset))
      console.info("[comSizeAbilityTestJsunit_43] component ScreenOffset is: " + JSON.stringify(ScreenOffset))
      console.info("[comSizeAbilityTestJsunit_43] component Translate is: " + JSON.stringify(Translate))
      console.info("[comSizeAbilityTestJsunit_43] component Transform is: " + JSON.stringify(Transform))
      console.info("[comSizeAbilityTestJsunit_43] component Scale is: " + JSON.stringify(Scale))
      console.info("[comSizeAbilityTestJsunit_43] component Rotate is: " + JSON.stringify(Rotate))
      await CommonFunc.sleep(1000);
      expect(Math.round(SizeWidth)).assertEqual(Math.round(vp2px(145)));
      expect(Math.round(SizeHeight)).assertEqual(Math.round(vp2px(110)));
      expect(JSON.stringify(Translate)).assertEqual('{"x":1,"y":1,"z":1}');
      expect(JSON.stringify(Scale)).assertEqual('{"x":1,"y":1,"z":1,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Rotate)).assertEqual('{"x":1,"y":1,"z":1,"angle":0,"centerX":1,"centerY":1}');
      expect(JSON.stringify(Transform)).assertEqual('[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]');
      console.info('[comSizeAbilityTestJsunit_43] END')
      await CommonFunc.sleep(1000);
      done()
    })
  })
}