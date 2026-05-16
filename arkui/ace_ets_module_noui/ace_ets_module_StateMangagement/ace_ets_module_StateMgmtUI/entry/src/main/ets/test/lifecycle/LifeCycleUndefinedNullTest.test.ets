/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { UIUtils, CustomComponentLifecycleObserver } from '@ohos.arkui.StateManagement';

class LifeCycleObserverUndefinedClass implements CustomComponentLifecycleObserver {
  aboutToReuse(params?: Record<string, Object | null | undefined> | undefined): void {
    console.info('LifeCycleObserverUndefinedClass aboutToReuse');
  }
}

export default function LifeCycleUndefinedNull() {
  describe('LifeCycleUndefinedNull', () => {
    beforeEach(async (done: Function) => {
      console.info("LifeCycleUndefinedNull beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/lifecycle/LifeCycleUndefinedNull",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LifeCycleUndefinedNull state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0050" == pages.name)) {
          console.info("get LifeCycleUndefinedNull pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LifeCycleUndefinedNull page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LifeCycleUndefinedNull page error:" + err);
      }
      console.info("LifeCycleUndefinedNull beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LifeCycleUndefinedNull after each called");
    });

    /**
     * @tc.name   LifeCycleUndefinedNull_001
     * @tc.number LifeCycleUndefinedNull_001
     * @tc.desc   Testing the lifecycle decorators of custom component V1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LifeCycleUndefinedNull_001', Level.LEVEL2, async (done: Function) => {
      console.info('[LifeCycleUndefinedNull_001] START');
      await CommonFunc.sleep(1000)
      let comThis: ESObject = AppStorage.get('LifeCycleUndefinedNull')
      try {
        UIUtils.getLifecycle(comThis).addObserver(null)
        console.info('[LifeCycleUndefinedNullTest001] addObserver null');
        UIUtils.getLifecycle(comThis).addObserver(undefined)
        console.info('[LifeCycleUndefinedNullTest001] addObserver undefined');
        UIUtils.getLifecycle(comThis).removeObserver(null)
        console.info('[LifeCycleUndefinedNullTest001] removeObserver null');
        UIUtils.getLifecycle(comThis).removeObserver(undefined)
        console.info('[LifeCycleUndefinedNullTest001] removeObserver undefined');
        new LifeCycleObserverUndefinedClass().aboutToReuse(undefined)
        console.info('[LifeCycleUndefinedNullTest001] aboutToReuse undefined');
      } catch (err) {
        console.info('[LifeCycleUndefinedNullTest001] err: ' + JSON.stringify(err));
        expect().assertFail()
      }
      AppStorage.delete('LifeCycleUndefinedNull');
      console.info('[LifeCycleUndefinedNull_001] END');
      done();
    });
  })
}