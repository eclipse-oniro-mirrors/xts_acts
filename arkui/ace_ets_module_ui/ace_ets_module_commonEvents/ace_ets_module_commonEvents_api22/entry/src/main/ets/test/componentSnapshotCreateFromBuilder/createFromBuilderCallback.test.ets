/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


export default function createFromBuilderCallbackTest() {
  describe('createFromBuilderCallbackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("createFromBuilderCallbackTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/componentSnapshotCreateFromBuilder/createFromBuilderCallback",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createFromBuilderCallbackTest state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get createFromBuilderCallbackTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createFromBuilderCallbackTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createFromBuilderCallbackTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    createFromBuilderCallbackTest_0010
     * @tc.name      createFromBuilderCallbackTest_0010
     * @tc.desc      createFromBuilderCallbackTest delay is 0
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromBuilderCallbackTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('createFromBuilderCallbackTest_0010 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilderCallback'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('width')).assertLarger(0);
      AppStorage.clear();
      console.info('[createFromBuilderCallbackTest_0010] END');
      done();
    });

    /**
     * @tc.number    createFromBuilderCallbackTest_0020
     * @tc.name      createFromBuilderCallbackTest_0020
     * @tc.desc      createFromBuilderCallbackTest delay is -1
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromBuilderCallbackTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('createFromBuilderCallbackTest_0020 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromBuilderCallback'));
      let button2: Component = await driver.findComponent(ON.id('time'));
      await button2.click();
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('width')).assertLarger(0);
      AppStorage.clear();
      console.info('[createFromBuilderCallbackTest_0020] END');
      done();
    });

    /**
     * @tc.number    createFromBuilderCallbackTest_0030
     * @tc.name      createFromBuilderCallbackTest_0030
     * @tc.desc      componentSnapshotCreateFromBuilderCallback delay is 0
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromBuilderCallbackTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('createFromBuilderCallbackTest_0030 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('componentSnapshotCreateFromBuilderCallback'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('width')).assertLarger(0);
      AppStorage.clear();
      console.info('[createFromBuilderCallbackTest_0030] END');
      done();
    });

    /**
     * @tc.number    createFromBuilderCallbackTest_0040
     * @tc.name      createFromBuilderCallbackTest_0040
     * @tc.desc      componentSnapshotCreateFromBuilderCallback delay is -1
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromBuilderCallbackTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('createFromBuilderCallbackTest_0040 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('componentSnapshotCreateFromBuilderCallback'));
      let button2: Component = await driver.findComponent(ON.id('time'));
      await button2.click();
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('width')).assertLarger(0);
      AppStorage.clear();
      console.info('[createFromBuilderCallbackTest_0040] END');
      done();
    });
  })
}
