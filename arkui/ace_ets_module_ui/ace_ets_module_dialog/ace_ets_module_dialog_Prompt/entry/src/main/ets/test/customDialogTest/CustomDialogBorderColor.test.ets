/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function CustomDialogBorderColor() {
  describe('CustomDialogBorderColor', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialogBorderColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/CustomDialogBorderColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomDialogBorderColor state pages: " + JSON.stringify(pages));
        if (!("CustomDialogBorderColor" == pages.name)) {
          console.info("get CustomDialogBorderColor state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomDialogBorderColor success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogBorderColor page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomDialogBorderColor after each called");
    });

/**
     * @tc.number SUB_ACE_CustomDialogBorderColor_0100
     * @tc.name CustomDialogBorderColor_0100
     * @tc.desc To test the CustomDialogBorderColor:Color.blue
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('CustomDialogBorderColor_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('CustomDialogBorderColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogBorderColor_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[CustomDialogBorderColor_0100] obj2.$children[1].$children[0] borderColor is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[CustomDialogBorderColor_0100] obj2.$children[1].$children[0] borderColor is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderColor));
      let borderColor:string = obj2.$children[1].$children[0].$attrs?.borderColor

      expect(borderColor).assertEqual('#FF0000FF');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('CustomDialogBorderColor_0100 END');
      done();
    });


    /**
     * @tc.number SUB_ACE_CustomDialogBorderColor_0200
     * @tc.name CustomDialogBorderColor_0200
     * @tc.desc To test the CustomDialogBorderColor:#FF6582F8
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('CustomDialogBorderColor_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('CustomDialogBorderColor_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('color1'));
      await button.click();
      await CommonFunc.sleep(1000);

      let obj2: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogBorderColor_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[CustomDialogBorderColor_0200] obj2.$children[1].$children[0] borderColor is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs));
      console.info("[CustomDialogBorderColor_0200] obj2.$children[1].$children[0] borderColor is: " + JSON.stringify(obj2.$children[1].$children[0].$attrs?.borderColor));
      let borderColor:string = obj2.$children[1].$children[0].$attrs?.borderColor

      expect(borderColor).assertEqual('#FF6582F8');
      let btn2: Component = await driver.findComponent(ON.id('close'));
      await btn2.click();
      console.info('CustomDialogBorderColor_0200 END');
      done();
    });
   
  })
}