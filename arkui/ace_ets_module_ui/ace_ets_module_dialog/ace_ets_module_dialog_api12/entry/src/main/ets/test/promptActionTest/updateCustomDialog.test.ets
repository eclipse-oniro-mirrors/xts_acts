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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function updateCustomDialog() {
  describe('updateCustomDialog', () => {
    beforeEach(async (done: Function) => {
      console.info("updateCustomDialog beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/updateCustomDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get updateCustomDialog state pages: " + JSON.stringify(pages));
        if (!("updateCustomDialog" == pages.name)) {
          console.info("get updateCustomDialog state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push updateCustomDialog success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push updateCustomDialog page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : updateCustomDialog_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('updateCustomDialog_0100', Level.LEVEL2, async (done: Function) => {
      console.info('updateCustomDialog_0100 START');
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('updateCustomDialogXTS'));
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('updateCustomDialogMessage');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[updateCustomDialog_0100] component obj is: " + JSON.stringify(obj));
      console.info("[updateCustomDialog_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("updateCustomDialog success");
      console.info('[updateCustomDialog_0100] END');
      done();
    });

  })
}

