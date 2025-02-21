/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import nativeDisplaySoloistNdk from 'libnativeDisplaySoloistNdk.so';

export default function displaySoloistTest() {
  describe('DisplaySoloistTest', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistCreate001
     * @tc.name       : testOHDisplaySoloistCreate001
     * @tc.desc       : test OH_Display_Soloist_Create_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistCreate001', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistCreate001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistStart001
     * @tc.name       : testOHDisplaySoloistStart001
     * @tc.desc       : test OH_Display_Soloist_Start_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistStart001', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistStart001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistStart002
     * @tc.name       : testOHDisplaySoloistStart002
     * @tc.desc       : test OH_Display_Soloist_Start_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistStart002', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistStart002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistSetExpectedFrameRateRange001
     * @tc.name       : testOHDisplaySoloistSetExpectedFrameRateRange001
     * @tc.desc       : test OH_Display_Soloist_Set_Expected_Frame_Rate_Range001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistSetExpectedFrameRateRange001', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistSetExpectedFrameRateRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistSetExpectedFrameRateRange002
     * @tc.name       : testOHDisplaySoloistSetExpectedFrameRateRange002
     * @tc.desc       : test OH_Display_Soloist_Set_Expected_Frame_Rate_Range002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistSetExpectedFrameRateRange002', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistSetExpectedFrameRateRange002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistSetExpectedFrameRateRange003
     * @tc.name       : testOHDisplaySoloistSetExpectedFrameRateRange003
     * @tc.desc       : test OH_Display_Soloist_Set_Expected_Frame_Rate_Range003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistSetExpectedFrameRateRange003', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistSetExpectedFrameRateRange003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistStop001
     * @tc.name       : testOHDisplaySoloistStop001
     * @tc.desc       : test OH_Display_Soloist_Stop001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistStop001', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistStop001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistStop002
     * @tc.name       : testOHDisplaySoloistStop002
     * @tc.desc       : test OH_Display_Soloist_Stop002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistStop002', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistStop002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistDestroy001
     * @tc.name       : testOHDisplaySoloistDestroy001
     * @tc.desc       : test OH_Display_Soloist_Destroy001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistDestroy001', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistDestroy001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_DISPLAY_MANAGER_OH_DisplaySoloistDestroy002
     * @tc.name       : testOHDisplaySoloistDestroy002
     * @tc.desc       : test OH_Display_Soloist_Destroy002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDisplaySoloistDestroy002', 0, async (done: Function) => {
      let result: number = nativeDisplaySoloistNdk.oHDisplaySoloistDestroy002();
      expect(result).assertEqual(0);
      done();
    });
  })
}