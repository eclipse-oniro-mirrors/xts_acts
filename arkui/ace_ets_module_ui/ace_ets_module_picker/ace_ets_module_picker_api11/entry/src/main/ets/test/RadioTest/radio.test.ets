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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from "../../MainAbility/common/Common";

let emitKey = "emitUserAgent";

export default function radioTest() {
  describe('ActsRadioTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ActsRadioTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/Radio',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ActsRadioTest state success " + JSON.stringify(pages));
        if (!("Radio" == pages.name)) {
          console.info("get ActsRadioTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push ActsRadioTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActsRadioTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ActsRadioTest after each called");
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0100
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0100
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to "#FF000000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0100');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0200
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0200
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to 0xffc0cb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0200');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0300
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0300
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to 'rgb(255,0,0)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0300');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0300 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0400
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0400
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to Color.Green
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0400');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0400 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FF008000");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0500
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0500
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0500');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0500 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FFA67D3D");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0600
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0600
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0600');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0600 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FF808080");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0700
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0700
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to 0x00ff00,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0700');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0700 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0800
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0800
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0800');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0800 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_0900
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_0900
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_0900');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_0900 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_1000
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_1000
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1000');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1000 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_1100
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_1100
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1100');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_CheckedBackgroundColor_1200
     * @tc.number ArkUX_Stage_Radio_CheckedBackgroundColor_1200
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_CheckedBackgroundColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_CheckedBackgroundColor_1200');
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_CheckedBackgroundColor_1200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_CheckedBackgroundColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0100
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0100
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to "#FF00FF00"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0100');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0200
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0200
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to 0xffc0cb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0200');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0300
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0300
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to 'rgb(255,255,0)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0300');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0300 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0400
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0400
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to Color.Blue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0400');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0400 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FF0000FF");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0500
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0500
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0500');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0500 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FFFF0000");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0600
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0600
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to "rgb(138,43,226)"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0600');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0600 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0700
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0700
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to 0xffa500,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0700');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0700 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FFFFA500");
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0800
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0800
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0800');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0800 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_0900
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_0900
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_0900');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_0900 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_1000
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_1000
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1000');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1000 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_1100
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_1100
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1100');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1100 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_UncheckedBorderColor_1200
     * @tc.number ArkUX_Stage_Radio_UncheckedBorderColor_1200
     * @tc.desc   Radio common components, set uncheckedBorderColor property parameter to 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_UncheckedBorderColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_UncheckedBorderColor_1200');
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_UncheckedBorderColor_1200 component radioStyle is: " +
          JSON.stringify(radioStyle));
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_UncheckedBorderColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0100
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0100
     * @tc.desc   Radio common components, set indicatorColor property parameter to "#FF00FFFF"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0100');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FF00FFFF");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0200
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0200
     * @tc.desc   Radio common components, set indicatorColor property parameter to 0xffc0cb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0200');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0200 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0300
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0300
     * @tc.desc   Radio common components, set indicatorColor property parameter to 'rgb(255,97,0)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0300');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0300 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FFFF6100");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0400
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0400
     * @tc.desc   Radio common components, set indicatorColor property parameter to Color.Yellow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0400');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0400 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0500
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0500
     * @tc.desc   Radio common components, set indicatorColor property parameter to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0500');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0500 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0600
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0600
     * @tc.desc   Radio common components, set indicatorColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0600');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0600 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0600 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FF000000");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0700
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0700
     * @tc.desc   Radio common components, set indicatorColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0700');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0700 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual("#FFFFA500");
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0800
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0800
     * @tc.desc   Radio common components, set indicatorColor property parameter to ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0800');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0800 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_0900
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_0900
     * @tc.desc   Radio common components, set indicatorColor property parameter to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_0900');
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_0900 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_1000
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_1000
     * @tc.desc   Radio common components, set indicatorColor property parameter to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1000');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1000 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_1100
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_1100
     * @tc.desc   Radio common components, set indicatorColor property parameter to "rgb(138,43,226)",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1100');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_IndicatorColor_1200
     * @tc.number ArkUX_Stage_Radio_IndicatorColor_1200
     * @tc.desc   Radio common components, set indicatorColor property parameter to 'bgr(138,43,226)'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_IndicatorColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_IndicatorColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_IndicatorColor_1200');
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_IndicatorColor_1200 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.borderColor);
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_IndicatorColor_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_Color_0100
     * @tc.number ArkUX_Stage_Radio_Color_0100
     * @tc.desc   Radio common components, set checkedBackgroundColor property parameter to "#FFFF0000"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_Color_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_Color_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_Color_0100');
          console.info('ArkUX_Stage_Radio_Color_0100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_Color_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_Color_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_Color_0100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_Color_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual("#FFFF0000");
          expect(radioStyle.uncheckedBorderColor).assertEqual("#FFDB70DB");
          expect(radioStyle.indicatorColor).assertEqual("#FFFFFF00");
          console.info('ArkUX_Stage_Radio_Color_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_Color_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUX_Stage_Radio_0100
     * @tc.number ArkUX_Stage_Radio_Color_0100
     * @tc.desc   The new attribute of radio component is not set, View the default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUX_Stage_Radio_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Radio_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Radio_0100');
          console.info('ArkUX_Stage_Radio_0100 START :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_Radio_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Radio_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Radio_0100 component obj.$attrs.radioStyle is: " +
          JSON.stringify(obj.$attrs.radioStyle));
          let radioStyle: ESObject = JSON.parse(obj.$attrs.radioStyle);
          console.info("ArkUX_Stage_Radio_0100 component radioStyle is: " + JSON.stringify(radioStyle));
          expect(radioStyle.checkedBackgroundColor).assertEqual(obj.$attrs.borderColor);
          expect(radioStyle.uncheckedBorderColor).assertEqual(obj.$attrs.backgroundColor);
          expect(radioStyle.indicatorColor).assertEqual(obj.$attrs.foregroundColor);
          console.info('ArkUX_Stage_Radio_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Radio_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
