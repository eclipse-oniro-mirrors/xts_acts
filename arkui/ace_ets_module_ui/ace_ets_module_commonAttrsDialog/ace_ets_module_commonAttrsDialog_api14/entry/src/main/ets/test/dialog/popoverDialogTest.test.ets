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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function popoverDialogTest(){
  describe('popoverDialogTest',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("popoverDialogTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/dialog/popoverDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get popoverDialogTest state pages: " + JSON.stringify(pages));
        if (!("popoverDialogTest" == pages.name)) {
          console.info("get popoverDialogTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push popoverDialogTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push popoverDialogTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   popoverDialogTest_0100
     * @tc.number popoverDialogTest_0100
     * @tc.desc   To to test the use of PopoverDialog Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('popoverDialogTest_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('popoverDialogTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('btn'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('确认'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[popoverDialogTest_0100] popoverDialogTest JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[popoverDialogTest_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[popoverDialogTest_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('close');
            await CommonFunc.sleep(1000);
      console.info('[popoverDialogTest_0100] END');
      done();
    });
  })
}

