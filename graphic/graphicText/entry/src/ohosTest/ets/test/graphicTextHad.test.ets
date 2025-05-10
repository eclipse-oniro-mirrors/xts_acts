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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import image from '@ohos.multimedia.image'
import { buildParagraph } from './utils';

export default function graphicTextHadTest() {

  describe('graphicTextHadTest', () => {
    

    let pixel:image.PixelMap;

    beforeAll(async ()=> {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 40000为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100//100为创建的PixelMap的宽高
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_050
     * @tc.name      : testParagraphStylePropertyFour
     * @tc.desc      : To test interface loadFontSync of FontCollection.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testParagraphStylePropertyFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = "====testParagraphStylePropertyFour===="
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
          textShadows : [myTextShadow],
          backgroundRect: myRectStyle,
          baselineShift: 20,
          fontFeatures: [myFontFeature]
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          align: 3,
          strutStyle: myStrutStyle,
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT,
          textDirection: text.TextDirection.RTL,
          wordBreak: text.WordBreak.NORMAL,
          maxLines: 20,
          breakStrategy: text.BreakStrategy.GREEDY
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
     * @tc.name      : testTextRunGetGlyphs
     * @tc.desc      : To test Run GetGlyphs interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextRunGetGlyphs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = '====testTextRunGetGlyphs====';
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.END,
      };
      try{
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        ParagraphGraphBuilder.addText("12366647854414655");
        let paragraph = ParagraphGraphBuilder.build();
        paragraph.layoutSync(100);
        console.info(msg + 'begin 4 ');
        let lines : Array<text.TextLine> = paragraph.getTextLines();
        console.info(msg + 'begin 5 ' + lines.length);
        let runs = lines[0].getGlyphRuns();
        let glyph = runs[0].getGlyphs();
        console.info(msg + ' glyph: ' + glyph);
        expect(true).assertTrue()
        done()
      }catch(err){
        console.info(msg + ' getGlyphs error ' + JSON.stringify(err));
        console.info(msg + ' getGlyphs error ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_070
     * @tc.name      : testTextRunGetPositions
     * @tc.desc      : To test Run GetPositions interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testTextRunGetPositions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = '====testTextRunGetPositions====';
      console.info(msg + 'begin');
      let myTextStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
        align: text.TextAlign.END,
      };
      try{
        let fontCollection = new text.FontCollection();
        let ParagraphGraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        ParagraphGraphBuilder.addText("12366647854414655");
        let paragraph = ParagraphGraphBuilder.build();
        paragraph.layoutSync(100);
        let lines : Array<text.TextLine> = paragraph.getTextLines();
        let runs = lines[0].getGlyphRuns();
        let positions = runs[0].getPositions();
        console.info(msg + ' positions: ' + positions);
        expect(true).assertTrue()
        done()
      }catch(err){
        console.info(msg + ' getPositions error ' + JSON.stringify(err));
        console.info(msg + ' getPositions error ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_080
     * @tc.name      : testGetSystemFontFullNamesByType
     * @tc.desc      : Returns the names of all fonts corresponding to the font type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSystemFontFullNamesByType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done:Function)=> {
      let msg = "====testGetSystemFontFullNamesByType===="
      console.info(msg + ' begin ');
      let fontType:text.SystemFontType = text.SystemFontType.GENERIC
      try{
        let promiseFontType = text.getSystemFontFullNamesByType(fontType)
        promiseFontType.then((data:Array<string>) => {
          console.info(msg + ` then font list size: ${data.length}`)
          console.info(msg + ' data[0] = ' + data[0])
          let promise = text.getFontDescriptorByFullName(data[0], fontType)
          promise.then((fontdecriptor: text.FontDescriptor) => {
            console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + JSON.stringify(fontdecriptor) )
            console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + fontdecriptor )
            console.info(msg + ` desc: ${JSON.stringify(fontdecriptor)}`)
            expect(fontdecriptor.postScriptName !== null).assertTrue()
            expect(fontdecriptor.fontFamily !== null).assertTrue()
            expect(fontdecriptor.fontSubfamily !== null).assertTrue()
            expect(fontdecriptor.weight !== null).assertTrue()
            expect(fontdecriptor.italic !== null).assertTrue()
            expect(fontdecriptor.monoSpace !== null).assertTrue()
            expect(fontdecriptor.symbolic !== null).assertTrue()
            done()
          }).catch((error: BusinessError) => {
            console.error(msg + ` Failed to get fontDescriptor by fullName, error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done()
          });
        }).catch((error: BusinessError) => {
          console.error(`Failed to get font fullNames by type, error: ${JSON.stringify(error)}`);
        });
      } catch(err){
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
  })
}