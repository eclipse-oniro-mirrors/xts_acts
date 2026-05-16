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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function bindSheetKeyboardAvoidMode(){
  describe('bindSheetKeyboardAvoidMode',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("bindSheetKeyboardAvoidMode beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/keyboardAvoidMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get keyboardAvoidMode state pages: " + JSON.stringify(pages));
        if (!("keyboardAvoidMode" == pages.name)) {
          console.info("get keyboardAvoidMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push keyboardAvoidMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindSheetKeyboardAvoidMode page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   bindSheetKeyboardAvoidMode_0100
     * @tc.number bindSheetKeyboardAvoidMode_0100
     * @tc.desc   To test the mode of sheet how to avoid keyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('bindSheetKeyboardAvoidMode_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
      console.info('bindSheetKeyboardAvoidMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('popupButton'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('ipt'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text');
      console.info("[bindSheetKeyboardAvoidMode_0100] bindSheetKeyboardAvoidMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[bindSheetKeyboardAvoidMode_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[bindSheetKeyboardAvoidMode_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('4');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[bindSheetKeyboardAvoidMode_0100] END');
      done();
    });
  })
}
