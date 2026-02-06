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


export default function createFromComponent() {
  describe('createFromComponent', () => {
    beforeEach(async (done: Function) => {
      console.info("createFromComponent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/componentSnapshotCreateFromBuilder/createFromComponent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get createFromComponent state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get createFromComponent state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push createFromComponent success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push createFromComponent page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    createFromComponent_0010
     * @tc.name      createFromComponent_0010
     * @tc.desc      createFromComponent delay is 0
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromComponent_0010', Level.LEVEL0, async (done: Function) => {
      console.info('createFromComponent_0010 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromComponent'));
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('success')).assertEqual('success');
      AppStorage.clear();
      console.info('[createFromComponent_0010] END');
      done();
    });

    /**
     * @tc.number    createFromComponent_0020
     * @tc.name      createFromComponent_0020
     * @tc.desc      createFromComponent delay is -1
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('createFromComponent_0020', Level.LEVEL0, async (done: Function) => {
      console.info('createFromComponent_0020 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let button: Component = await driver.findComponent(ON.id('createFromComponent'));
      let button2: Component = await driver.findComponent(ON.id('time3'));
      await button2.click();
      await CommonFunc.sleep(500);
      await button.click();
      await CommonFunc.sleep(2000);
      expect(AppStorage.get('success')).assertEqual('success');
      AppStorage.clear();
      console.info('[createFromComponent_0020] END');
      done();
    });
  })
}
