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
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

interface optionsObj {
  uri: string
}
export default function CloseEsc() {
  describe('CloseEsc', () => {
    beforeEach(async (done: Function) => {
      console.info("CloseEsc beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/bindContextMenu/CloseEsc',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CloseEsc state pages: " + JSON.stringify(pages));
        if (!("CloseEsc" == pages.name)) {
          console.info("get CloseEsc state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CloseEsc success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CloseEsc page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : CloseEsc_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('CloseEsc_0100', 0, async (done: Function) => {
      console.info('CloseEsc_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Button = await driver.findComponent(ON.id('CloseEsc'));
      await Button.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('CloseEscText');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[CloseEsc_0100] component obj is: " + JSON.stringify(obj));
      console.info("[CloseEsc_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("true");
      await CommonFunc.sleep(1000);
      console.info('[CloseEsc_0100] END');
      done();
    });


  })
}

