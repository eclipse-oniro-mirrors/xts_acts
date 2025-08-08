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

export default function ModalTransitionTest(){
  describe('ModalTransitionTest',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("ModalTransitionTest beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/modalTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ModalTransitionTest state pages: " + JSON.stringify(pages));
        if (!("ModalTransitionTest" == pages.name)) {
          console.info("get ModalTransitionTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ModalTransitionTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ModalTransitionTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: ModalTransitionTest_0100
    * @tc.name  : ModalTransitionTest_0100
    * @tc.desc  : To test the mode of sheet how to avoid keyboard
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('ModalTransitionTest_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('ModalTransitionTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('DEFAULT'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text');
      console.info("[ModalTransitionTest_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalTransitionTest_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('0');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0100] END');
      done();
    });

    /* *
    * @tc.number: ModalTransitionTest_0200
    * @tc.name  : ModalTransitionTest_0200
    * @tc.desc  : To test the mode of sheet how to avoid keyboard
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('ModalTransitionTest_0200', Level.LEVEL0, async (done:Function) =>{
      console.info('ModalTransitionTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('NONE'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text');
      console.info("[ModalTransitionTest_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalTransitionTest_0200] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('1');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0200] END');
      done();
    });
    
    /* *
     * @tc.number: ModalTransitionTest_0300
     * @tc.name  : ModalTransitionTest_0300
     * @tc.desc  : To test the mode of sheet how to avoid keyboard
     * @tc.level : Level 3
     * @tc.type
     * @tc.size
     */ 
    it('ModalTransitionTest_0300', Level.LEVEL0, async (done:Function) =>{
      console.info('ModalTransitionTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('ALPHA'));
      await btn1.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('text');
      console.info("[ModalTransitionTest_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ModalTransitionTest_0300] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('2');
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('close'));
      await btn3.click()
      await CommonFunc.sleep(2000);
      console.info('[ModalTransitionTest_0300] END');
      done();
    });

  })
}