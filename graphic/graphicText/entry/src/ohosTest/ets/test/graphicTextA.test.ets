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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text"



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
    it('testLoadFontSync', 7, async (done:Function)=> {
      let msg = "testLoadFontSync"
      console.info(msg + ' begin ');
      try {
        let fontCollection = new text.FontCollection;
        fontCollection.loadFontSync("test", "");
        console.log(msg + ' Succeed in fontCollection.loadFontSync.')
        expect(true).assertTrue()
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
    it('testTextStyle_2', 2, async (done:Function)=> {
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
            expect(true).assertTrue()
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
    it('testGetGlobalInstance', 7, async (done:Function)=> {
      let msg = "====testGetGlobalInstance===="
      console.info(msg + ' begin ');
      try {
        let fontCollection = text.FontCollection.getGlobalInstance();
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
        fontCollection.loadFontSync('test', 'File://');
        console.log(msg + ' Succeed in fontCollection.loadFontSync.')
        expect(true).assertTrue()
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
    it('testGetActualTextRange', 7, async (done:Function)=> {
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
        expect(true).assertTrue()
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
    it('testGetLineMetrics_1', 7, async (done:Function)=> {
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
        expect(true).assertTrue()
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
    it('testGetLineMetrics_2', 7, async (done:Function)=> {
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
        expect(true).assertTrue()
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
    it('testAddSymbol', 7, async (done:Function)=> {
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
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.info(msg + ' Failed in addSymbol.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in addSymbol.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

  })
}
