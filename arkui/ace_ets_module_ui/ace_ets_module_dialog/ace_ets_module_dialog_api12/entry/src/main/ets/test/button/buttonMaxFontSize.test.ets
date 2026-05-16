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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function buttonMaxFontSize() {
  describe('buttonMaxFontSize', () => {
    beforeEach(async (done: Function) => {
      console.info("buttonMaxFontSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/buttonMaxFontSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get buttonMaxFontSize state pages: " + JSON.stringify(pages));
        if (!("buttonMaxFontSize" == pages.name)) {
          console.info("get buttonMaxFontSize state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push buttonMaxFontSize success: " + JSON.stringify(result));
        }
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push buttonMaxFontSize page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   buttonMaxFontSize_0100
     * @tc.number SUB_ACE_buttonMaxFontSize_0100
     * @tc.desc   To test that the button MaxFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buttonMaxFontSize_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('buttonMaxFontSize_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('button1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonMaxFontSize_0100] title1: " + JSON.parse(obj.$attrs.labelStyle));
      expect(JSON.parse(obj.$attrs.labelStyle).maxFontSize).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_0100] END');
      done();
    });

    /**
     * @tc.name   buttonMaxFontSize_0200
     * @tc.number SUB_ACE_buttonMaxFontSize_0200
     * @tc.desc   To test that the button MaxFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buttonMaxFontSize_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('buttonMaxFontSize_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('button2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonMaxFontSize_0200] title1: " + JSON.parse(obj.$attrs.labelStyle));
      expect(JSON.parse(obj.$attrs.labelStyle).maxFontSize).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_0200] END');
      done();
    });
    /**
     * @tc.name   buttonMaxFontSize_0300
     * @tc.number SUB_ACE_buttonMaxFontSize_0300
     * @tc.desc   To test that the button MaxFontSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buttonMaxFontSize_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('buttonMaxFontSize_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      
      let strJson = getInspectorByKey('button3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[buttonMaxFontSize_0300] title1: " + JSON.parse(obj.$attrs.labelStyle));
      expect(JSON.parse(obj.$attrs.labelStyle).maxFontSize).assertEqual("12.00fp");
      console.info('[buttonMaxFontSize_0300] END');
      done();
    });
    
  })
}