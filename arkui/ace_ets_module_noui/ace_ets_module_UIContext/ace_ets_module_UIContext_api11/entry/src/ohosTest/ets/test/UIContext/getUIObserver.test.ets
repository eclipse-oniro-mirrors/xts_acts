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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../MainAbility/common/Common";

interface optionsObj {
  uri: string
}

export default function getUIObserver() {
  describe('getUIObserver', () => {
    beforeEach(async (done: Function)=> {
      console.info("getUIObserver beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/UIContext/getUIObserver',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getUIObserver state pages: " + JSON.stringify(pages));
        if (!("getUIObserver" == pages.name)) {
          console.info("get getUIObserver state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getUIObserver success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getUIObserver page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_getUIObserver_0100
     * @tc.name      getUIObserver_0100
     * @tc.desc      getUIObserver api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getUIObserver_0100', 0, async (done: Function)=> {
      console.info('getUIObserver_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('lanYa_id'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('showFlag_id');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[getUIObserver_0100] component obj is: " + JSON.stringify(obj));
      console.info("[getUIObserver_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('30');
      console.info('[getUIObserver_0100] END');
      done();
    });
  })
}

