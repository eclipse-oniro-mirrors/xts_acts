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
     * @tc.name   testSetScaleX
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_002
     * @tc.desc   Lets you set the scale of the glyph object on the x axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScaleX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
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
     * @tc.name   testSetSkewX
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICDRAWINGFONT_JS_API_002
     * @tc.desc   Lets you set the skew scale of the glyph object on the x axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSkewX', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
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
    
  })
}