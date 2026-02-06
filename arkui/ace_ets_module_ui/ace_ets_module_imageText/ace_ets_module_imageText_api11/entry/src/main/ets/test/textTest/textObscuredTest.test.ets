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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';

export default function textObscuredTest() {
  describe('textObscuredTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/textObscured',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textObscured state success " + JSON.stringify(pages));
        if (!("textObscured" == pages.name)) {
          console.info("get textObscured state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push textObscured page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textObscured page error: " + err);
      }
      done()
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ArkUX_Redacted_Text_0090', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Text_0090 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0090');
          console.info('ArkUX_Redacted_Text_0090 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_0090 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Text_0090 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("30.00fp");
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FF");
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Start");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("30");
          console.info('ArkUX_Redacted_Text_0090 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0090 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Redacted_Text_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Text_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0100');
          console.info('ArkUX_Redacted_Text_0100 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_0100 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Text_0100 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("10.00fp");
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FE");
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Start");
          expect(JSON.parse(strJson).$attrs.obscured.length).assertEqual(0);
          expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("0");
          console.info('ArkUX_Redacted_Text_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Redacted_Text_0110', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Text_0110 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0110');
          console.info('ArkUX_Redacted_Text_0110 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_0110 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Text_0110 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("100.00fp");
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FD");
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.End");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("100");
          console.info('ArkUX_Redacted_Text_0110 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0110 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Redacted_Text_0120', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Text_0120 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0120');
          console.info('ArkUX_Redacted_Text_0120 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_0120 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Text_0120 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("1000.00fp");
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FC");
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Center");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("1000");
          console.info('ArkUX_Redacted_Text_0120 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0120 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('ArkUX_Redacted_Text_0130', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Text_0130 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0130');
          console.info('ArkUX_Redacted_Text_0130 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Text_0130 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Text_0130 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.fontSize).assertEqual("1.00fp");
          expect(JSON.parse(strJson).$attrs.fontColor).assertEqual("#FF0000FB");
          expect(JSON.parse(strJson).$attrs.textAlign).assertEqual("TextAlign.Start");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(JSON.parse(strJson).$attrs.baselineOffset).assertEqual("1");
          console.info('ArkUX_Redacted_Text_0130 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0130 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}