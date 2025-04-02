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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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
     * @tc.number    CustomDialogKeyboardAvoidDistance_0100
     * @tc.name      CustomDialogKeyboardAvoidDistance_0100
     * @tc.desc      set keyboardAvoidDistance:200px,levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
      it('CustomDialogKeyboardAvoidDistance_0100', 0, async (done: Function) => {
      console.info('CustomDialogKeyboardAvoidDistance_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog = Utils.getComponentRect('customDialog');
      let top1 = customDialog.top
      let bottom1 = customDialog.bottom
      let right1 = customDialog.right
      let middle1 = (bottom1 - top1) / 2 + top1
      let left1 = customDialog.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog.left + ', top: ' + customDialog.top +
        ', right:' + customDialog.right + ', bottom:' + customDialog.bottom + ',middle:' + middle1);
      let keyboard = Utils.getComponentRect('keyboard');
      let top = keyboard.top
      let bottom = keyboard.bottom
      let right = keyboard.right
      let middle = (bottom - top) / 2 + top
      let left = keyboard.left
      console.info('[CustomDialog_keyboard_2] left: ' + keyboard.left + ', top: ' + keyboard.top +
        ', right:' + keyboard.right + ', bottom:' + keyboard.bottom + ',middle:' + middle);
      let keyboardAvoidDistance = keyboard.top - customDialog.bottom;
      expect(keyboardAvoidDistance).assertEqual(200);
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      console.info('CustomDialogKeyboardAvoidDistance_0100 END');
      done();
    });

    /**
     * @tc.number    customDialogKeyboardAvoidDistance_0200
     * @tc.name      customDialogKeyboardAvoidDistance_0200
     * @tc.desc      set keyboardAvoidDistance:undefined,levelUniqueId: Abnormal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
     it('customDialogKeyboardAvoidDistance_0200', 0, async (done: Function) => {
      console.info('customDialogKeyboardAvoidDistance_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn2 = await driver.findComponent(ON.id('btn2'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog = Utils.getComponentRect('customDialog');
      let top1 = customDialog.top
      let bottom1 = customDialog.bottom
      let right1 = customDialog.right
      let middle1 = (bottom1-top1) / 2 + top1
      let left1 =customDialog.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog.left + ', top: ' + customDialog.top +
        ', right:' + customDialog.right + ', bottom:' + customDialog.bottom + ',middle:' + middle1);
      let keyboard = Utils.getComponentRect('keyboard');
      let top = keyboard.top
      let bottom = keyboard.bottom
      let right = keyboard.right
      let middle = (bottom-top) / 2 + top
      let left =keyboard.left
      console.info('[CustomDialog_keyboard_2] left: ' + keyboard.left + ', top: ' + keyboard.top +
        ', right:' + keyboard.right + ', bottom:' + keyboard.bottom + ',middle:' + middle);
      let keyboardAvoidDistance = keyboard.top - customDialog.bottom;
      let str = vp2px(16).toFixed(2).toString();
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      expect(JSON.stringify(keyboardAvoidDistance) + '.00').assertEqual(str);
      console.info('customDialogKeyboardAvoidDistance_0200 END');
      done();
    });

    /**
     * @tc.number    customDialogKeyboardAvoidDistance_0300
     * @tc.name      customDialogKeyboardAvoidDistance_0300
     * @tc.desc      set keyboardAvoidDistance:null,levelUniqueId: Abnormal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
     it('customDialogKeyboardAvoidDistance_0300', 0, async (done: Function) => {
      console.info('customDialogKeyboardAvoidDistance_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn3 = await driver.findComponent(ON.id('btn3'));
      await btn3.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog = Utils.getComponentRect('customDialog');
      let top1 = customDialog.top
      let bottom1 = customDialog.bottom
      let right1 = customDialog.right
      let middle1 = (bottom1-top1) / 2 + top1
      let left1 =customDialog.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog.left + ', top: ' + customDialog.top +
        ', right:' + customDialog.right + ', bottom:' + customDialog.bottom + ',middle:' + middle1);
      let keyboard = Utils.getComponentRect('keyboard');
      let top = keyboard.top
      let bottom = keyboard.bottom
      let right = keyboard.right
      let middle = (bottom-top) / 2 + top
      let left =keyboard.left
      console.info('[CustomDialog_keyboard_2] left: ' + keyboard.left + ', top: ' + keyboard.top +
        ', right:' + keyboard.right + ', bottom:' + keyboard.bottom + ',middle:' + middle);
      let keyboardAvoidDistance = keyboard.top - customDialog.bottom;
      let str = vp2px(16).toFixed(2).toString();
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      expect(JSON.stringify(keyboardAvoidDistance) + '.00').assertEqual(str);
      console.info('customDialogKeyboardAvoidDistance_0300 END');
      done();
    });

  })
}