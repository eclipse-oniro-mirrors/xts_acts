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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/common/Common";

interface optionsObj {
  uri: string
}

export default function getDragController() {
  describe('getDragController', () => {
    beforeEach(async (done: Function) => {
      console.info("getDragController beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/UIContext/getDragController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getDragController state pages: " + JSON.stringify(pages));
        if (!("getDragController" == pages.name)) {
          console.info("get getDragController state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getDragController success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getDragController page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_getDragController_0100
     * @tc.name      getDragController_0100
     * @tc.desc      getDragController api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */


    it('getDragController_0100', Level.LEVEL0, async  (done: Function) => {
      console.info('getDragController_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('dragFlag'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('Do_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getDragController_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getDragController_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('1');
      console.info('[getDragController_0100] END');
      done();
    });
  })
}

