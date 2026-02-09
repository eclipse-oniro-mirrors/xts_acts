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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
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
import CommonFunc from '../../MainAbility/common/Common';
export default function isInRenderStateTest() {
  describe('isInRenderStateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("isInRenderStateTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/frameNode/isInRenderStateTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get isInRenderStateTest state pages: " + JSON.stringify(pages));
        if (!("frameNode" == pages.name)) {
          console.info("get isInRenderStateTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push isInRenderStateTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push isInRenderStateTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   isInRenderStateTest_0100
     * @tc.number isInRenderStateTest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isInRenderStateTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('isInRenderStateTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button1'));
      await button.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isOnRenderTree_Status')).assertEqual(true);
      AppStorage.delete('isOnRenderTree_Status')
      let button1 = await driver.findComponent(ON.id('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get('isOnRenderTree_Status')).assertEqual(false);
      AppStorage.delete('isOnRenderTree_Status')
      console.info('[isInRenderStateTest_0100] END');
      done();
    });
  })
}
