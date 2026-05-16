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

export default function graphicTextCTest() {

  describe('graphicTextC_test', () => {
    beforeAll(() => {
    })
    
    /**
     * @tc.name   testGetSystemFontFullNamesByType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_065
     * @tc.desc   Returns the names of all fonts corresponding to the font type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSystemFontFullNamesByType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "====testGetSystemFontFullNamesByType===="
      console.info(msg + ' begin ');
      try{
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC
        let promise = text.getSystemFontFullNamesByType(fontType)
        promise.then((data) => {
          console.log(msg + ' Succeed in text.getSystemFontFullNamesByType  ' + JSON.stringify(data) )
          console.log(msg + ' Succeed in text.getSystemFontFullNamesByType  ' + data )
          console.info(msg + ` then font list size: ${data.length}`)
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to get font fullNames by type, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.getSystemFontFullNamesByType.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
    
    /**
     * @tc.name   testGetFontDescriptorByFullName
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_066
     * @tc.desc   Obtain the corresponding font descriptor based on the font name and font type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetFontDescriptorByFullName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testGetFontDescriptorByFullName===="
      console.info(msg + ' begin ');
      try{
        let fontType:text.SystemFontType = text.SystemFontType.GENERIC
        let promise = text.getFontDescriptorByFullName("Noto Sans Pau Cin Hau Regular", fontType)
        promise.then((fontdecriptor) => {
          console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + JSON.stringify(fontdecriptor) )
          console.log(msg + ' Succeed in text.getFontDescriptorByFullName  ' + fontdecriptor )
          console.info(msg + ` desc: ${JSON.stringify(fontdecriptor)}`)
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to get fontDescriptor by fullName, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.getFontDescriptorByFullName.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.getFontDescriptorByFullName.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })
    
    /**
     * @tc.name   testMatchFontDescriptors
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_067
     * @tc.desc   Returns all system font descriptors that meet requirements based on the specified font descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMatchFontDescriptors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testMatchFontDescriptors===="
      console.info(msg + ' begin ');
      try{
        let promise = text.matchFontDescriptors({
          weight: text.FontWeight.W400,
        })
        promise.then((data) => {
          console.info(msg + ` Font descriptor array size: ${data.length}`);
          console.info(msg + ` Font descriptor result: ${JSON.stringify(data)}`)
          done()
        }).catch((error: BusinessError) => {
          console.error(msg + ` Failed to match the font descriptor, error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done()
        });
      } catch(err){
        console.info(msg + ' Failed in text.matchFontDescriptors.  Cause: ' + JSON.stringify(err));
        console.info(msg + ' Failed in text.matchFontDescriptors.  Cause: ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testWordBreak
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_068
     * @tc.desc   Enumeration of the word breaking policy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWordBreak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testWordBreak===="
      console.info(msg + ' begin ');
      try {
        console.info(msg + ' Succeeded in SystemFontType.');
        expect(text.WordBreak.BREAK_HYPHEN == 3).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in text.WordBreak " + JSON.stringify(err))
        console.log(msg + " Faild in text.WordBreak " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testWordBreak_write
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_069
     * @tc.desc   Enumeration of the word breaking policy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWordBreak_write', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "testWordBreak_write"
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
          wordBreak: text.WordBreak.BREAK_HYPHEN
        };
        try {
          let fontCollection = text.FontCollection.getGlobalInstance();
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let paragraphGraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
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
     * @tc.name   testSystemFontType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_070
     * @tc.desc   Enumeration of font types, which can be combined through bit or operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSystemFontType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function)=> {
      let msg = "====testSystemFontType===="
      console.info(msg + ' begin ');
      try {
        console.info(msg + ' Succeeded in SystemFontType.');
        console.info(msg + ' text.SystemFontType.ALL: ' + text.SystemFontType.ALL);
        console.info(msg + ' text.SystemFontType.GENERIC: ' + text.SystemFontType.GENERIC);
        console.info(msg + ' text.SystemFontType.STYLISH: ' + text.SystemFontType.STYLISH);
        console.info(msg + ' text.SystemFontType.INSTALLED: ' + text.SystemFontType.INSTALLED);
        console.info(msg + ' text.SystemFontType.CUSTOMIZED: ' + text.SystemFontType.CUSTOMIZED);
        expect(text.SystemFontType.ALL == 1).assertTrue()
        expect(text.SystemFontType.GENERIC == 2).assertTrue()
        expect(text.SystemFontType.STYLISH == 4).assertTrue()
        expect(text.SystemFontType.INSTALLED == 8).assertTrue()
        expect(text.SystemFontType.CUSTOMIZED == 16).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in text.SystemFontType " + JSON.stringify(err))
        console.log(msg + " Faild in text.SystemFontType " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testStrutStyle
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_071
     * @tc.desc   To test interface loadFontSync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrutStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testStrutStyle===="
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
        fontFamilies: ["Clock_01"],
        fontStyle: 0,
        fontWidth: text.FontWidth.CONDENSED,
        fontWeight: 0,
        fontSize: 16,
        height: 1,
        leading: -1,
        forceHeight: true,
        enabled: false,
        heightOverride: true,
        halfLeading: false
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
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT
        };
        try {
          let fontCollection = new text.FontCollection;
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let paragraphGraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
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
        console.info(msg + 'test TextStyle error ' + err);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testFontDescriptor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_072
     * @tc.desc   To test interface matchFontDescriptors of text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontDescriptor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "====testFontDescriptor===="
      console.info(msg + ' begin');
      try {
        let myFontDescriptor: text.FontDescriptor = {
          path: "",
          postScriptName: "",
          fullName: "",
          fontFamily: "",
          fontSubfamily: "",
          weight: 0,
          width: 0,
          italic: 0,
          monoSpace: true,
          symbolic: true
        }
        let promise = text.matchFontDescriptors({})
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get all desc failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testParagraphLayoutErrorCode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_073
     * @tc.desc   Perform typesetting and calculate the position of all glyphs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParagraphLayoutErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testParagraphLayoutErrorCode===="
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
        fontFamilies: ["Clock_01"],
        fontStyle: 0,
        fontWidth: text.FontWidth.CONDENSED,
        fontWeight: 0,
        fontSize: 16,
        height: 1,
        leading: -1,
        forceHeight: true,
        enabled: false,
        heightOverride: true,
        halfLeading: false
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
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT
        };
        try {
          let fontCollection = new text.FontCollection;
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let paragraphGraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            paragraphGraphBuilder.addText("test");
            let paragraph: text.Paragraph = paragraphGraphBuilder.build();
            paragraph.layout(-1).then((data) => {
              console.info(`Succeeded in doing layout,  ${JSON.stringify(data)}`);
              console.log(msg + ' error in paragraph.layout(-1)')
              expect().assertFail();
              done()
            }).catch((error: BusinessError) => {
              if(error.code == 401){
                console.log(msg + ' Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. ')
                console.log(msg + ' Case End Successfully')
                done()
              }else{
                console.error(`Failed to do layout, error: ${JSON.stringify(error)} message: ${error.message}`);
                expect().assertFail();
                done()
              }
            });
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
     * @tc.name   testGetLineBreakErrorCode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_074
     * @tc.desc   Perform typesetting and calculate the position of all glyphs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLineBreakErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testGetLineBreakErrorCode===="
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
        fontFamilies: ["Clock_01"],
        fontStyle: 0,
        fontWidth: text.FontWidth.CONDENSED,
        fontWeight: 0,
        fontSize: 16,
        height: 1,
        leading: -1,
        forceHeight: true,
        enabled: false,
        heightOverride: true,
        halfLeading: false
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
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT
        };
        try {
          let fontCollection = new text.FontCollection;
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let paragraphGraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            paragraphGraphBuilder.addText("123456789");
            let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
            let startIndex = -1;
            let width = 100.0;
            try{
              let count = lineTypeset.getLineBreak(startIndex, width);
              console.log(msg + ' error in lineTypeset.getLineBreak(-1, width)')
              expect().assertFail();
              done()
            }catch(error){
              if(error.code == 401){
                console.log(msg + ' Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. ')
                console.log(msg + ' Case End Successfully')
                done()
              }else{
                console.error(`Failed to do getLineBreak, error: ${JSON.stringify(error)} message: ${error.message}`);
                expect().assertFail();
                done()
              }
            }
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
     * @tc.name   testCreateLineErrorCode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_075
     * @tc.desc   Perform typesetting and calculate the position of all glyphs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateLineErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "====testCreateLineErrorCode===="
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
        fontFamilies: ["Clock_01"],
        fontStyle: 0,
        fontWidth: text.FontWidth.CONDENSED,
        fontWeight: 0,
        fontSize: 16,
        height: 1,
        leading: -1,
        forceHeight: true,
        enabled: false,
        heightOverride: true,
        halfLeading: false
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
          textHeightBehavior: text.TextHeightBehavior.DISABLE_FIRST_ASCENT
        };
        try {
          let fontCollection = new text.FontCollection;
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + JSON.stringify(fontCollection) )
          console.log(msg + ' text.FontCollection.getGlobalInstance OK, fontCollection is  ' + fontCollection )
          try {
            let paragraphGraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
            paragraphGraphBuilder.addText("123456789");
            let lineTypeset = paragraphGraphBuilder.buildLineTypeset();
            let startIndex = -1;
            let width = 100.0;
            try{
              let count = lineTypeset.getLineBreak(0, width);
              let line : text.TextLine = lineTypeset.createLine(startIndex, count);
              console.log(msg + ' error in lineTypeset.createLine(-1, width)')
              expect().assertFail();
              done()
            }catch(error){
              if(error.code == 401){
                console.log(msg + ' Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types. ')
                console.log(msg + ' Case End Successfully')
                done()
              }else{
                console.error(`Failed to do createLine, error: ${JSON.stringify(error)} message: ${error.message}`);
                expect().assertFail();
                done()
              }
            }
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
