/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function LazyForEachInterface() {
  describe('LazyForEachInterface', () => {
    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachInterface',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get LazyForEachInterface state success " + JSON.stringify(pages));
        if (!("LazyForEachInterface" == pages.name)) {
          console.info("get LazyForEachInterface state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options)
          console.info("push LazyForEachInterface page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachInterface page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("LazyForEachInterface after each called");
    });

    /**
     * @tc.name   LazyForEachInterface_001
     * @tc.number LazyForEachInterface_001
     * @tc.desc   Test LazyForEachInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LazyForEachInterface_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachInterface_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let switch_btn = await driver.findComponent(ON.id('LazyForEachInterface_switch'))
      await switch_btn.click();
      console.info('[LazyForEachInterface_001] click LazyForEachInterface_switch 1');
      await CommonFunc.sleep(1000);
      let info = await driver.findComponent(ON.id('LazyForEachInterface_interfaceInfo'));
      expect(await info.getText()).assertEqual('aboutToRecycle');

      switch_btn = await driver.findComponent(ON.id('LazyForEachInterface_switch'))
      await switch_btn.click();
      console.info('[LazyForEachInterface_001] click LazyForEachInterface_switch 2');
      await CommonFunc.sleep(1000);
      info = await driver.findComponent(ON.id('LazyForEachInterface_interfaceInfo'));
      expect(await info.getText()).assertEqual('aboutToReuse');

      console.info('[LazyForEachInterface_001] END');
      done();
    });

    /**
     * @tc.name   LazyForEachInterface_002
     * @tc.number LazyForEachInterface_002
     * @tc.desc   Test LazyForEachInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('LazyForEachInterface_002', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachInterface_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let delete_btn = await driver.findComponent(ON.id('LazyForEachInterface_deleteData'))
      await delete_btn.click();
      console.info('[LazyForEachInterface_002] click LazyForEachInterface_deleteData 1');
      await CommonFunc.sleep(1000);
      await delete_btn.click();
      console.info('[LazyForEachInterface_002] click LazyForEachInterface_deleteData 2');
      await CommonFunc.sleep(1000);
      let info = await driver.findComponent(ON.id('10'));
      expect(await info.getText()).assertEqual('10');
      console.info('[LazyForEachInterface_002] END');
      done();
    });
  })
}