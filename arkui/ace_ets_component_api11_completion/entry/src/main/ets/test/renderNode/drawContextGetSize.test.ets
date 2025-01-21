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
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function drawContextGetSizeTest() {
  describe('drawContextGetSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("drawContextGetSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/renderNode/drawContextGetSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get drawContextGetSizeTest state pages: " + JSON.stringify(pages));
        if (!("drawContextGetSize" == pages.name)) {
          console.info("get drawContextGetSizeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push drawContextGetSizeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push drawContextGetSizeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number drawContextGetSize
     * @tc.name drawContextGetSizeTest_0100
     * @tc.desc api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('drawContextGetSizeTest_0100', 0, async (done: Function) => {
      console.info('drawContextGetSizeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DrawContext_get_Size'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DrawContext_get_Size_width');
      console.info("[drawContextGetSizeTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('width: 1');
      console.info('[drawContextGetSizeTest_0100] END');
      done();
    });
  })
}

