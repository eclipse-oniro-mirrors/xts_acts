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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
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

export default function AnimatorResultTest() {
  describe('AnimatorResultTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AnimatorResultTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AnimatorResult/AnimatorResult",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AnimatorResultTest state pages:" + JSON.stringify(pages));
        if (!("AnimatorResultTest" == pages.name)) {
          console.info("get AnimatorResultTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AnimatorResultTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AnimatorResultTest page error:" + err);
      }
      console.info("AnimatorResultTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AnimatorResultTest after each called");
    });

    /**
     * @tc.number AnimatorResultTest_001
     * @tc.name testBack
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('AnimatorResultTest_001', 0, async (done: Function) => {
      console.info('[AnimatorResultTest_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('create'));
      await create.click();
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('play'));
      await play.click();
      await CommonFunc.sleep(3500);
      let onFrame = getInspectorByKey('onFrame');
      console.info('onFrame: ' + JSON.parse(onFrame).$attrs.content);
      expect(JSON.parse(onFrame).$attrs.content).assertEqual('onFrame');
      console.info('[AnimatorResultTest_001] END');
      done();
    });
    it('AnimatorResultTest_002', 0, async (done: Function) => {
      console.info('[AnimatorResultTest_002] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let create = await driver.findComponent(ON.id('create'));
      await create.click();
      await CommonFunc.sleep(1000);
      let play = await driver.findComponent(ON.id('play'));
      await play.click();
      await CommonFunc.sleep(3500);
      let onRepeat = getInspectorByKey('onRepeat');
      console.info('onRepeat: ' + JSON.parse(onRepeat).$attrs.content);
      expect(JSON.parse(onRepeat).$attrs.content).assertEqual('onRepeat');
      console.info('[AnimatorResultTest_002] END');
      done();
    });
  })
}
