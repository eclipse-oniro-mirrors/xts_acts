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

export default function showToastHoverMode(){
  describe('showToastHoverMode',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("showToastHoverMode beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/promptActionTest/showToastHoverMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showToastHoverMode state pages: " + JSON.stringify(pages));
        if (!("showToastHoverMode" == pages.name)) {
          console.info("get showToastHoverMode state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push showToastHoverMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showToastHoverMode page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   showToastHoverMode_0100
     * @tc.number showToastHoverMode_0100
     * @tc.desc   To test enableHoverMode(false) and hoverModeArea(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showToast1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[showToastHoverMode_0100] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false');
      await CommonFunc.sleep(1000);
      console.info('[showToastHoverMode_0100] END');
      done();
    });
    /**
     * @tc.name   showToastHoverMode_0200
     * @tc.number showToastHoverMode_0200
     * @tc.desc   To test enableHoverMode(true) and hoverModeArea(default)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0200', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('showToast1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[showToastHoverMode_0200] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0200] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true');
      await CommonFunc.sleep(1000);
      console.info('[showToastHoverMode_0200] END');
      done();
    });

    /**
     * @tc.name   showToastHoverMode_0300
     * @tc.number showToastHoverMode_0300
     * @tc.desc   To test enableHoverMode(false) and hoverModeArea(HoverModeAreaType.TOP_SCREEN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0300', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('showToast'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showToastHoverMode_0300] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0300] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false hoverModeArea 0');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0300] END');
      done();
    });
    /**
     * @tc.name   showToastHoverMode_0400
     * @tc.number showToastHoverMode_0400
     * @tc.desc   To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.TOP_SCREEN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0400', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('showToast'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showToastHoverMode_0400] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0400] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true hoverModeArea 0');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0400] END');
      done();
    });

    /**
     * @tc.name   showToastHoverMode_0500
     * @tc.number showToastHoverMode_0500
     * @tc.desc   To test enableHoverMode(true) and hoverModeArea(HoverModeAreaType.BOTTOM_SCREEN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0500', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('init'));

      await btn.click()
      await CommonFunc.sleep(1000);
      let btn1 = await scrollBar.scrollSearch(ON.id('changeEnableHoverMode'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('changeHoverModeArea'));
      await btn2.click()
      await CommonFunc.sleep(1000);

      let btn3 = await scrollBar.scrollSearch(ON.id('showToast'));
      await btn3.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showToastHoverMode_0500] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0500] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode true hoverModeArea 1');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0500] END');
      done();
    });
    /**
     * @tc.name   showToastHoverMode_0600
     * @tc.number showToastHoverMode_0600
     * @tc.desc   To test enableHoverMode(false) and hoverModeArea(HoverModeAreaType.BOTTOM_SCREEN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showToastHoverMode_0600', Level.LEVEL0, async (done:Function) =>{
      console.info('showToastHoverMode_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let btn = await scrollBar.scrollSearch(ON.id('init'));
      await btn.click()
      await CommonFunc.sleep(1000);
      let btn2 = await scrollBar.scrollSearch(ON.id('changeHoverModeArea'));
      await btn2.click()
      await CommonFunc.sleep(1000);
      let btn3 = await scrollBar.scrollSearch(ON.id('showToast'));
      await btn3.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      console.info("[showToastHoverMode_0600] showToastHoverMode JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[showToastHoverMode_0600] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[showToastHoverMode_0600] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('enableHoverMode false hoverModeArea 1');
      await CommonFunc.sleep(2000);
      console.info('[showToastHoverMode_0600] END');
      done();
    });
   
  })
}

