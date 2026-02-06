/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Utils from './Utils'

export default function radioGroupJsunit() {
  describe('radioGroupTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/radio',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get radio state success " + JSON.stringify(pages));
        if (!("radio" == pages.name)) {
          console.info("get radio state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push radio page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push radio page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   testRadioGroup001
     * @tc.number testRadioGroup001
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRadioGroup001', Level.LEVEL0, async (done: Function) => {
      console.info("[testRadioGroup001] START");
      let strJson = getInspectorByKey('RadioOne');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testRadioGroup001] obj  is: " + JSON.stringify(obj.$attrs));

      expect(JSON.parse(obj.$attrs.radioStyle).checkedBackgroundColor).assertEqual('#FF147258');
      expect(JSON.parse(obj.$attrs.radioStyle).indicatorColor).assertEqual('#FF123456');
      expect(JSON.parse(obj.$attrs.radioStyle).uncheckedBorderColor).assertEqual('#FF963852');

      console.info("[testRadioGroup001] END");
      done();
    });

    /**
     * @tc.name   testRadioGroup002
     * @tc.number testRadioGroup002
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRadioGroup002', Level.LEVEL0, async (done: Function) => {
      console.info("[testRadioGroup002] START");
      let strJson = getInspectorByKey('RadioOne');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testRadioGroup002] obj  is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.checked).assertEqual('true');
      console.info("[testRadioGroup002] END");
      done();
    });

  })
}
