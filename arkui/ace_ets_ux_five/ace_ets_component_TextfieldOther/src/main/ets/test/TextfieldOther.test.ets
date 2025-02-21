/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

export default function TextfieldOtherTest() {
  describe('TextfieldOtherTest', () => {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done()
    });

    /*
     *@tc.number ArkUX_Text_Visual_0070
     *@tc.name   Support modifying the textfield showCounter change of Textfield component
     *@tc.desc   Sets the showCounter property parameter to true and 50
     */
    it('ArkUX_Text_Visual_0070', 0, async function (done) {
      console.info('ArkUX_Text_Visual_0070 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0070');
          console.info('ArkUX_Text_Visual_0070 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0070 obj is: " + JSON.stringify(obj));
          let showCounter = obj.$attrs.showCounter
          let value = showCounter.value
          let options = showCounter.options
          let thresholdPercentage = options.thresholdPercentage
          let highlightBorder = options.highlightBorder
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_0070 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *@tc.number ArkUX_Text_Visual_0080
     *@tc.name   Support modifying the textfield showCounter change of Textfield component
     *@tc.desc   Sets the showCounter property parameter to false and 0
     */
    it('ArkUX_Text_Visual_0080', 0, async function (done) {
      console.info('ArkUX_Text_Visual_0080 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0080');
          console.info('ArkUX_Text_Visual_0080 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0080 obj is: " + JSON.stringify(obj));
          let showCounter = obj.$attrs.showCounter
          let value = showCounter.value
          let options = showCounter.options
          let thresholdPercentage = options.thresholdPercentage
          let highlightBorder = options.highlightBorder
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_0080 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_0080 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *@tc.number ArkUX_Text_Visual_0090
     *@tc.name   Support modifying the textfield showCounter change of Textfield component
     *@tc.desc   Sets the showCounter property parameter to true and 200
     */
    it('ArkUX_Text_Visual_0090', 0, async function (done) {
      console.info('ArkUX_Text_Visual_0090 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0090');
          console.info('ArkUX_Text_Visual_0090 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0090 obj is: " + JSON.stringify(obj));
          let showCounter = obj.$attrs.showCounter
          let value = showCounter.value
          let options = showCounter.options
          let thresholdPercentage = options.thresholdPercentage
          let highlightBorder = options.highlightBorder
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_0090 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });


    /*
     *@tc.number ArkUX_Text_Visual_0100
     *@tc.name   Support modifying the textfield showCounter change of Textfield component
     *@tc.desc   Sets the showCounter property parameter to default value
     */
    it('ArkUX_Text_Visual_0100', 0, async function (done) {
      console.info('ArkUX_Text_Visual_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0100');
          console.info('ArkUX_Text_Visual_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0100 obj is: " + JSON.stringify(obj));
          let showCounter = obj.$attrs.showCounter
          let value = showCounter.value
          let options = showCounter.options
          let thresholdPercentage = options.thresholdPercentage
          let highlightBorder = options.highlightBorder
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(-1);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Text_Visual_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}