/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * AnimationStopMode and AnimationOptions.stopMode (ohos.arkui.drawableDescriptor); AnimationOptionsLike mirrors optional stopMode.
 */
import { describe, it, expect, Level } from '@ohos/hypium';
import { AnimationStopMode } from '@ohos.arkui.drawableDescriptor';

interface AnimationOptionsLike {
  duration?: number;
  iterations?: number;
  frameDurations?: Array<number>;
  autoPlay?: boolean;
  stopMode?: AnimationStopMode;
}

export default function AnimationStopModeTest() {
  describe('AnimationStopModeTest', () => {
    /**
     * @tc.number   SUB_ArkUI_AnimationStopMode_First_Frame_0100
     * @tc.name     SUB_ArkUI_AnimationStopMode_First_Frame_0100
     * @tc.desc     drawableDescriptor AnimationStopMode.FIRST_FRAME equals 0
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_AnimationStopMode_First_Frame_0100', Level.LEVEL0, () => {
      expect(AnimationStopMode.FIRST_FRAME).assertEqual(0);
    });
    /**
     * @tc.number   SUB_ArkUI_AnimationStopMode_Last_Frame_0200
     * @tc.name     SUB_ArkUI_AnimationStopMode_Last_Frame_0200
     * @tc.desc     drawableDescriptor AnimationStopMode.LAST_FRAME equals 1
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_AnimationStopMode_Last_Frame_0200', Level.LEVEL0, () => {
      expect(AnimationStopMode.LAST_FRAME).assertEqual(1);
    });
    /**
     * @tc.number   SUB_ArkUI_AnimationOptions_StopMode_Field_0300
     * @tc.name     SUB_ArkUI_AnimationOptions_StopMode_Field_0300
     * @tc.desc     AnimationOptions-like object: read/write stopMode with FIRST_FRAME and LAST_FRAME values
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_AnimationOptions_StopMode_Field_0300', Level.LEVEL0, () => {
      let withFirst: AnimationOptionsLike = {
        duration: 100,
        stopMode: AnimationStopMode.FIRST_FRAME
      };
      expect(withFirst.stopMode).assertEqual(AnimationStopMode.FIRST_FRAME);
      expect(withFirst.stopMode).assertEqual(0);

      let withLast: AnimationOptionsLike = {
        iterations: 1,
        stopMode: AnimationStopMode.LAST_FRAME
      };
      expect(withLast.stopMode).assertEqual(AnimationStopMode.LAST_FRAME);
      expect(withLast.stopMode).assertEqual(1);
    });
  });
}
