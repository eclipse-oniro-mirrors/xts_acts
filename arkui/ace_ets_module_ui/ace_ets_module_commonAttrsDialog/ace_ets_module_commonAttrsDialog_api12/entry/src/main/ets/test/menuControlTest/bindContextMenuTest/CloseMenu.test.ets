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
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

export default function CloseMenu() {
  describe('CloseMenu',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("CloseMenu beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/CloseMenu',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CloseMenu state pages: " + JSON.stringify(pages));
        if (!("CloseMenu" == pages.name)) {
          console.info("get CloseMenu state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CloseMenu success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CloseMenu page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : CloseMenu_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('CloseMenu_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('CloseMenu_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let Button = await driver.findComponent(ON.id('CloseMenu'));
      await Button.click();
      await CommonFunc.sleep(1000);

      let Menu = await driver.findComponent(ON.id('CloseMenuClose'));
      await Menu.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('CloseMenuText');
      console.info("[CloseMenu_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[CloseMenu_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("true");
      await CommonFunc.sleep(1000);
      console.info('[CloseMenu_0100] END');
      done();
    });
  })
}

