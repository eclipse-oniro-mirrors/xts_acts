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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { BY, Driver, UiDriver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';

export default function customDialogKeyboardAvoidDistance() {
  describe('customDialogKeyboardAvoidDistance', () => {
    beforeEach(async (done: Function) => {
      console.info("customDialogKeyboardAvoidDistance beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/customDialog/customDialogKeyboardAvoidDistance",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customDialogKeyboardAvoidDistance state pages: " + JSON.stringify(pages));
        if (!("customDialogKeyboardAvoidDistance" == pages.name)) {
          console.info("get customDialogKeyboardAvoidDistance state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push customDialogKeyboardAvoidDistance success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogKeyboardAvoidDistance page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   CustomDialogKeyboardAvoidDistance_0100
     * @tc.number CustomDialogKeyboardAvoidDistance_0100
     * @tc.desc   set keyboardAvoidDistance:20vp,levelUniqueId: Normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('CustomDialogKeyboardAvoidDistance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CustomDialogKeyboardAvoidDistance_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let column:Component = await driver.findComponent(ON.type('Column').isAfter(ON.type('Dialog')));
      let rect = await column.getBounds();
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let left = rect.left
      console.info('[CustomDialog_001_dialog] left: ' + rect.left + ', top: ' + rect.top +
        ', right:' + rect.right + ', bottom:' + rect.bottom );
      let Keyboard:Component = await driver.findComponent(ON.type('Keyboard'));
      let rect1 = await Keyboard.getBounds();
      let top1 = rect1.top
      let bottom1 = rect1.bottom
      let right1 = rect1.right
      let left1 = rect1.left
      console.info('[CustomDialog_001_keyboard] left: ' + rect1.left + ', top: ' + rect1.top +
        ', right:' + rect1.right + ', bottom:' + rect1.bottom );
      let keyboardAvoidDistance = top1 - bottom;
      let str = vp2px(20);
      let str1 = Math.ceil(str)
      let cancelButton1: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton1?.click();
      expect(keyboardAvoidDistance >= str1 - 2 && keyboardAvoidDistance <= str1 + 2 ).assertEqual(true);
      console.info('CustomDialogKeyboardAvoidDistance_0100 END');
      done();
    });

     /**
      * @tc.name   CustomDialogKeyboardAvoidDistance_0200
      * @tc.number customDialogKeyboardAvoidDistance_0200
      * @tc.desc   set keyboardAvoidDistance:undefined,levelUniqueId: Abnormal value
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('CustomDialogKeyboardAvoidDistance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('CustomDialogKeyboardAvoidDistance_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('btn2'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let column:Component = await driver.findComponent(ON.type('Column').isAfter(ON.type('Dialog')));
      let rect = await column.getBounds();
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let left = rect.left
      console.info('[CustomDialog_003_dialog] left: ' + rect.left + ', top: ' + rect.top +
        ', right:' + rect.right + ', bottom:' + rect.bottom );
      let Keyboard:Component = await driver.findComponent(ON.type('Keyboard'));
      let rect1 = await Keyboard.getBounds();
      let top1 = rect1.top
      let bottom1 = rect1.bottom
      let right1 = rect1.right
      let left1 = rect1.left
      console.info('[CustomDialog_004_keyboard] left: ' + rect1.left + ', top: ' + rect1.top +
        ', right:' + rect1.right + ', bottom:' + rect1.bottom );
      let keyboardAvoidDistance = top1 - bottom;
      let str = vp2px(16);
      let str1 = Math.ceil(str)
      let cancelButton1: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton1?.click();
      expect(keyboardAvoidDistance >= str1 - 2 && keyboardAvoidDistance <= str1 + 2 ).assertEqual(true);
      console.info('CustomDialogKeyboardAvoidDistance_0200 END');
      done();
    });
  })
}