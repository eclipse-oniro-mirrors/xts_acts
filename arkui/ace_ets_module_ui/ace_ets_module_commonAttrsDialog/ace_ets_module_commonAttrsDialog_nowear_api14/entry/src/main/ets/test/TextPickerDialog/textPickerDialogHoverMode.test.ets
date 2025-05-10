/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import display from '@ohos.display';

export default function textPickerDialogHoverMode(){
  describe('textPickerDialogHoverMode',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("textPickerDialogHoverMode beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/TextPickerDialog/TextPickerDialogHoverMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textPickerDialogHoverMode state pages: " + JSON.stringify(pages));
        if (!("textPickerDialogHoverMode" == pages.name)) {
          console.info("get textPickerDialogHoverMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push textPickerDialogHoverMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPickerDialogHoverMode page error: " + err);
        expect().assertFail();
      }
      done();
    });
     afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MultiNavigation after each called");
    });
    /* *
    * @tc.number: textPickerDialogHoverMode_0100
    * @tc.name  : textPickerDialogHoverMode_0100
    * @tc.desc  : To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.TOP_SCREEN)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('textPickerDialogHoverMode_0100', 0, async (done:Function) =>{
      console.info('textPickerDialogHoverMode_0100 START');
      if(display.isFoldable() && display.getFoldStatus()==3){
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let col = await driver.findComponent(ON.id('col'))
        let height = await  col.getBoundsCenter()
        console.info('col is'+ height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        await btn1.click()
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('textPickerDialog'));
        await btn2.click()
        await CommonFunc.sleep(1000);
        let btn4 = await driver.findComponent(ON.text('确定'))
        let rect = await btn4.getBounds()
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y < 0 ).assertTrue();
        await CommonFunc.sleep(1000);
        await btn4.click()
        await CommonFunc.sleep(1000);
      }
      console.info('[textPickerDialogHoverMode_0100] END');
      done();
    });
    /* *
    * @tc.number: textPickerDialogHoverMode_0200
    * @tc.name  : textPickerDialogHoverMode_0200
    * @tc.desc  : To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.BOTTOM_SCREEN)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('textPickerDialogHoverMode_0200', 0, async (done:Function) =>{
      console.info('textPickerDialogHoverMode_0200 START');
      if(display.isFoldable() && display.getFoldStatus()==3){
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let col = await driver.findComponent(ON.id('col'))
        let height = await col.getBoundsCenter()
        console.info('col is'+ height.y)
        let btn1 = await driver.findComponent(ON.id('btn1'));
        await btn1.click()
        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('btn2'));
        await btn2.click()
        await CommonFunc.sleep(1000);
        let btn3 = await driver.findComponent(ON.id('textPickerDialog'))
        await btn3.click()
        await CommonFunc.sleep(1000);
        let btn4 = await driver.findComponent(ON.text('确定'))
        let rect = await btn4.getBounds()
        console.info(`rect is: ` + JSON.stringify(rect))
        expect(rect.top - height.y > 0 ).assertTrue();
        await CommonFunc.sleep(1000);
        await btn4.click()
        await CommonFunc.sleep(1000);
      }
      console.info('[textPickerDialogHoverMode_0200] END');
      done();
    });
  })
}