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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';

export default function textObscuredTest() {
  describe('textObscuredTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/textObscured',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textObscured state success " + JSON.stringify(pages));
        if (!("textObscured" == pages.name)) {
          console.info("get textObscured state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textObscured page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textObscured page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ArkUX_Redacted_Text_0090', 0, async function (done) {
      console.info('ArkUX_Redacted_Text_0090 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0090');
          console.info('ArkUX_Redacted_Text_0090 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Redacted_Text_0090 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Redacted_Text_0090 obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let attr = obj.$attrs
          expect(attr.fontSize).assertEqual("30.00fp");
          expect(attr.fontColor).assertEqual("#FF0000FF");
          expect(attr.textAlign).assertEqual("TextAlign.Start");
          expect(Number(attr.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(attr.baselineOffset).assertEqual("30");
          console.info('ArkUX_Redacted_Text_0090 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0090 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Redacted_Text_0100', 0, async function (done) {
      console.info('ArkUX_Redacted_Text_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0100');
          console.info('ArkUX_Redacted_Text_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Redacted_Text_0100 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Redacted_Text_0100 obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let attr = obj.$attrs
          expect(attr.fontSize).assertEqual("10.00fp");
          expect(attr.fontColor).assertEqual("#FF0000FE");
          expect(attr.textAlign).assertEqual("TextAlign.Start");
          expect(attr.obscured.length).assertEqual(0);
          expect(attr.baselineOffset).assertEqual("0");
          console.info('ArkUX_Redacted_Text_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Redacted_Text_0110', 0, async function (done) {
      console.info('ArkUX_Redacted_Text_0110 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0110');
          console.info('ArkUX_Redacted_Text_0110 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Redacted_Text_0110 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Redacted_Text_0110 obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let attr = obj.$attrs
          expect(attr.fontSize).assertEqual("100.00fp");
          expect(attr.fontColor).assertEqual("#FF0000FD");
          expect(attr.textAlign).assertEqual("TextAlign.End");
          expect(Number(attr.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(attr.baselineOffset).assertEqual("100");
          console.info('ArkUX_Redacted_Text_0110 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0110 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Redacted_Text_0120', 0, async function (done) {
      console.info('ArkUX_Redacted_Text_0120 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0120');
          console.info('ArkUX_Redacted_Text_0120 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Redacted_Text_0120 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Redacted_Text_0120 obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let attr = obj.$attrs
          expect(attr.fontSize).assertEqual("1000.00fp");
          expect(attr.fontColor).assertEqual("#FF0000FC");
          expect(attr.textAlign).assertEqual("TextAlign.Center");
          expect(Number(attr.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(attr.baselineOffset).assertEqual("1000");
          console.info('ArkUX_Redacted_Text_0120 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0120 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Redacted_Text_0130', 0, async function (done) {
      console.info('ArkUX_Redacted_Text_0130 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Redacted_Text_0130');
          console.info('ArkUX_Redacted_Text_0130 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Redacted_Text_0130 obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Redacted_Text_0130 obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          let attr = obj.$attrs
          expect(attr.fontSize).assertEqual("1.00fp");
          expect(attr.fontColor).assertEqual("#FF0000FB");
          expect(attr.textAlign).assertEqual("TextAlign.Start");
          expect(Number(attr.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          expect(attr.baselineOffset).assertEqual("1");
          console.info('ArkUX_Redacted_Text_0130 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Text_0130 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  })
}