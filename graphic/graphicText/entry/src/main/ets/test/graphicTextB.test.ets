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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image'

export default function graphicTextBTest() {

  describe('graphicTextB_test', () => {
    beforeAll(() => {
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_056
     * @tc.name      : testFontWidth
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFontWidth', 7, async function (done) {
      let msg = "====testFontWidth===="
      try{
        expect(text.FontWidth.ULTRA_CONDENSED).assertEqual(1)
        expect(text.FontWidth.EXTRA_CONDENSED).assertEqual(2)
        expect(text.FontWidth.CONDENSED).assertEqual(3)
        expect(text.FontWidth.SEMI_CONDENSED).assertEqual(4)
        expect(text.FontWidth.NORMAL).assertEqual(5)
        expect(text.FontWidth.SEMI_EXPANDED).assertEqual(6)
        expect(text.FontWidth.EXPANDED).assertEqual(7)
        expect(text.FontWidth.EXTRA_EXPANDED).assertEqual(8)
        expect(text.FontWidth.ULTRA_EXPANDED).assertEqual(9)
        console.log(msg + 'Succeed in Enum ')
        done()
      }catch(err){
        console.log(msg + 'Failed in Enum ' + err)
        console.log(msg + 'Failed in Enum ' + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_057
     * @tc.name      : testTextHeightBehavior
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextHeightBehavior', 7, async function (done) {
      let msg = "====testTextHeightBehavior===="
      try{
        expect(text.TextHeightBehavior.ALL).assertEqual(0)
        expect(text.TextHeightBehavior.DISABLE_FIRST_ASCENT).assertEqual(1)
        expect(text.TextHeightBehavior.DISABLE_LAST_ASCENT).assertEqual(2)
        expect(text.TextHeightBehavior.DISABLE_ALL).assertEqual(3)
        console.log(msg + ' Succeed in Enum ')
        expect(true).assertTrue()
        done()
      }catch(err){
        console.log(msg + ' Failed in Enum ' + err)
        console.log(msg + ' Failed in Enum ' + JSON.stringify(err))
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_058
     * @tc.name      : testTextStyle_3
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextStyle_3', 2, async function (done) {
      let msg = "====testTextStyle_3===="
      console.info(msg + ' begin');
      let myTextShadow: text.TextShadow = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        point: {
          x: 15, y: 20
        },
        blurRadius: 0.8
      };
      console.info(msg + ' myTextShadow ready go');
      let myRectStyle: text.TextShadow = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        leftTopRadius: 15,
        rightTopRadius: 15,
        rightBottomRadius: 15,
        leftBottomRadius: 15
      }
      console.info(msg + ' myRectStyle ready go');
      let myFontFeature: text.FontFeature = {
        name: 'aabb',
        value: 15
      }
      console.info(msg + ' myFontFeature ready go');
      try {   
        console.info(msg + ' Details are ready, carried out!');
        let myTextStyle : text.TextStyle = {
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
          locale : "789",
          textShadows : myTextShadow,
          backgroundRect: [myRectStyle],
          baselineShift: 20,
          fontFeatures: [myFontFeature]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
        };
        try {
          let fontCollection = new text.FontCollection;
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
        console.info(msg + 'test TextStyle error ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_059
     * @tc.name      : testParagraphStyle_2
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testParagraphStyle_2', 2, async function (done) {
      let msg = "====testParagraphStyle_2===="
      console.info(msg + ' begin');
      let myTextShadow: text.TextShadow = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        point: {
          x: 15, y: 20
        },
        blurRadius: 0.8
      };
      console.info(msg + ' myTextShadow ready go');
      let myRectStyle: text.RectStyle = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        leftTopRadius: 15,
        rightTopRadius: 15,
        rightBottomRadius: 15,
        leftBottomRadius: 15
      }
      console.info(msg + ' myRectStyle ready go');
      let myFontFeature: text.FontFeature = {
        name: 'aabb',
        value: 15
      }
      console.info(msg + ' myFontFeature ready go');
      let myStrutStyle: text.StrutStyle = {
        fontWidth: text.FontWidth.CONDENSED,
        forceHeight: true,
        heightOverride: true
      }
      console.info(msg + ' myStrutStyle ready go');

      try {   
        console.info(msg + ' Details are ready, carried out!');
        let myTextStyle : text.TextStyle = {
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
          locale : "789",
          textShadows : myTextShadow,
          backgroundRect: [myRectStyle],
          baselineShift: 20,
          fontFeatures: [myFontFeature]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
          strutStyle: myStrutStyle,
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT
        };
        try {
          let fontCollection = new text.FontCollection;
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
        console.info(msg + 'test TextStyle error ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_060
     * @tc.name      : testPaintOnPath
     * @tc.desc      : To test interface paintOnPath of Paragraph.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPaintOnPath', 2, async function (done) {
      let msg = "====testPaintOnPath===="
      console.info(msg + ' begin');
      try{
        let myParagraphStyle: text.ParagraphStyle = {
          align: 3,
        };
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let paragraph = ParagraphGraphBuilder.build();

        const color: ArrayBuffer = new ArrayBuffer(160000);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } }
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let canvas = new drawing.Canvas(pixelMap);
        let path = new drawing.Path();
        console.log(msg + ' Succeed in every Variable!')

        path.arcTo(20, 20, 180, 180, 180, 90);
        console.log(msg + ' Succeed in arcTo!')

        paragraph.paintOnPath(canvas, path, 0, 0);
        console.log(msg + ' Succeed in paragraph.paintOnPath')
        expect(true).assertTrue()
        done()
      }catch(err){
        console.info(msg + 'test paragraph.paintOnPath error ' + JSON.stringify(err));
        console.info(msg + 'test paragraph.paintOnPath error ' + err);
        expect().assertFail();
        done()
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_061
     * @tc.name      : testClearCaches
     * @tc.desc      : To test interface clearCaches of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testClearCaches', 7, async function (done) {
      let msg = "====testClearCaches===="
      console.info(msg + ' begin ');
      try {
        let fontCollection = text.FontCollection.getGlobalInstance();
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
        console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
        fontCollection.clearCaches();
        console.log(msg + ' Succeed in fontCollection.clearCaches.')
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.info(msg + ' Failed in fontCollection.getGlobalInstance.    Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in fontCollection.getGlobalInstance.    Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_062
     * @tc.name      : testTextStyle_FontVariation
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextStyle_FontVariation', 2, async function (done) {
      let msg = "====testTextStyle_FontVariation===="
      console.info(msg + ' begin');
      let myTextShadow: text.TextShadow = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        point: {
          x: 15, y: 20
        },
        blurRadius: 0.8
      };
      console.info(msg + ' myTextShadow ready go');
      let myRectStyle: text.TextShadow = {
        color: {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        leftTopRadius: 15,
        rightTopRadius: 15,
        rightBottomRadius: 15,
        leftBottomRadius: 15
      }
      console.info(msg + ' myRectStyle ready go');
      let myFontFeature: text.FontFeature = {
        name: 'aabb',
        value: 15
      }
      console.info(msg + ' myFontFeature ready go');
      let myFontVariation: text.FontVariation = {
        axis: 'KeyWord',
        value: 26
      }
      console.info(msg + ' myFontVariation ready go');
      try {   
        console.info(msg + ' Details are ready, carried out!');
        let myTextStyle : text.TextStyle = {
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
          locale : "789",
          textShadows : myTextShadow,
          backgroundRect: [myRectStyle],
          baselineShift: 20,
          fontFeatures: [myFontFeature],
          fontVariations: [myFontVariation]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
        };
        try {
          let fontCollection = new text.FontCollection;
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            console.log(msg + ' Succeed in text.ParagraphBuilder, This case Pass !')
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
        console.info(msg + 'test TextStyle error ' + err);
        expect().assertFail();
        done()
      }
    })
    

  })
}
