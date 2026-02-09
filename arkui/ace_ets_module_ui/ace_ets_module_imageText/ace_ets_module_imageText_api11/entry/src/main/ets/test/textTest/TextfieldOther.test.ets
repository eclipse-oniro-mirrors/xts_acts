/*
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

import router from '@ohos.router';
import { beforeEach, describe, expect,it, Level } from "@ohos/hypium";

export default function TextfieldOtherTest() {
  describe('TextfieldOtherTest', () => {
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/TextfieldOther',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("TextfieldOther" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Index page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0070
     * @tc.number ArkUX_Text_Visual_0070
     * @tc.desc   Sets the showCounter property parameter to true and 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0070', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0070 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0070');
          console.info('ArkUX_Text_Visual_0070 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0070 obj is: " + JSON.stringify(obj));
          let showCounter: ESObject = obj.$attrs.showCounter;
          let value: ESObject = showCounter.value;
          let options: ESObject = showCounter.options;
          let thresholdPercentage: ESObject = options.thresholdPercentage;
          let highlightBorder: ESObject = options.highlightBorder;
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_0070 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0080
     * @tc.number ArkUX_Text_Visual_0080
     * @tc.desc   Sets the showCounter property parameter to false and 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0080', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0080 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0080');
          console.info('ArkUX_Text_Visual_0080 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0080 obj is: " + JSON.stringify(obj));
          let showCounter: ESObject = obj.$attrs.showCounter;
          let value: ESObject = showCounter.value;
          let options: ESObject = showCounter.options;
          let thresholdPercentage: ESObject = options.thresholdPercentage;
          let highlightBorder: ESObject = options.highlightBorder;
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_0080 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0080 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

    /**
     * @tc.name   ArkUX_Text_Visual_0090
     * @tc.number ArkUX_Text_Visual_0090
     * @tc.desc   Sets the showCounter property parameter to true and 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0090', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0090 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0090');
          console.info('ArkUX_Text_Visual_0090 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0090 obj is: " + JSON.stringify(obj));
          let showCounter: ESObject = obj.$attrs.showCounter;
          let value: ESObject = showCounter.value;
          let options: ESObject = showCounter.options;
          let thresholdPercentage: ESObject = options.thresholdPercentage;
          let highlightBorder: ESObject = options.highlightBorder;
          expect(value).assertEqual(true);
          expect(thresholdPercentage).assertEqual(40);
          expect(highlightBorder).assertEqual(false);
          console.info('ArkUX_Text_Visual_0090 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });


    /**
     * @tc.name   ArkUX_Text_Visual_0100
     * @tc.number ArkUX_Text_Visual_0100
     * @tc.desc   Sets the showCounter property parameter to default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Text_Visual_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Text_Visual_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Text_Visual_0100');
          console.info('ArkUX_Text_Visual_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Text_Visual_0100 obj is: " + JSON.stringify(obj));
          let showCounter: ESObject = obj.$attrs.showCounter;
          let value: ESObject = showCounter.value;
          let options: ESObject = showCounter.options;
          let thresholdPercentage: ESObject = options.thresholdPercentage;
          let highlightBorder: ESObject = options.highlightBorder;
          expect(value).assertEqual(false);
          expect(thresholdPercentage).assertEqual(-1);
          expect(highlightBorder).assertEqual(true);
          console.info('ArkUX_Text_Visual_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Text_Visual_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });
  })
}