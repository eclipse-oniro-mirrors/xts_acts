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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function StyledString() {
  describe('StyledString', () => {
    beforeEach(async (done: Function) => {
      console.info("StyledString beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/styledString/StyledString',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StyledString state pages: " + JSON.stringify(pages));
        if (!("StyledString" == pages.name)) {
          console.info("get StyledString state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push StyledString success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StyledString page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_StyledString_0100
     * @tc.name      StyledString_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('StyledString_0100', 0, async (done: Function) => {
      console.info('StyledString_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('but1'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);
      let button2: Component = await driver.findComponent(ON.id('but2'));
      await CommonFunc.sleep(1000);
      await button2.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StyledString_0100] component obj is: " + JSON.stringify(obj));
      let str = 'font-style: normal;font-weight: normal;color: #008000FF;font-family: HarmonyOS Sans;">属性字符串</span><img src="file:///data/storage/el2/base/temp/htmlconvert/'
      expect(obj.$attrs.content).assertContain(str);
      console.info('[StyledString_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_StyledString_0200
     * @tc.name      StyledString_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('StyledString_0200', 0, async (done: Function) => {
      console.info('StyledString_0200 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('but3'));
      await CommonFunc.sleep(1000);
      await button.click()
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[StyledString_0200] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertContain('6');
      console.info('[StyledString_0200] END');
      done();
    });

  })
}

