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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function AttachDetachRebindTest() {
  describe('AttachDetachRebindTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttachDetachRebindTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/AttachDetachRebindTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttachDetachRebindTest state pages: " + JSON.stringify(pages));
        if (!("AttachDetachRebindTest" == pages.name)) {
          console.info("get AttachDetachRebindTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AttachDetachRebindTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttachDetachRebindTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      AttachDetachRebindTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('AttachDetachRebindTest_0100', 0, async (done: Function) => {
      console.info('AttachDetachRebindTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // aboutToAppear中已绑定“onAttach”和“onDetach”
      // 页面加载，触发“onAttach”回调
      let strJson = getInspectorByKey('attach_detach_content');
      let obj: ESObject = JSON.parse(strJson);
      console.info("页面加载，触发onAttach回调");
      console.info("[AttachDetachRebindTest_0100] content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onAttach');

      // 点击按钮绑定新的canvas，原cavas解绑触发“onDetach”回调，新canvas绑定触发“onAttach”回调
      let button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('attach_detach_content');
      obj = JSON.parse(strJson);
      console.info("点击按钮绑定新的canvas，原cavas解绑触发onDetach回调，新canvas绑定触发onAttach回调");
      console.info("[AttachDetachRebindTest_0100] content is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onAttach onDetach onAttach');

      console.info('[AttachDetachRebindTest_0100] END');
      done();
    });
  })
}

