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

export default function imageObscuredTest() {
  describe('imageObscuredTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageObscuredTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get imageObscuredTest state success " + JSON.stringify(pages));
        if (!("imageObscuredTest" == pages.name)) {
          console.info("get imageObscuredTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push imageObscuredTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push imageObscuredTest page error: " + err);
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

    /**
     * @tc.name   ArkUX_Redacted_Image_0150
     * @tc.number ArkUX_Redacted_Image_0150
     * @tc.desc   ArkUX_Redacted_Image_0150
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Redacted_Image_0150', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Image_0150 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Image_0150');
          console.info('ArkUX_Redacted_Image_0150 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0150 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Image_0150 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.width).assertEqual("400.00px");
          expect(JSON.parse(strJson).$attrs.height).assertEqual("400.00px");
          expect(JSON.parse(strJson).$attrs.borderRadius).assertEqual("20.00vp");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0150 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0150 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Redacted_Image_0160
     * @tc.number ArkUX_Redacted_Image_0160
     * @tc.desc   ArkUX_Redacted_Image_0160
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Redacted_Image_0160', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Image_0160 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Image_0160');
          console.info('ArkUX_Redacted_Image_0160 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0160 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Image_0160 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.obscured.length).assertEqual(0);
          console.info('ArkUX_Redacted_Image_0020 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0160 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Redacted_Image_0170
     * @tc.number ArkUX_Redacted_Image_0170
     * @tc.desc   ArkUX_Redacted_Image_0170
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Redacted_Image_0170', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Image_0170 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Image_0170');
          console.info('ArkUX_Redacted_Image_0170 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0170 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Image_0170 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(JSON.parse(strJson).$attrs.width).assertEqual("700.00px");
          expect(JSON.parse(strJson).$attrs.height).assertEqual("200.00px");
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0170 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0170 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Redacted_Image_0180
     * @tc.number ArkUX_Redacted_Image_0180
     * @tc.desc   ArkUX_Redacted_Image_0180
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Redacted_Image_0180', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Image_0180 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Image_0180');
          console.info('ArkUX_Redacted_Image_0180 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0180 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Image_0180 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0180 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0180 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Redacted_Image_0190
     * @tc.number ArkUX_Redacted_Image_0190
     * @tc.desc   ArkUX_Redacted_Image_0190
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Redacted_Image_0190', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Redacted_Image_0190 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Redacted_Image_0190');
          console.info('ArkUX_Redacted_Image_0190 START  :' + JSON.stringify(strJson));
          console.info("ArkUX_Redacted_Image_0190 JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
          console.info("ArkUX_Redacted_Image_0190 JSON.parse(strJson).$attrs is: " +
          JSON.stringify(JSON.parse(strJson).$attrs));
          expect(Number(JSON.parse(strJson).$attrs.obscured[0])).assertEqual(Number(ObscuredReasons.PLACEHOLDER));
          console.info('ArkUX_Redacted_Image_0190 END ');
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Redacted_Image_0190 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

  })
}