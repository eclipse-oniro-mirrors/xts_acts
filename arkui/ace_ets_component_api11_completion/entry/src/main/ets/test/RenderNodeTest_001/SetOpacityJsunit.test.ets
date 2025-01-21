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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest';

export default function SetOpacityJsunit() {
  describe('SetOpacityJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SetOpacityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/renderNode001/SetOpacity",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SetOpacityJsunit state pages:" + JSON.stringify(pages));
        if (!("SetOpacity" == pages.name)) {
          console.info("get getClipToFrame pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SetOpacityJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SetOpacityJsunit page error:" + err);
      }
      console.info("SetOpacityJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SetOpacityJsunit after each called");
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_SetOpacityJsunit_001
     * @tc.name SetOpacityJsunit
     * @tc.desc set api
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('SetOpacityJsunit_001', 0, async (done: Function) => {
      console.info('[SetOpacityJsunit_001] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let set: Component = await driver.findComponent(ON.id('setOpacity'));
      await set.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Opacity_status');
      console.info("[SetOpacityJsunit_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SetOpacityJsunit_001] component content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("setOpacityStatus:0.5");
      console.info('[SetOpacityJsunit_001] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
