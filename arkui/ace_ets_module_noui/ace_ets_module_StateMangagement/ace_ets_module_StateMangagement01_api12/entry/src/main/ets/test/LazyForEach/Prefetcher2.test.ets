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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../MainAbility/common/MessageManager';

export default function Prefetcher2() {
  describe('Prefetcher2', () => {
    beforeEach(async (done: Function) => {
      console.info("Prefetcher2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/Prefetcher2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Prefetcher2 state pages: " + JSON.stringify(pages));
        if (!("Prefetcher2" == pages.name)) {
          console.info("get Prefetcher2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Prefetcher2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Prefetcher2 page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Prefetcher2 after each called");
    });

    /* *
    * @tc.number: Prefetcher2_0100
    * @tc.name  : Prefetcher2_0100
    * @tc.desc  : Test lazyforeach
    * @tc.level : Level 2
    */
    it('Prefetcher2_0100', Level.LEVEL0, async (done: Function) => {
      console.info('Prefetcher2_0100 START');
      await CommonFunc.sleep(1000);

      let driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('Prefetcher2_add'));
      await text.click();
      console.info("[Prefetcher2_0100] text click");
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('Prefetcher2_add');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[Prefetcher2_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('add22');
      console.info('[Prefetcher2_0100] END');
      done();
    });

  })
}

