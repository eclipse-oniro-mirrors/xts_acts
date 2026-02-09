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
import { UiComponent, Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { CustomComponentLifecycleState } from '@kit.ArkUI';

export default function LifeCycleTest0100() {
  describe('LifeCycleTest0100', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleTest0100 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0100",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycleTest0100 state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0100" == pages.name)) {
          console.info("get LifeCycleTest0100 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycleTest0100 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycleTest0100 page error:" + err);
      }
      console.info("LifeCycleTest0100 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycleTest0100 after each called");
    });

    /**
     * @tc.name   LifeCycleTest0100_001
     * @tc.number LifeCycleTest0100_001
     * @tc.desc   Testing the lifecycle decorators of custom component V1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycleTest0100_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycleTest0100_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("LifeCycle0100_01"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get<CustomComponentLifecycleState>('lifecycle'))
        .assertEqual(CustomComponentLifecycleState.INIT);
      expect(AppStorage.get<number>('aboutToAppear')).assertEqual(1);
      expect(AppStorage.get<number>('onDidBuild')).assertEqual(1);
      expect(AppStorage.get<number>('aboutToReuse')).assertEqual(1);
      expect(AppStorage.get<number>('aboutToRecycle')).assertEqual(1);
      await CommonFunc.sleep(1000);
      AppStorage.delete('lifecycle');
      AppStorage.delete('aboutToAppear');
      AppStorage.delete('onDidBuild');
      AppStorage.delete('aboutToReuse');
      AppStorage.delete('aboutToRecycle');
      console.info('[LifeCycleTest0100_001] END');
      done();
    });
  })
}