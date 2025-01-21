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

export default function textSpanFontTest() {
  describe('textSpanFontTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/textSpanFont',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textSpanFont state success " + JSON.stringify(pages));
        if (!("textSpanFont" == pages.name)) {
          console.info("get textSpanFont state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push textSpanFont page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textSpanFont page error: " + err);
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
    it('ArkUX_Stage_Text_Font_FontWeight_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0100');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0100 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0200');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0200 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0300');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0300 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("100");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0400');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0400 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("900");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0500');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0500 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("700");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0600');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0600 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0700');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0700 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0800');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0800 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0800 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_0900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_0900');
          console.info('ArkUX_Stage_Text_Font_FontWeight_0900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_0900 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_0900 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_1000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_1000');
          console.info('ArkUX_Stage_Text_Font_FontWeight_1000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_1000 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_1000 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_1100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_1100');
          console.info('ArkUX_Stage_Text_Font_FontWeight_1100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_1100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_1100 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_1100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_1100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontWeight_1200', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontWeight_1200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontWeight_1200');
          console.info('ArkUX_Stage_Text_Font_FontWeight_1200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontWeight_1200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontWeight_1200 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Text_Font_FontWeight_1200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontWeight_1200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0100');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0100 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0200');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0200 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0300');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0300 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("100");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0400');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0400 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("900");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0500');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0500 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("700");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0600');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0600 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0700');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0700 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0800');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0800 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0800 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_0900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_0900');
          console.info('ArkUX_Stage_Span_Font_FontWeight_0900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_0900 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_0900 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_1000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_1000');
          console.info('ArkUX_Stage_Span_Font_FontWeight_1000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_1000 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_1000 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_1100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_1100');
          console.info('ArkUX_Stage_Span_Font_FontWeight_1100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_1100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_1100 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_1100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_1100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontWeight_1200', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontWeight_1200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontWeight_1200');
          console.info('ArkUX_Stage_Span_Font_FontWeight_1200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontWeight_1200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontWeight_1200 font is: " +
          JSON.stringify(font));
          expect(font.weight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Span_Font_FontWeight_1200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontWeight_1200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0100');
          console.info('ArkUX_Stage_Text_Font_FontSize_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0100 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("0.00px");
          console.info('ArkUX_Stage_Text_Font_FontSize_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0200');
          console.info('ArkUX_Stage_Text_Font_FontSize_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0200 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0300');
          console.info('ArkUX_Stage_Text_Font_FontSize_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0300 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00px");
          console.info('ArkUX_Stage_Text_Font_FontSize_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0400');
          console.info('ArkUX_Stage_Text_Font_FontSize_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0400 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00vp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0500');
          console.info('ArkUX_Stage_Text_Font_FontSize_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0500 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00lpx");
          console.info('ArkUX_Stage_Text_Font_FontSize_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0600');
          console.info('ArkUX_Stage_Text_Font_FontSize_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0600 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0700');
          console.info('ArkUX_Stage_Text_Font_FontSize_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0700 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0800');
          console.info('ArkUX_Stage_Text_Font_FontSize_0800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0800 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0800 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_0900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_0900');
          console.info('ArkUX_Stage_Text_Font_FontSize_0900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_0900 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_0900 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontSize_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontSize_1000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontSize_1000');
          console.info('ArkUX_Stage_Text_Font_FontSize_1000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontSize_1000 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontSize_1000 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("20.00fp");
          console.info('ArkUX_Stage_Text_Font_FontSize_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontSize_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0100');
          console.info('ArkUX_Stage_Span_Font_FontSize_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0100 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("0.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0200');
          console.info('ArkUX_Stage_Span_Font_FontSize_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0200 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0300');
          console.info('ArkUX_Stage_Span_Font_FontSize_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0300 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00px");
          console.info('ArkUX_Stage_Span_Font_FontSize_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0400');
          console.info('ArkUX_Stage_Span_Font_FontSize_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0400 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00vp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0500');
          console.info('ArkUX_Stage_Span_Font_FontSize_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0500 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("30.00lpx");
          console.info('ArkUX_Stage_Span_Font_FontSize_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0600');
          console.info('ArkUX_Stage_Span_Font_FontSize_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0600 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0700');
          console.info('ArkUX_Stage_Span_Font_FontSize_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0700 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0700 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0800 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0800');
          console.info('ArkUX_Stage_Span_Font_FontSize_0800 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0800 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0800 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0800 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0800 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_0900 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_0900');
          console.info('ArkUX_Stage_Span_Font_FontSize_0900 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_0900 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_0900 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("16.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_0900 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontSize_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontSize_1000 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontSize_1000');
          console.info('ArkUX_Stage_Span_Font_FontSize_1000 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontSize_1000 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontSize_1000 font is: " +
          JSON.stringify(font));
          expect(font.size).assertEqual("20.00fp");
          console.info('ArkUX_Stage_Span_Font_FontSize_1000 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontSize_1000 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0100');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0100 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0200');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0200 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0300');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0300 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0400');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0400 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0500');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0500 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontStyle_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontStyle_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontStyle_0600');
          console.info('ArkUX_Stage_Text_Font_FontStyle_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontStyle_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontStyle_0600 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Text_Font_FontStyle_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontStyle_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0100');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0100 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0200');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0200 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0300');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0300 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0400');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0400 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Normal");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0500');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0500 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontStyle_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontStyle_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontStyle_0600');
          console.info('ArkUX_Stage_Span_Font_FontStyle_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontStyle_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontStyle_0600 font is: " +
          JSON.stringify(font));
          expect(font.style).assertEqual("FontStyle.Italic");
          console.info('ArkUX_Stage_Span_Font_FontStyle_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontStyle_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0100');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0100 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("zidingyi");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0200');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0200 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0300');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0300 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0400');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0400 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0500');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0500 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Text_Font_FontFamily_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0600');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0600 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });


    it('ArkUX_Stage_Text_Font_FontFamily_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Text_Font_FontFamily_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Text_Font_FontFamily_0700');
          console.info('ArkUX_Stage_Text_Font_FontFamily_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Text_Font_FontFamily_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Text_Font_FontFamily_0700 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("Arial, sans-serif");
          console.info('ArkUX_Stage_Text_Font_FontFamily_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Text_Font_FontFamily_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0100 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0100');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0100 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0100 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0100 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("zidingyi");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0100 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0100 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0200 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0200');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0200 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0200 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0200 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0200 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0200 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0300 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0300');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0300 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0300 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0300 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0300 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0300 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0400 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0400');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0400 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0400 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0400 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0400 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0400 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0500 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0500');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0500 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0500 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0500 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0500 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0500 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0600 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0600');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0600 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0600 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0600 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("HarmonyOS Sans");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0600 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0600 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

    it('ArkUX_Stage_Span_Font_FontFamily_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Span_Font_FontFamily_0700 START');
      setTimeout(()=>{
        try{
          let strJson = getInspectorByKey('ArkUX_Stage_Span_Font_FontFamily_0700');
          console.info('ArkUX_Stage_Span_Font_FontFamily_0700 START  :'+ JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Span_Font_FontFamily_0700 obj.$attrs.font is: " +
          JSON.stringify(obj.$attrs.font));
          let font = JSON.parse(obj.$attrs.font)
          console.info("ArkUX_Stage_Span_Font_FontFamily_0700 font is: " +
          JSON.stringify(font));
          expect(font.family).assertEqual("Arial, sans-serif");
          console.info('ArkUX_Stage_Span_Font_FontFamily_0700 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Span_Font_FontFamily_0900 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });

  })
}