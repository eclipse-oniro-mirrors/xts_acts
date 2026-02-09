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
import CommonFunc from '../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function TextAddApi1() {
  describe('TextAddApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAddApi1 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAddApi1 state pages:" + JSON.stringify(pages));
        if (!("TextAddApi1" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/TextAddApi1"})
          await CommonFunc.sleep(2000);
          console.info("push TextAddApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAddApi1 page error:" + err);
      }
      console.info("TextAddApi1 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextAddApi1 after each called");
    });


    /**
     * @tc.name   TextAddApi1_001
     * @tc.number TextAddApi1_001
     * @tc.desc   TextAddApi1_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextAddApi1_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[TextAddApi1_001] START');

      let strJson = getInspectorByKey('TextAddApi1');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextAddApi1_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj.$attrs.content).assertEqual('editMenuOptions');
      console.info('[TextAddApi1_001] END');
      done();
    });
  })
}
