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
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';

export default function FontPart4() {

  describe('FontPart4', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100==== "
      try {
        console.info(msg + ' Succeeded in FontMetricsFlags.');
        expect(drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID !== undefined).assertTrue()
        expect(drawing.FontMetricsFlags.BOUNDS_INVALID !== undefined).assertTrue()
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID: '
          + drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID: '
          + drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID: '
          + drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID: '
          + drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID);
        console.info(msg + ' drawing.FontMetricsFlags.BOUNDS_INVALID: '
          + drawing.FontMetricsFlags.BOUNDS_INVALID);
        done()
      } catch (err) {
        console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100 "
          + JSON.stringify(err))
        console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0100 " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200
     * @tc.desc   test for FontMetricsFlags EnumValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        let msg = " ====SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200==== "
        try {
          let font = new drawing.Font();
          let fontMetrics = font.getMetrics() as drawing.FontMetrics;
          console.info(msg + ' ' + fontMetrics.maxCharWidth);
          console.info(msg + ' ' + fontMetrics.flags);
          expect(fontMetrics.maxCharWidth != undefined).assertTrue();
          expect(fontMetrics.flags != undefined).assertTrue();
          done()
        } catch (err) {
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200 "
            + JSON.stringify(err))
          console.log(msg + " Failed in SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_ENUM_STATIC_0200 " + err)
          expect().assertFail()
          done()
        }
      })

  })
}
