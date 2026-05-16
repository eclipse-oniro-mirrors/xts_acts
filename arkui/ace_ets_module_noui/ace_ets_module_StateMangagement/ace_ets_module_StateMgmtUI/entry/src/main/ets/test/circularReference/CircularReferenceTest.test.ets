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
import { AppStorageV2, PersistenceV2 } from '@ohos.arkui.StateManagement';


export default function CircularReferenceTest() {
  describe('CircularReferenceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CircularReferenceTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/circularReference/CircularReference",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CircularReferenceTest state pages:" + JSON.stringify(pages));
        if (!("LifeCycle0050" == pages.name)) {
          console.info("get CircularReferenceTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push CircularReferenceTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CircularReferenceTest page error:" + err);
      }
      console.info("CircularReferenceTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CircularReferenceTest after each called");
    });

    /**
     * @tc.name   CircularReferenceTest_001
     * @tc.number CircularReferenceTest_001
     * @tc.desc   Testing the Circular Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CircularReferenceTest_001', Level.LEVEL2, async (done: Function) => {
      console.info('[CircularReferenceTest001] START');
      await CommonFunc.sleep(1000)
      let driver = await Driver.create()
      await CommonFunc.sleep(1000)
      let tv1: ESObject = await (await driver.findComponent(ON.text('ArkUI1'))).getText()
      console.info('[CircularReferenceTest001] component tv1: ' + tv1);
      expect(tv1).assertEqual('ArkUI1')
      AppStorage.delete('CircularReferenceAppStorage');
      let storage = new LocalStorage();
      storage.delete('CircularReferenceLocalStorage');
      AppStorageV2.remove('classA')
      PersistenceV2.remove('classB')
      PersistenceV2.remove('classC')
      console.info('[CircularReferenceTest001] END');
      done();
    });
  })
}