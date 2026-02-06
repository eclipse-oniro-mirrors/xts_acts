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


export default function RepeatIfElseObject() {
  describe('RepeatIfElseObject', () => {
    beforeEach(async (done: Function) => {
      console.info("RepeatIfElseObject beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/RepeatMix/RepeatIfElseObject",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RepeatIfElseObject state pages:" + JSON.stringify(pages));
        if (!("RepeatIfElseObject" == pages.name)) {
          console.info("get RepeatIfElseObject pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RepeatIfElseObject page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RepeatIfElseObject page error:" + err);
      }
      console.info("RepeatIfElseObject beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RepeatIfElseObject after each called");
    });

    /**
     * @tc.name   RepeatIfElseObject_001
     * @tc.number RepeatIfElseObject_001
     * @tc.desc   Test RepeatIfElseObject component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RepeatIfElseObject_001', Level.LEVEL0, async (done: Function) => {
      console.info('[RepeatIfElseObject_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();

      let strJson = getInspectorByKey('repeat2_IO0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[RepeatIfElseObject_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('item id 0 = RepeatObject0');
      console.info('[RepeatIfElseObject_001] END');

      let strJson1 = getInspectorByKey('repeat3_IO1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[RepeatIfElseObject_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('item id 1 = RepeatObject1');
      console.info('[RepeatIfElseObject_001] END');
      done();
    });
  })
}
