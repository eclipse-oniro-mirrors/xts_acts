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
import CommonFunc from '../../MainAbility/common/Common';

export default function stageFontTest() {
  describe('stageFontTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/stageFont'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stageFont state success " + JSON.stringify(pages));
        if (!("stageFont" == pages.name)) {
          console.info("get stageFont state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stageFont page success");
        }
      } catch (err) {
        console.error("push stageFont page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('Stage_Font_0100', Level.LEVEL2, async (done: Function) => {
      console.info('Stage_Font_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('button');
          console.info('Stage_Font_0100 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_0100 JSON.parse(strJson).$attrs.labelStyle is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.labelStyle));
          console.info("Stage_Font_0100 fontFamily is: " +
          JSON.stringify(JSON.parse(JSON.parse(strJson).$attrs.labelStyle)));
          expect(JSON.parse(JSON.parse(JSON.parse(strJson).$attrs.labelStyle).font).family).assertEqual("fontCustom");
          console.info('Stage_Font_0100 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
    it('Stage_Font_0200', Level.LEVEL2, async (done: Function) => {
      console.info('Stage_Font_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('text');
          console.info('Stage_Font_0200 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_0200 JSON.parse(strJson).$attrs.fontFamily is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.fontFamily));
          expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual("fontCustom");
          console.info('Stage_Font_0200 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('Stage_Font_0300', Level.LEVEL2, async (done: Function) => {
      console.info('Stage_Font_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textArea');
          console.info('Stage_Font_0300 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_0300 JSON.parse(strJson).$attrs.fontFamily is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.fontFamily));
          expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual("fontCustom");
          console.info('Stage_Font_0300 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('Stage_Font_0400', Level.LEVEL2, async (done: Function) => {
      console.info('Stage_Font_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textInput');
          console.info('Stage_Font_0400 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_0400 JSON.parse(strJson).$attrs.fontFamily is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.fontFamily));
          expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual("fontCustom");
          console.info('Stage_Font_0400 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('Stage_Font_0500', Level.LEVEL2, async (done: Function) => {
      console.info('Stage_Font_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('textSpan');
          console.info('Stage_Font_0500 START  :' + JSON.stringify(strJson));
          
          console.info("Stage_Font_0500 JSON.parse(strJson).$attrs.fontFamily is: " +
          JSON.stringify(JSON.parse(strJson).$attrs.fontFamily));
          expect(JSON.parse(strJson).$attrs.fontFamily).assertEqual("fontCustom");
          console.info('Stage_Font_0500 END ');
        } catch (err) {
          expect().assertFail()
          console.info('Stage_Font_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    it('Stage_Font_0600', Level.LEVEL2, async (done: Function) => {
      let fontRegister:ESObject = globalThis.uiContent.getFont();
      console.info('Stage_Font_0600 START');
      try {
        let font:ESObject = fontRegister.registerFont(undefined)
        expect(font).assertUndefined();
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('Stage_Font_0600 END');
      done();
    });

    it('Stage_Font_0700', Level.LEVEL2, async (done: Function) => {
      let fontRegister:ESObject = globalThis.uiContent.getFont();
      console.info('Stage_Font_0700 START');
      try {
        let font:ESObject = fontRegister.registerFont()
        expect(font).assertUndefined();
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('Stage_Font_0700 END');
      done();
    });

    it('Stage_Font_0800', Level.LEVEL2, async (done: Function) => {
      let fontRegister:ESObject = globalThis.uiContent.getFont();
      console.info('Stage_Font_0800 START');
      try {
        let font:ESObject = fontRegister.registerFont(null)
        expect(font).assertUndefined();
      } catch (err) {
        console.error("push button page error " + JSON.stringify(err));
      }
      console.info('Stage_Font_0800 END');
      done();
    });
  })
}