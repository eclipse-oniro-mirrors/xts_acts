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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
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
import CommonFunc from "../../MainAbility/common/Common";

export default function TimePickerTest() {
  describe('TimePickerTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePickerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePicker',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePicker state pages: " + JSON.stringify(pages));
        if (!("TimePicker" == pages.name)) {
          console.info("get TimePicker state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TimePicker page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePicker page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
       * @tc.number: SUB_ACE_ArkUI_TimePicker_001
       * @tc.name  : TimePicker_001
       * @tc.desc  : font fontDir test
       * @tc.level : Level 2
       */
    it('TimePicker_001', 0, async (done: Function) => {

      console.info('[TimePicker_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TimePicker1');
      await CommonFunc.sleep(200);
      console.info("[TimePicker_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('TimePicker');
      console.info('[TimePicker_001] END');
      done();
    });
  })
}
