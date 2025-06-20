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

export default function RepeatIfElseBoolean() {
  describe('RepeatIfElseBoolean', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatIfElseBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatIfElseBoolean",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatIfElseBoolean state pages:" + JSON.stringify(pages));
        if (!("RepeatIfElseBoolean" == pages.name)) {
          console.info("get RepeatIfElseBoolean pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatIfElseBoolean page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatIfElseBoolean page error:" + err);
      }
      console.info("RepeatIfElseBoolean beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatIfElseBoolean after each called");
    });

    /**
     * @tc.number RepeatIfElseBoolean_001
     * @tc.name RepeatIfElseBoolean_001
     * @tc.desc Test RepeatIfElseBoolean component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatIfElseBoolean_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatIfElseBoolean_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat2_IB10');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatIfElseBoolean_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('item2 id 10 = true');
      console.info('[RepeatIfElseBoolean_001] END');

      let strJson1 = getInspectorByKey('repeat3_IB11');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatIfElseBoolean_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('item3 id 11 = false');
      console.info('[RepeatIfElseBoolean_001] END');
      done();
    });
  })
}
