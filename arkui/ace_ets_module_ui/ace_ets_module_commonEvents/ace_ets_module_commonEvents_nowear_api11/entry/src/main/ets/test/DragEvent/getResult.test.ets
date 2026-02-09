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
import { KeyCode } from '@kit.InputKit';
import { MouseButton } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';


export default function getResultTest() {
  describe('getResultTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DragEvent/getResult",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getResultTest state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get getResultTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push getResultTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getResultTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   getResultTest_0010
     * @tc.number getResultTest_0010
     * @tc.desc   getResultTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getResultTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('getResultTest_0010 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let images: Component = await driver.findComponent(ON.id('images'));
      let success: Component = await driver.findComponent(ON.id('success'));
      let failed: Component = await driver.findComponent(ON.id('failed'));
      let canceled: Component = await driver.findComponent(ON.id('canceled'));
      let enabled: Component = await driver.findComponent(ON.id('enabled'));
      let disabled: Component = await driver.findComponent(ON.id('disabled'));
      await images.dragTo(success);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('DRAG_SUCCESSFUL')).assertEqual(0);
      await images.dragTo(failed);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('DRAG_FAILED')).assertEqual(1);
      await images.dragTo(canceled);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('DRAG_CANCELED')).assertEqual(2);
      await images.dragTo(enabled);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('DROP_ENABLED')).assertEqual(3);
      await images.dragTo(disabled);
      await CommonFunc.sleep(500);
      expect(AppStorage.get('DROP_DISABLED')).assertEqual(4);
      console.info('[getResultTest_0010] END');
      done();
    });
  })
}