/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text"

async function loadFontByPromiseInvalidParameter(msg: string | null | undefined,
  fontName: string | null | undefined, path: string | Resource | null | undefined, done:Function)
{
  console.info(msg + ' begin ');
  let fontCollection = new text.FontCollection;
  await fontCollection.loadFont(fontName, path).then(() => {
    console.info(msg + `loadFont by promise successfully`);
    expect(false).assertTrue();
    done();
  }).catch((error: BusinessError) => {
    console.error(msg + ` loadFont by promise failed, error: [${error.code}, ${error.message}]`);
    expect(error.code).assertEqual(401);
    done();
  });
}

export default function graphicTextATest() {

  describe('graphicTextA_test', () => {
    beforeAll(() => {
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_049
     * @tc.name      : testLoadFontSync
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "testLoadFontSync"
      console.info(msg + ' begin ');
      try {
        let fontCollection = new text.FontCollection;
        fontCollection.loadFontSync("test", "");
        console.log(msg + ' Succeed in fontCollection.loadFontSync.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_050
     * @tc.name      : testTextStyle_2
     * @tc.desc      : To test interface TextStyle, add new property: fontStyle .
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextStyle_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "testTextStyle_2"
      console.info(msg + 'begin');
      let decoration : text.Decoration = {
        textDecoration: text.TextDecorationType.UNDERLINE,
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        decorationStyle : text.TextDecorationStyle.SOLID,
        decorationThicknessScale : 20
      };
      try {
        let myTextStyle : text.TextStyle = {
          decoration: decoration,
          color: {
            alpha: 255, red: 255, green: 0, blue: 0
          },
          fontWeight : text.FontWeight.W100,
          fontStyle : text.FontStyle.ITALIC,
          baseline : text.TextBaseline.ALPHABETIC,
          fontFamilies : Array<string>("123"),
          fontSize : 30,
          letterSpacing : 20,
          wordSpacing : 20,
          heightScale : 20,
          halfLeading : true,
          heightOnly : true,
          ellipsis : "456",
          ellipsisMode : text.EllipsisMode.START,
          locale : "789"
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
        };
        try {
          let fontCollection = text.FontCollection.getGlobalInstance();
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            console.log(msg + ' Succeed in text.ParagraphBuilder')
            done()
          } catch (err) {
            console.info(msg + ' Failed in fontCollection.ParagraphBuilder.    Cause: ' + JSON.stringify(err));
            console.info(msg + ' Failed in fontCollection.ParagraphBuilder.    Cause: ' + err);
            expect().assertFail();
            done()
          }
        } catch (err) {
          console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + JSON.stringify(err));
          console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + err);
          expect().assertFail();
          done()
        }
      } catch (err) {
        console.info(msg + 'test TextStyle error ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_051
     * @tc.name      : testGetGlobalInstance
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetGlobalInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testGetGlobalInstance===="
      console.info(msg + ' begin ');
      try {
        let fontCollection = text.FontCollection.getGlobalInstance();
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
        fontCollection.loadFontSync('test', 'File://');
        console.log(msg + ' Succeed in fontCollection.loadFontSync.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in fontCollection.loadFontSync.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_052
     * @tc.name      : testGetActualTextRange
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetActualTextRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testGetActualTextRange===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: 3,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();
        let rang = paragraph.getActualTextRange(0, true);
        console.log(msg + ' Succeed in getActualTextRange.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in getActualTextRange.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in getActualTextRange.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_053
     * @tc.name      : testGetLineMetrics_1
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLineMetrics_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testGetLineMetrics_1===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: 3,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();
        let rang = paragraph.getActualTextRange(0, true);
        let arrLineMetrc =  paragraph.getLineMetrics();
        console.log(msg + ' Succeed in getLineMetrics.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in getLineMetrics.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in getLineMetrics.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_054
     * @tc.name      : testGetLineMetrics_2
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLineMetrics_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testGetLineMetrics_2===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: 3,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();
        let lineMetrics =  paragraph.getLineMetrics(0);
        console.log(msg + ' Succeed in getLineMetrics.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in getLineMetrics.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in getLineMetrics.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_055
     * @tc.name      : testAddSymbol
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testAddSymbol', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testAddSymbol===="
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: 3,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        ParagraphGraphBuilder.addSymbol(0xF0000);
        let paragraph = ParagraphGraphBuilder.build();
        console.log(msg + ' Succeed in addSymbol.')
        console.log(msg + ' Succeed in addSymbol.')
        done()
      } catch (err) {
        console.info(msg + ' Failed in addSymbol.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in addSymbol.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_056
     * @tc.name      : testLoadFontByPromiseInvalidPath01
     * @tc.desc      : To test interface loadFont of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath01"
      await loadFontByPromiseInvalidParameter(msg, "test", "", done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_057
     * @tc.name      : testLoadFontByPromiseInvalidPath02
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath02"
      await loadFontByPromiseInvalidParameter(msg, 'test', 'File://', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_058
     * @tc.name      : testLoadFontByPromiseInvalidPath03
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath03"
      await loadFontByPromiseInvalidParameter(msg, 'test', '中文无效路径', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_059
     * @tc.name      : testLoadFontByPromiseInvalidPath04
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath04"
      await loadFontByPromiseInvalidParameter(msg, 'test', 'english中文无效路径$rawfile(MiSans_VF.ttf)', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_060
     * @tc.name      : testLoadFontByPromiseInvalidPath05
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath05"
      await loadFontByPromiseInvalidParameter(msg, 'test', 'File://', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_061
     * @tc.name      : testLoadFontByPromiseInvalidPath06
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath06"
      await loadFontByPromiseInvalidParameter(msg, "test", null, done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_062
     * @tc.name      : testLoadFontByPromiseInvalidPath07
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath07"
      await loadFontByPromiseInvalidParameter(msg, "test", undefined, done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_063
     * @tc.name      : testLoadFontByPromiseInvalidPath08
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidPath08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidPath08"
      await loadFontByPromiseInvalidParameter(msg, "", undefined, done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_064
     * @tc.name      : testLoadFontByPromiseInvalidName01
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidName01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidName01"
      await loadFontByPromiseInvalidParameter(msg, null, 'File://', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_065
     * @tc.name      : testLoadFontByPromiseInvalidName02
     * @tc.desc      : To test interface loadFontAsync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontByPromiseInvalidName02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "testLoadFontByPromiseInvalidName02"
      await loadFontByPromiseInvalidParameter(msg, undefined, 'File://', done).catch((err: BusinessError) => {
        console.info(msg + ` failed, error: [${err.code}, ${err.message}]`);
        expect(err.code).assertEqual(401);
        done();
      });
    })

  })
}
