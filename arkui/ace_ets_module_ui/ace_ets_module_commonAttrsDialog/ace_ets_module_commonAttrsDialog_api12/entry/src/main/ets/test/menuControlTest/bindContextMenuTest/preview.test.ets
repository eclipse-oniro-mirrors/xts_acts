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

export default function preview() {
  describe('preview',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("preview beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/preview',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get preview state pages: " + JSON.stringify(pages));
        if (!("preview" == pages.name)) {
          console.info("get preview state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push preview success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push preview page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : preview_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('preview_0100', Level.LEVEL0, async (done:Function) =>{
      console.info('preview_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('preview'));
      await Column.click();
      await CommonFunc.sleep(1000);

      let Column1 = await driver.findComponent(ON.id('MyPreview'));
      await Column1.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('preview');
      console.info("[preview_0100] preview JSON.parse(strJson) is: " + JSON.stringify(strJson));
      console.info("[preview_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[preview_0100] title: " + JSON.stringify(JSON.parse(strJson).$attrs.label));
      expect(JSON.parse(strJson).$attrs.label).assertEqual("true");
      console.info('[preview_0100] END');
      done();
    });
  })
}

