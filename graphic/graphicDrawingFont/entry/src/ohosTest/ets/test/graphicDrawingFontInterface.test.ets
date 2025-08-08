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
import drawing from "@ohos.graphics.drawing"

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
        expect(true).assertTrue()
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
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in font.setSkewX " + JSON.stringify(err))
        console.log(msg + " Faild in font.setSkewX " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}