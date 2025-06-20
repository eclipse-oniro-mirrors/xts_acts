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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function removeStyles() {
  describe('removeStyles', () => {
    beforeEach(async (done: Function) => {
      console.info("removeStyles beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/removeStyles',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get removeStyles state pages:" + JSON.stringify(pages));
        if (!("removeStyles" == pages.name)) {
          console.info("get removeStyles pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push removeStyles page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push removeStyles page error:" + err);
      }
      console.info("removeStyles beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("removeStyles after each called");
    });
    /**
     * @tc.number    removeStyles_0100
     * @tc.name      removeStyles_0100
     * @tc.desc      A button removeString掉6,5
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('removeStyles_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[removeStyles_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('firstLength'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('lengthId');
      let Obj1: ESObject = JSON.parse(text1);
      expect(Obj1.$attrs.content).assertEqual('6');
      await CommonFunc.sleep(500);


      let button2 = await driver.findComponent(ON.id('endLength'));
      await button2.click();
      await CommonFunc.sleep(1000);

      let text3 = getInspectorByKey('lengthId');
      let Obj3: ESObject = JSON.parse(text3);
      expect(Obj3.$attrs.content).assertEqual('5');
      await CommonFunc.sleep(500);

      console.info('[removeStyles_0100] END');
      done();
    });





  })
}
