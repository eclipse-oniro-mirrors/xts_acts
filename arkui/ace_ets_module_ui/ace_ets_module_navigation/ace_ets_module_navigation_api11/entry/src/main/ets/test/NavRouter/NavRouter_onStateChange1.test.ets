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
import CommonFunc from '../../MainAbility/utils/Common';
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

export default function NavRouter_onStateChange1() {
  describe('NavRouter_onStateChange1', () => {
    beforeEach(async (done: Function) => {
      console.info("NavRouter_onStateChange1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavRouter/NavRouter_onStateChange1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavRouter_onStateChange1 state pages:" + JSON.stringify(pages));
        if (!("NavRouter_onStateChange1" == pages.name)) {
          console.info("get NavRouter_onStateChange1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push NavRouter_onStateChange1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavRouter_onStateChange1 page error:" + err);
      }
      console.info("NavRouter_onStateChange1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("NavRouter_onStateChange1 after each called");
    });
    /**
     * @tc.number SUB_ACE_NavRouter_onStateChange1_0100
     * @tc.name testNavRouter
     * @tc.desc Determine whether the cursor change triggers onSelectionChange
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('NavRouter_onStateChange1_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[NavRouter_onStateChange1_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);

      let btn1 = await driver.findComponent(ON.id('NavRouter_onStateChange1_btn1'));
      await btn1.click();
      await CommonFunc.sleep(1000);

      let text1 = getInspectorByKey('NavRouter_onStateChange1_text1');
      expect(JSON.parse(text1).$attrs.content).assertEqual('true');
      console.info('[NavRouter_onStateChange1_0100] END');
      done();
    });

  })
}
