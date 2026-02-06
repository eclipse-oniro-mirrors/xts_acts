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
import drawing from "@ohos.graphics.drawing"
import image from "@ohos.multimedia.image"

export default function graphicTextA1Test() {

  describe('graphicTextA1_test', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   testLoadFontSync_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_LOADFONTSYNC_API_010
     * @tc.desc   To test interface loadFontAsync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "testLoadFontSync_0100";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        fontCollection.loadFontSync('', $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFontSync 111');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        fontCollection.loadFontSync(null, $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFontSync 222');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 222', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        fontCollection.loadFontSync(undefined, $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFontSync 333');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 333', JSON.stringify(err));
        expect().assertFail();
      }
      
      try {
        fontCollection.unloadFontSync('');
        console.info(msg + 'www data success unloadFontSync 111');
      } catch (err) {
        console.info(msg + 'www data failed to unloadFontSync 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        fontCollection.unloadFontSync(null);
        console.info(msg + 'www data success unloadFontSync 111');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to unloadFontSync 222', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      try {
        fontCollection.unloadFontSync(undefined);
        console.info(msg + 'www data success unloadFontSync 111');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to unloadFontSync 333', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSync_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_LOADFONTSYNC_API_020
     * @tc.desc   To test interface loadFontAsync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "testLoadFontSync_0200";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        fontCollection.loadFontSync('fontFamily_01', null);
        console.info(msg + 'www data success loadFontSync 111');
        fontCollection.unloadFontSync('fontFamily_01');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        fontCollection.loadFontSync('fontFamily_02', undefined);
        console.info(msg + 'www data success loadFontSync 222');
        fontCollection.unloadFontSync('fontFamily_02');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 222', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        fontCollection.loadFontSync('fontFamily_03', $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFontSync 333');
        fontCollection.unloadFontSync('fontFamily_03');
      } catch (err) {
        console.info(msg + 'www data failed to loadFontSync 333', JSON.stringify(err));
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFont_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_LOADFONTSYNC_API_030
     * @tc.desc   To test interface loadFontAsync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFont_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "testLoadFont_0100";
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        await fontCollection.loadFont('', $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFont 111');
      } catch (err) {
        console.info(msg + 'www data failed to loadFont 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        await fontCollection.loadFont(null, $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFont 222');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to loadFont 222', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      try {
        await fontCollection.loadFont(undefined, $rawfile('test.ttf'));
        console.info(msg + 'www data success loadFont 333');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to loadFont 333', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      
      try {
        await fontCollection.unloadFont('');
        console.info(msg + 'www data success unloadFont 111');
      } catch (err) {
        console.info(msg + 'www data failed to unloadFont 333', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        await fontCollection.unloadFont(null);
        console.info(msg + 'www data success unloadFont 111');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to unloadFont 333', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      try {
        await fontCollection.unloadFont(undefined);
        console.info(msg + 'www data success unloadFont 111');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to unloadFont 333', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLayoutSync_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_LAYOUTSYNC_API_020
     * @tc.desc   To test interface loadFontAsync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLayoutSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "testLayoutSync_0100";
      let textStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle: textStyle,
      };
      let fontCollection: text.FontCollection = new text.FontCollection();
      let paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      paragraphBuilder.addText("123456789");
      let paragraph = paragraphBuilder.build();
      try {
        paragraph.layoutSync(200);
        console.info(msg + 'www data success layoutSync 111');
      } catch (err) {
        console.info(msg + 'www data failed to layoutSync 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraph.layoutSync(null);
        console.info(msg + 'www data success layoutSync 222');
      } catch (err) {
        console.info(msg + 'www data failed to layoutSync 222', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        paragraph.layoutSync(undefined);
        console.info(msg + 'www data success layoutSync 333');
      } catch (err) {
        console.info(msg + 'www data failed to layoutSync 333', JSON.stringify(err));
        expect().assertFail();
      }

      try {
        await paragraph.layout(200);
        console.info(msg + 'www data success layout 111');
      } catch (err) {
        console.info(msg + 'www data failed to layout 111', JSON.stringify(err));
        expect().assertFail();
      }
      try {
        await paragraph.layout(null);
        console.info(msg + 'www data success layout 222');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to layout 222', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      try {
        await paragraph.layout(undefined);
        console.info(msg + 'www data success layout 333');
        expect().assertFail();
      } catch (err) {
        console.info(msg + 'www data failed to layout 333', JSON.stringify(err));
        expect(Number(err.code) == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testPaint_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_PAINT_API_010
     * @tc.desc   To test interface paint of paragraph.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPaint_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
      let msg = "testPaint_0100";
      let textStyle: text.TextStyle = {
        color: { alpha: 255, red: 255, green: 0, blue: 0 },
        fontSize: 33,
      };
      let paragraphStyle: text.ParagraphStyle = {
        textStyle: textStyle,
      };
      let fontCollection: text.FontCollection = new text.FontCollection();
      let paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
      paragraphBuilder.addText("123456789");
      let paragraph = paragraphBuilder.build();
      const color: ArrayBuffer = new ArrayBuffer(160000);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 200, width: 200 } };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let canvas = new drawing.Canvas(pixelMap);
      try {
        paragraph.paint(canvas, null, 0);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      try {
        paragraph.paint(canvas, undefined, 0);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      try {
        paragraph.paint(canvas, 0, null);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      try {
        paragraph.paint(canvas, 0, undefined);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      try {
        paragraph.paint(null, 0, 0);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      try {
        paragraph.paint(undefined, 0, 0);
        console.info(msg + 'www data success paint 111');
      } catch(err) {
        console.info(msg + 'www data failed to paint 111', JSON.stringify(err));
      }
      done();
    })

  })
}