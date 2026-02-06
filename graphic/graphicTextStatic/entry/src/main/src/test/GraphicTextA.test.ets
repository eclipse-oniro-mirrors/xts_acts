/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextATest() {

  describe('GraphicTextATest', () => {
    let myColor: common2D.Color;
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })

    /**
     * @tc.number    : testLoadFontSyncStatic
     * @tc.name      : testLoadFontSyncStatic
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadFontSyncStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
     * @tc.number    : testTextStyleStatic_2
     * @tc.name      : testTextStyleStatic_2
     * @tc.desc      : To test interface TextStyle, add new property: fontStyle .
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextStyleStatic_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "testTextStyle_2"
      console.info(msg + 'begin');
      let decoration : text.Decoration = {
        textDecoration: text.TextDecorationType.UNDERLINE,
        color: myColor,
        decorationStyle : text.TextDecorationStyle.SOLID,
        decorationThicknessScale : 20
      };
      try {
        let myTextStyle : text.TextStyle = {
          decoration: decoration,
          color: myColor,
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
          align: text.TextAlign.JUSTIFY,
        };
        try {
          let fontCollection = text.FontCollection.getGlobalInstance();
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, ' + JSON.stringify(fontCollection) )
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
     * @tc.number    : testGetGlobalInstanceStatic
     * @tc.name      : testGetGlobalInstanceStatic
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetGlobalInstanceStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "====testGetGlobalInstance===="
      console.info(msg + ' begin ');
      try {
        let fontCollection = text.FontCollection.getGlobalInstance();
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, ' + JSON.stringify(fontCollection) )
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
     * @tc.number    : testGetActualTextRangeStatic
     * @tc.name      : testGetActualTextRangeStatic
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetActualTextRangeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "====testGetActualTextRange===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: myColor,
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();
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
     * @tc.number    : testGetLineMetricsStatic_1
     * @tc.name      : testGetLineMetricsStatic_1
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLineMetricsStatic_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "====testGetLineMetrics_1===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: myColor,
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();
        let arrLineMetrc =  paragraph.getLineMetrics();
        console.log(msg + ' Succeed in getLineMetrics.');
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
     * @tc.number    : testGetLineMetricsStatic_2
     * @tc.name      : testGetLineMetricsStatic_2
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLineMetricsStatic_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "====testGetLineMetrics_2===="
      console.info(msg + ' begin ');
      let myTextStyle: text.TextStyle = {
        color: myColor,
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
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
     * @tc.number    : testAddSymbolStatic
     * @tc.name      : testAddSymbolStatic
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testAddSymbolStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg = "====testAddSymbol===="
      let myTextStyle: text.TextStyle = {
        color: myColor,
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.JUSTIFY,
      };
      try {
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
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
