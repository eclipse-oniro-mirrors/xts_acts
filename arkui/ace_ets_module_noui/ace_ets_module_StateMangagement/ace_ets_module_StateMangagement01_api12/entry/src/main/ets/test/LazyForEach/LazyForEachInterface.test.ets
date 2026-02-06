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
        await CommonFunc.sleep(100);
        let pages = router.getState();
        console.info("get LazyForEachInterface state success " + JSON.stringify(pages));
        if (!("LazyForEachInterface" == pages.name)) {
          console.info("get LazyForEachInterface state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push LazyForEachInterface page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachInterface page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(100);
    });

    afterEach(async () => {
      await CommonFunc.sleep(500);
      console.info("LazyForEachInterface after each called");
    });

    /**
     * @tc.number LazyForEachInterface_001
     * @tc.name LazyForEachInterface_001
     * @tc.desc Test LazyForEachInterface
     * @tc.level: Level 2
     */
    it('LazyForEachInterface_001', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachInterface_001] START');      
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let switch_btn = await driver.findComponent(ON.id('switch'))
      await CommonFunc.sleep(1000);
      await switch_btn.click();
      await CommonFunc.sleep(1000);
      let info = await driver.findComponent(ON.id('interfaceInfo'));
      expect(await info.getText()).assertEqual('aboutToRecycle');
      console.info('[LazyForEachInterface_001] END');
      done();
    });

    /**
     * @tc.number LazyForEachInterface_002
     * @tc.name LazyForEachInterface_002
     * @tc.desc Test LazyForEachInterface
     * @tc.level: Level 2
     */
    it('LazyForEachInterface_002', Level.LEVEL1, async (done: Function) => {
      console.info('[LazyForEachInterface_002] START');      
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let switch_btn = await driver.findComponent(ON.id('switch'));
      await CommonFunc.sleep(1000);
      await switch_btn.click();
      await CommonFunc.sleep(1000);
      let info = await driver.findComponent(ON.id('interfaceInfo'));
      expect(await info.getText()).assertEqual('aboutToReuse');
      console.info('[LazyForEachInterface_002] END');
      done();
    });
  })
}