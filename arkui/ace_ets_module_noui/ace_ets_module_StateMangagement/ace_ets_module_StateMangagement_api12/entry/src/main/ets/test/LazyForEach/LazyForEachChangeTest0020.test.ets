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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, Component } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function LazyForEachChangeTest0020() {
  describe('LazyForEachChangeTest0020', () => {
    beforeEach(async (done: Function) => {
      console.info("LazyForEachChangeTest0020 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/LazyForEach/LazyForEachChange0020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LazyForEachChangeTest0020 state pages: " + JSON.stringify(pages));
        if (!("LazyForEachChange0020" == pages.name)) {
          console.info("get LazyForEachChangeTest0020 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push LazyForEachChangeTest0020 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LazyForEachChangeTest0020 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LazyForEachChangeTest0020 after each called");
    });

    /* *
    * @tc.number: SUB_ACE_SWIPER_LazyForEachChangeTest0020_0100
    * @tc.name  : LazyForEachChangeTest0020_0100
    * @tc.desc  : Data changes.
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('LazyForEachChangeTest0020_0100', Level.LEVEL2, async (done: Function) => {
      console.info('LazyForEachChangeTest0020_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id("btnChange0020"));
      await button.click();
      await CommonFunc.sleep(1000);
      let text = await driver.findComponent(ON.text('HelloWorld'))
      expect(text != null).assertTrue()
      console.info('[LazyForEachChangeTest0020_0100] END');
      done();
    });
  })
}