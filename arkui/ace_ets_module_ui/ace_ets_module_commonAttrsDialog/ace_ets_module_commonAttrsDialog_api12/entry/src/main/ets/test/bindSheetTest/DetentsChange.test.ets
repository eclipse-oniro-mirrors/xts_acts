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
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';


export default function DetentsChange() {
  describe('DetentsChange', () => {
    beforeEach(async (done: Function) => {
      console.info("DetentsChange beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/DetentsChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DetentsChange state pages: " + JSON.stringify(pages));
        if (!("DetentsChange" == pages.name)) {
          console.info("get DetentsChange state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DetentsChange success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DetentsChange page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : DetentsChange_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('DetentsChange_0100', 0, async (done: Function) => {
      console.info('DetentsChange_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DetentsChange'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('DetentsChangeValue');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DetentsChange_0100] component obj is: " + JSON.stringify(obj));
      console.info("[DetentsChange_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("DetentsChange success");

      console.info('[DetentsChange_0100] END');
      done();
    });


  })
}

