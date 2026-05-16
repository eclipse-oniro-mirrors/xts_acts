/*
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

'use static';

import { describe, it, expect, Level } from '../../../../hypium/index';
import { ArcSliderPosition } from '@ohos.arkui.advanced.ArcSlider';

export default function ArcSliderEnumTest() {
  describe('ArcSliderEnumTest', () => {
    /**
     * @tc.number ArcSliderEnumTest_001
     * @tc.name arcSliderPositionLeft
     * @tc.desc Test ArcSliderPosition LEFT enum value, verify LEFT=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcSliderPositionLeft', Level.LEVEL1, (done: () => void) => {
      console.info('ArcSliderEnumTest: arcSliderPositionLeft begin');
      expect(ArcSliderPosition.LEFT).assertEqual(0);
      console.info('ArcSliderEnumTest: arcSliderPositionLeft end');
      done();
    });
  });
}
