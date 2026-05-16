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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';

export default function BrushPart2() {

  describe('BrushPart2', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100
     * @tc.desc   The brush getHexColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let msg = " ====testBrushGetHexColor==== "
      try {
        let color : common2D.Color = { alpha: 255, red: 255, green: 0, blue: 0 };
        let brush = new drawing.Brush();
        brush.setColor(color);
        let hex_color: number = brush.getHexColor();
        console.info(msg + ' brush.getHexColor:  ', hex_color.toString(16));
        console.info(msg + ' brush.getHexColor: ' + JSON.stringify(hex_color));
        done()
      } catch (err) {
        console.log(msg + " Failed in brush.getHexColor " + JSON.stringify(err))
        console.log(msg + " Failed in brush.getHexColor " + err)
        expect().assertFail()
        done()
      }
    })


  })
}
