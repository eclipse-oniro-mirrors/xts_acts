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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
let emitKey = "emitUserAgent";
function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
export default function textInputTest() {
  describe('ActsTextInputTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextinputIndex",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextinputIndex state success " + JSON.stringify(pages));
        if (!("TextinputIndex" == pages.name)) {
          console.info("get TextinputIndex state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info("push TextinputIndex page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextinputIndex page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0100
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   The component does not have a text parameter. Set the caretPosition property parameter to 3
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_Badge_FontWeight_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0100');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0100 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 5000)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0200
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Sets the caretPosition property parameter to 0
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0200');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0200 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0300
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Sets the caretPosition property parameter to 7
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0300');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0300 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0400
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Sets the caretPosition property parameter to "7"
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0400');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0400 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0500
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Sets the caretPosition property parameter to $r("app.string.textInput_Size_test")
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0500');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0500 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0600
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to exceed the existing text length by 100
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0600 START');
      setTimeout(() => {
        try {
          let str = "input your word..."
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0600');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0600 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition != "100").assertTrue();
          expect(obj.$attrs.caretPosition).assertEqual(str.length.toString());
          console.info('ArkUX_Stage_TextInput_CaretPosition_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0700
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to an outlier ""
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0700');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0700 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0800
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to an outlier -1
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0800');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0800 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_0900
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to an outlier null
     */
    it('ArkUX_Stage_TextInput_CaretPosition_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_0900');
          console.info('ArkUX_Stage_TextInput_CaretPosition_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_0900 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_1000
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to an outlier undefined
     */
    it('ArkUX_Stage_TextInput_CaretPosition_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_1000');
          console.info('ArkUX_Stage_TextInput_CaretPosition_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_1000 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_1100
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to 7 and set the caretPosition property parameter to 3 again
     */
    it('ArkUX_Stage_TextInput_CaretPosition_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_1100');
          console.info('ArkUX_Stage_TextInput_CaretPosition_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_TextInput_CaretPosition_1100 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("3");
          console.info('ArkUX_Stage_TextInput_CaretPosition_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_1200
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition property parameter to 7 and set the caretPosition property
                parameter to undefined again
     */
    it('ArkUX_Stage_TextInput_CaretPosition_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_1200');
          console.info('ArkUX_Stage_TextInput_CaretPosition_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_TextInput_CaretPosition_1200 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("0");
          console.info('ArkUX_Stage_TextInput_CaretPosition_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_1300
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   Set the caretPosition attribute parameter to 7 and the generic position attribute to null
     */
    it('ArkUX_Stage_TextInput_CaretPosition_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_1300');
          console.info('ArkUX_Stage_TextInput_CaretPosition_1300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_1300 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("7");
          console.info('ArkUX_Stage_TextInput_CaretPosition_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretPosition_1400
     *tc.name   Support modifying the cursor position change of TextInput component
     *tc.desc   TextInput component text text overlength setting cursor position "70"
     */
    it('ArkUX_Stage_TextInput_CaretPosition_1400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretPosition_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretPosition_1400');
          console.info('ArkUX_Stage_TextInput_CaretPosition_1400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretPosition_1400 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          expect(obj.$attrs.caretPosition).assertEqual("70");
          console.info('ArkUX_Stage_TextInput_CaretPosition_1400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretPosition_1400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0100
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to 0
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0100');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0100 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("0.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0200
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to 7
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0200');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0200 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0300
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to "7vp"
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0300');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0300 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0400
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to $r("app.string.textInput_Size_test")
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0400');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0400 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("4.00px");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0500
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to outlier -1
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0500');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0500 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0600
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to outlier ""
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0600');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0600 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0700
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to outlier null
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0700');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0700 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0800
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to outlier undefined
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0800');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0800 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_0900
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to outlier "asff%6&"
     */
    it('ArkUX_Stage_TextInput_CaretWidth_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_0900');
          console.info('ArkUX_Stage_TextInput_CaretWidth_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_0900 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_1000
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to 7 and set the caretWidth property parameter to "2fp" again
     */
    it('ArkUX_Stage_TextInput_CaretWidth_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_1000');
          console.info('ArkUX_Stage_TextInput_CaretWidth_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_1000 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00fp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_1100
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to 7 and set the caretWidth property parameter to undefined again
     */
    it('ArkUX_Stage_TextInput_CaretWidth_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_1100');
          console.info('ArkUX_Stage_TextInput_CaretWidth_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_1100 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_CaretWidth_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_CaretWidth_1200
     *tc.name   Support modifying the cursor thickness of TextInput component
     *tc.desc   Set the caretWidth property parameter to "7lpx" and the common property width property to null
     */
    it('ArkUX_Stage_TextInput_CaretWidth_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_CaretWidth_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_CaretWidth_1200');
          console.info('ArkUX_Stage_TextInput_CaretWidth_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_CaretWidth_1200 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(cursorStyle.width).assertEqual("7.00lpx");
          console.info('ArkUX_Stage_TextInput_CaretWidth_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_CaretWidth_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0100
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to 0x00ff00
     */
    it('ArkUX_Stage_TextInput_selectedColor_0100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0100');
          console.info('ArkUX_Stage_TextInput_selectedColor_0100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0100 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#3300FF00");
          console.info('ArkUX_Stage_TextInput_selectedColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0200
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to #fffd0000
     */
    it('ArkUX_Stage_TextInput_selectedColor_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0200');
          console.info('ArkUX_Stage_TextInput_selectedColor_0200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0200 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0300
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_TextInput_selectedColor_0300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0300');
          console.info('ArkUX_Stage_TextInput_selectedColor_0300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0300 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#338A2BE2");
          console.info('ArkUX_Stage_TextInput_selectedColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_040
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_TextInput_selectedColor_0400', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0400');
          console.info('ArkUX_Stage_TextInput_selectedColor_0400 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0400 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#33FFC0CB");
          console.info('ArkUX_Stage_TextInput_selectedColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0500
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to $r("app.color.TextInput_Color")
     */
    it('ArkUX_Stage_TextInput_selectedColor_0500', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0500');
          console.info('ArkUX_Stage_TextInput_selectedColor_0500 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0500 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0600
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to an outlier ""
     */
    it('ArkUX_Stage_TextInput_selectedColor_0600', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0600');
          console.info('ArkUX_Stage_TextInput_selectedColor_0600 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0600 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_TextInput_selectedColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0700
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to an outlier null
     */
    it('ArkUX_Stage_TextInput_selectedColor_0700', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0700');
          console.info('ArkUX_Stage_TextInput_selectedColor_0700 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0700 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_TextInput_selectedColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0800
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to an outlier undefined
     */
    it('ArkUX_Stage_TextInput_selectedColor_0800', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0800');
          console.info('ArkUX_Stage_TextInput_selectedColor_0800 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0800 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_TextInput_selectedColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_TextInput_selectedColor_0900
     *tc.name   Support to modify the color of the selected base plate of the TextInput component
     *tc.desc   Set the selectedColor property parameter to Color.Pink and
     *          again set the selectedColor property parameter to "#FFFD0000".
     */
    it('ArkUX_Stage_TextInput_selectedColor_0900', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_0900');
          console.info('ArkUX_Stage_TextInput_selectedColor_0900 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_0900 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#33FD0000");
          console.info('ArkUX_Stage_TextInput_selectedColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
      *tc.number ArkUX_Stage_TextInput_selectedColor_1000
      *tc.name   Support to modify the color of the selected base plate of the TextInput component
      *tc.desc   Set the selectedColor property parameter to Color.Pink and
      *          again set the selectedColor property parameter to the outlier undefined.
      */
    it('ArkUX_Stage_TextInput_selectedColor_1000', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_1000');
          console.info('ArkUX_Stage_TextInput_selectedColor_1000 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_1000 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual(obj.$attrs.backgroundColor);
          console.info('ArkUX_Stage_TextInput_selectedColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
      *tc.number ArkUX_Stage_TextInput_selectedColor_1100
      *tc.name   Support to modify the color of the selected base plate of the TextInput component
      *tc.desc   Set the selectedColor property parameter to 0x00ff00 and
      *          the universal property backgroundColor property to the outlier null
      */
    it('ArkUX_Stage_TextInput_selectedColor_1100', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_1100');
          console.info('ArkUX_Stage_TextInput_selectedColor_1100 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_1100 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#3300FF00");
          console.info('ArkUX_Stage_TextInput_selectedColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
      *tc.number ArkUX_Stage_TextInput_selectedColor_1200
      *tc.name   Combined test all new attributes of textinput component
      *tc.desc   Set .selectedBackgroundColor(0x00ff00).width (7).caretPosition(4)
      */
    it('ArkUX_Stage_TextInput_selectedColor_1200', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_1200');
          console.info('ArkUX_Stage_TextInput_selectedColor_1200 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_1200 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          console.info("ArkUX_Stage_TextInput_selectedColor_1200 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          console.info("ArkUX_Stage_TextInput_selectedColor_1200 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(obj.$attrs.selectedBackgroundColor).assertEqual("#3300FF00");
          expect(obj.$attrs.caretPosition).assertEqual("4");
          expect(cursorStyle.width).assertEqual("7.00vp");
          console.info('ArkUX_Stage_TextInput_selectedColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
      *tc.number ArkUX_Stage_TextInput_selectedColor_1300
      *tc.name   Combined test all new attributes of textinput component
      *tc.desc   Do not set new attributes
      */
    it('ArkUX_Stage_TextInput_selectedColor_1300', Level.LEVEL1, async (done: Function) => {
      console.info('ArkUX_Stage_TextInput_selectedColor_1300 START');
      setTimeout(() => {
        try {
          let str = "input your word..."
          let strJson = getInspectorByKey('ArkUX_Stage_TextInput_selectedColor_1300');
          console.info('ArkUX_Stage_TextInput_selectedColor_1300 START  :' + JSON.stringify(strJson));
          let obj: ESObject = JSON.parse(strJson);
          console.info("ArkUX_Stage_TextInput_selectedColor_1300 component obj.$attrs.selectedBackgroundColor is: " +
          JSON.stringify(obj.$attrs.selectedBackgroundColor));
          console.info("ArkUX_Stage_TextInput_selectedColor_1300 component obj.$attrs.caretPosition is: " +
          JSON.stringify(obj.$attrs.caretPosition));
          console.info("ArkUX_Stage_TextInput_selectedColor_1300 component obj.$attrs.caretStyle is: " +
          JSON.stringify(obj.$attrs.caretStyle));
          let cursorStyle: ESObject = JSON.parse(obj.$attrs.caretStyle);
          expect(obj.$attrs.selectedBackgroundColor).assertEqual(obj.$attrs.backgroundColor);
          expect(obj.$attrs.caretPosition).assertEqual("18");
          expect(cursorStyle.width).assertEqual("2.00vp");
          console.info('ArkUX_Stage_TextInput_selectedColor_1300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_TextInput_selectedColor_1300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
