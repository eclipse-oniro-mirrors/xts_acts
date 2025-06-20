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

export default function RepeatLazyForEachStringSource() {
  describe('RepeatLazyForEachStringSource', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatLazyForEachStringSource beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatLazyForEachStringSource",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatLazyForEachStringSource state pages:" + JSON.stringify(pages));
        if (!("RepeatLazyForEachStringSource" == pages.name)) {
          console.info("get RepeatLazyForEachStringSource pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatLazyForEachStringSource page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatLazyForEachStringSource page error:" + err);
      }
      console.info("RepeatLazyForEachStringSource beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatLazyForEachStringSource after each called");
    });

    /**
     * @tc.number RepeatLazyForEachStringSource_001
     * @tc.name RepeatLazyForEachStringSource_001
     * @tc.desc Test RepeatLazyForEachStringSource component
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('RepeatLazyForEachStringSource_001', 0, async (done: Function) => {
      console.info('[RepeatLazyForEachStringSource_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat1_LS14');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatLazyForEachStringSource_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('Item14');
      console.info('[RepeatLazyForEachStringSource_001] END');

      let strJson1 = getInspectorByKey('lazyForeach1_LS14');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatLazyForEachStringSource_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('Math Science PE');
      console.info('[RepeatLazyForEachStringSource_001] END');

      let strJson2 = getInspectorByKey('repeat1_LS15');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[RepeatLazyForEachStringSource_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('Item15');
      console.info('[RepeatLazyForEachStringSource_001] END');

      let strJson3 = getInspectorByKey('lazyForeach1_LS15');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[RepeatLazyForEachStringSource_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.$attrs.content).assertEqual('Math Science Chinese English');
      console.info('[RepeatLazyForEachStringSource_001] END');
      done();
    });
  })
}
