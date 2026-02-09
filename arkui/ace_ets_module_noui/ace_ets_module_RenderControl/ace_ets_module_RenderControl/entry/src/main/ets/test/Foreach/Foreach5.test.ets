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


export default function Foreach5() {
  describe('Foreach5', () => {
    beforeEach(async (done: Function) => {
      console.info("Foreach5 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/Foreach5",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Foreach5 state pages:" + JSON.stringify(pages));
        if (!("Foreach5" == pages.name)) {
          console.info("get Foreach5 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Foreach5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Foreach5 page error:" + err);
      }
      console.info("Foreach5 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach5 after each called");
    });

    /**
     * @tc.name   foreach5_001
     * @tc.number foreach5_001
     * @tc.desc   Display data in foreach component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('foreach5_001', Level.LEVEL0, async (done: Function) => {
      console.info('[foreach5_001] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('even_numbers0');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[foreach5_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('even numbers01');
      console.info('[foreach5_001] END');
      done();

      let strJson1 = getInspectorByKey('odd_numbers1');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[foreach5_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('odd numbers12');
      console.info('[foreach5_001] END');
      done();
    });
  })
}
