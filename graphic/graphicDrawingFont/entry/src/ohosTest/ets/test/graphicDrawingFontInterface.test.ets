/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import { common2D, drawing } from '@kit.ArkGraphics2D';

async function sleep(time: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export default function graphicDrawingFontInterfaceTest() {
  describe('graphicDrawingFontInterfaceTest', ()=> {
    console.log('describe graphicDrawingFontInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_001
     * @tc.name      : testFontMetricsFlags
     * @tc.desc      : Font Metric Flag Enumeration, used to indicate whether the data in each field in the font metric is valid.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testFontMetricsFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testFontMetricsFlags==== "
      try {
        console.info(msg + ' Succeeded in FontMetricsFlags.');
        expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID !== undefined).assertTrue()
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID: ' + drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID: ' + drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID: ' + drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID: ' + drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.BOUNDS_INVALID: ' + drawing.FontMetricsFlags.BOUNDS_INVALID);
        done()
      } catch (err) {
        console.log(msg + " Faild in createPixelMapSync " + JSON.stringify(err))
        console.log(msg + " Faild in createPixelMapSync " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_002
     * @tc.name      : testSetScaleX
     * @tc.desc      : Lets you set the scale of the glyph object on the x axis.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetScaleX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testSetScaleX==== "
      try {
        console.log(msg + " ready go ! ")
        let font = new drawing.Font();
        font.setSize(100);
        font.setScaleX(2);
        const textBlob = drawing.TextBlob.makeFromString("hello", font, drawing.TextEncoding.TEXT_ENCODING_UTF8)
        console.log(msg + " Succeed in font.setScaleX " + JSON.stringify(font))
        console.log(msg + " Succeed in font.setScaleX " + font)
        console.log(msg + " Succeed in font.setScaleX " + font.setScaleX)
        console.log(msg + " Succeed in font.setScaleX, textBlob: " + textBlob)
        done()
      } catch (err) {
        console.log(msg + " Faild in font.setScaleX " + JSON.stringify(err))
        console.log(msg + " Faild in font.setScaleX " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_002
     * @tc.name      : testSetSkewX
     * @tc.desc      : Lets you set the skew scale of the glyph object on the x axis.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSkewX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testSetSkewX==== "
      try {
        console.log(msg + " ready go ! ")
        let font = new drawing.Font();
        font.setSize(100);
        font.setSkewX(1);
        const textBlob = drawing.TextBlob.makeFromString("hello", font, drawing.TextEncoding.TEXT_ENCODING_UTF8)
        console.log(msg + " Succeed in font.setSkewX " + JSON.stringify(font))
        console.log(msg + " Succeed in font.setSkewX " + font)
        console.log(msg + " Succeed in font.setSkewX " + textBlob)
        done()
      } catch (err) {
        console.log(msg + " Faild in font.setSkewX " + JSON.stringify(err))
        console.log(msg + " Faild in font.setSkewX " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number     testPathIteratorNextRerurnValue
     * @tc.name       testPathIteratorNextRerurnValue
     * @tc.desc       test pathIterator next.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level1
     */
    it('testPathIteratorNextRerurnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorNextRerurnValue==== "
      try {
        let path: drawing.Path = new drawing.Path();
        path.moveTo(10, 20);
        path.lineTo(100, 200);
        path.quadTo(10, 15, 10, 10);
        path.conicTo(200, 400, 100, 200, 3);
        path.cubicTo(100, 100, 80, 150, 300, 150);
        path.close();
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let points: Array<common2D.Point> = [{x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 2}, {x: 3, y: 3}];
        let offset = 0;
        let verb1 = iter.next(points, offset);
        let verb2 = iter.next(points, offset);
        let verb3 = iter.next(points, offset);
        let verb4 = iter.next(points, offset);
        let verb5 = iter.next(points, offset);
        let verb6 = iter.next(points, offset);
        let verb7 = iter.next(points, offset);
        console.info('www data verb ', verb1, verb2, verb3, verb4, verb5, verb6, verb7);
        expect(verb1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(verb2).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(verb3).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(verb4).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(verb5).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(verb6).assertEqual(drawing.PathIteratorVerb.CLOSE);
        expect(verb7).assertEqual(drawing.PathIteratorVerb.DONE);
        done()
      } catch (err) {
        console.log(msg + " Faild in testPathIteratorNextRerurnValue " + JSON.stringify(err))
        console.log(msg + " Faild in testPathIteratorNextRerurnValue " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.number     testPathIteratorPeekReturnValue
     * @tc.name       testPathIteratorPeekReturnValue
     * @tc.desc       test pathIterator peek.
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level1
     */
    it('testPathIteratorPeekReturnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function)=> {
      let msg = " ====testPathIteratorPeekReturnValue==== "
      try {
        let path: drawing.Path = new drawing.Path();
        path.moveTo(10, 20);
        path.lineTo(100, 200);
        path.quadTo(10, 15, 10, 10);
        path.conicTo(200, 400, 100, 200, 3);
        path.cubicTo(100, 100, 80, 150, 300, 150);
        path.close();
        let iter: drawing.PathIterator = new drawing.PathIterator(path);
        let points: Array<common2D.Point> = [{x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 2}, {x: 3, y: 3}];
        let offset = 0;
        let peek1 = iter.peek();
        iter.next(points, offset);
        let peek2 = iter.peek();
        iter.next(points, offset);
        let peek3 = iter.peek();
        let hasNext1 = iter.hasNext();
        iter.next(points, offset);
        let peek4 = iter.peek();
        iter.next(points, offset);
        let peek5 = iter.peek();
        iter.next(points, offset);
        let peek6 = iter.peek();
        iter.next(points, offset);
        let peek7 = iter.peek();
        let hasNext2 = iter.hasNext();
        console.info('www data peek ', peek1, peek2, peek3, peek4, peek5, peek6, peek7);
        console.info('www data hasNext ', hasNext1, hasNext2);

        expect(peek1).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(peek2).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(peek3).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(peek4).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(peek5).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(peek6).assertEqual(drawing.PathIteratorVerb.CLOSE);
        expect(peek7).assertEqual(drawing.PathIteratorVerb.DONE);
        expect(hasNext1).assertEqual(true);
        expect(hasNext2).assertEqual(false);
        done()
      } catch (err) {
        console.log(msg + " Faild in testPathIteratorPeekReturnValue " + JSON.stringify(err))
        console.log(msg + " Faild in testPathIteratorPeekReturnValue " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}