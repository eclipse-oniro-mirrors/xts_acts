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
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function showDialogHoverMode(){
  describe('showDialogHoverMode',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("showDialogHoverMode beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/promptActionTest/showDialogHoverMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showDialogHoverMode state pages: " + JSON.stringify(pages));
        if (!("showDialogHoverMode" == pages.name)) {
          console.info("get showDialogHoverMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push showDialogHoverMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showDialogHoverMode page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: showDialogHoverMode_0100
    * @tc.name  : showDialogHoverMode_0100
    * @tc.desc  : To test enableHoverMode(false) and hoverModeArea(default)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('showDialogHoverMode_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[showDialogHoverMode_0100] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0100] END');
      done();
    });
    /* *
    * @tc.number: showDialogHoverMode_0200
    * @tc.name  : showDialogHoverMode_0200
    * @tc.desc  : To test enableHoverMode(true) and hoverModeArea(default)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('showDialogHoverMode_0200', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[showDialogHoverMode_0200] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0200] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0200] END');
      done();
    });

    /* *
   * @tc.number: showDialogHoverMode_0300
   * @tc.name  : showDialogHoverMode_0300
   * @tc.desc  : To test enableHoverMode(false) and hoverModeArea(HoverModeAreaType.TOP_SCREEN)
   * @tc.level : Level 3
   * @tc.type
   * @tc.size
   */
    it('showDialogHoverMode_0300', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showDialog'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.text('button1'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0300] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0300] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false hoverModeArea 0');
      await CommonFunc.sleep(500);
      console.info('[showDialogHoverMode_0300] END');
      done();
    });

    /* *
    * @tc.number: showDialogHoverMode_0400
    * @tc.name  : showDialogHoverMode_0400
    * @tc.desc  : To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.TOP_SCREEN)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('showDialogHoverMode_0400', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('showDialog'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.text('button1'));
      await btn3.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0400] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0400] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true hoverModeArea 0');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0400] END');
      done();
    });

    /* *
    * @tc.number: showDialogHoverMode_0500
    * @tc.name  : showDialogHoverMode_0500
    * @tc.desc  : To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.BOTTOM_SCREEN)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('showDialogHoverMode_0500', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('changeEnableHoverMode'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('changeHoverModeArea'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('showDialog'));
      await btn3.click()
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.text('button1'));
      await btn4.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0500] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0500] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true hoverModeArea 1');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0500] END');
      done();
    });
    /* *
    * @tc.number: showDialogHoverMode_0600
    * @tc.name  : showDialogHoverMode_0600
    * @tc.desc  : To test enableHoverMode(false) and hoverModeArea(HoverModeAreaType.BOTTOM_SCREEN)
    * @tc.level : Level 3
    * @tc.type
    * @tc.size
    */
    it('showDialogHoverMode_0600', Level.LEVEL0, async (done:Function) =>{
      console.info('showDialogHoverMode_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('changeHoverModeArea'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('showDialog'));
      await btn3.click()
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.text('button1'));
      await btn4.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showDialogHoverMode_0600] showDialogHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showDialogHoverMode_0600] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showDialogHoverMode_0600] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false hoverModeArea 1');
      await CommonFunc.sleep(1000);
      console.info('[showDialogHoverMode_0600] END');
      done();
    });
  })
}

