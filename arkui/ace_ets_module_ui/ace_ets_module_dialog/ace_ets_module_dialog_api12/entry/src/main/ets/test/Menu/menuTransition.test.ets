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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function menuTransition() {
  describe('menuTransition', () => {
    beforeEach(async (done: Function) => {
      console.info("menuTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menuTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get menuTransition state pages: " + JSON.stringify(pages));
        if (!("menuTransition" == pages.name)) {
          console.info("get menuTransition state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push menuTransition success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menuTransition page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("menuTransition after each called");
    });

    /**
     * @tc.number SUB_ACE_menuTransition_0100
     * @tc.name menuTransition_0100
     * @tc.desc To test the menu attribute transition.
     * @tc.level: Level 0
     * @tc.type : Function
     * @tc.size : MEDIUMTEST
    */
    it('menuTransition_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('menuTransition_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click'));
      await button.click();
      await CommonFunc.sleep(3000);

      let button2 = await driver.findComponent(ON.id('menuText'));
      expect(button2 != null).assertTrue();
      await button2.click();
      await CommonFunc.sleep(1000);
      console.info('menuTransition_0100 END');
      done();
    });
  })
}