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
import { CustomComponentLifecycleState, CustomComponentLifecycleObserver} from '@kit.ArkUI';

let life0310Res: number = 0

class MyObserver0310 implements CustomComponentLifecycleObserver {
  aboutToReuse(params?: Record<string, Object | undefined | null>) {
    life0310Res++;
  }
}

export default function LifeCycleTest0310() {
  describe('LifeCycleTest0310', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleTest0310 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycle0310",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycleTest0310 state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0310" == pages.name)) {
          console.info("get LifeCycleTest0310 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycleTest0310 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycleTest0310 page error:" + err);
      }
      console.info("LifeCycleTest0310 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycleTest0310 after each called");
    });

    /**
     * @tc.name   LifeCycleTest0310_001
     * @tc.number LifeCycleTest0310_001
     * @tc.desc   Testing the lifecycle decorators of custom component V1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycleTest0310_001', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycleTest0310_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("LifeCycle0310_01"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child1ComponentInit')).assertEqual(CustomComponentLifecycleState.INIT);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child1ComponentAppear')).assertEqual(CustomComponentLifecycleState.APPEARED);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child1ComponentBuilt')).assertEqual(CustomComponentLifecycleState.BUILT);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child1ComponentRecycle')).assertEqual(CustomComponentLifecycleState.RECYCLED);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child1ComponentReuse')).assertEqual(CustomComponentLifecycleState.BUILT);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child2ComponentAppear')).assertEqual(CustomComponentLifecycleState.APPEARED);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child2ComponentBuilt')).assertEqual(CustomComponentLifecycleState.BUILT);
      expect(AppStorage.get<CustomComponentLifecycleState>('Child2ComponentDisappear')).assertEqual(CustomComponentLifecycleState.DISAPPEARED);
      await CommonFunc.sleep(1000);
      AppStorage.delete('Child1ComponentInit');
      AppStorage.delete('Child1ComponentAppear');
      AppStorage.delete('Child1ComponentBuilt');
      AppStorage.delete('Child1ComponentRecycle');
      AppStorage.delete('Child1ComponentReuse');
      AppStorage.delete('Child2ComponentAppear');
      AppStorage.delete('Child2ComponentBuilt');
      AppStorage.delete('Child2ComponentDisappear');
      console.info('[LifeCycleTest0310_001] END');
      await CommonFunc.sleep(1000);
      done();
    });

    /**
     * @tc.name   LifeCycleTest0310_002
     * @tc.number LifeCycleTest0310_002
     * @tc.desc   Testing the lifecycle decorators of custom component V1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('LifeCycleTest0310_002', Level.LEVEL0, async (done: Function) => {
      console.info('[LifeCycleTest0310_002] START');
      await CommonFunc.sleep(1000);
      let myObserver0310: MyObserver0310 = new MyObserver0310();
      myObserver0310.aboutToReuse(undefined)
      myObserver0310.aboutToReuse()
      myObserver0310.aboutToReuse({ 'name': 'ww' } as Record<string, string>)
      console.info('[LifeCycleTest0310_002] life0310Res:' + life0310Res);
      expect(life0310Res).assertEqual(3)
      console.info('[LifeCycleTest0310_002] END');
      await CommonFunc.sleep(1000);
      done();
    });

  })
}