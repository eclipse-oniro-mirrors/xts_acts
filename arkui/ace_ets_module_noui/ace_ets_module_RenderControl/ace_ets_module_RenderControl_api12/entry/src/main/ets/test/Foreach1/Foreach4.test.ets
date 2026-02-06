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


export default function Foreach4() {
  describe('Foreach4', () => {
    beforeEach(async (done: Function) => {
      console.info("Foreach4 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach1/Foreach4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Foreach4 state pages:" + JSON.stringify(pages));
        if (!("Foreach4" == pages.name)) {
          console.info("get Foreach4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Foreach4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach4 page error:" + err);
      }
      console.info("Foreach4 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach4 after each called");
    });

    /**
     * @tc.name   foreach4_001
     * @tc.number foreach4_001
     * @tc.desc   add a new item to the foreach component and check whether the new item is added successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach4_001', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach4_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Foreach004:0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach4_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('0 1');
      console.info('[foreach4_001] END');
      done();
    });
  })
}
