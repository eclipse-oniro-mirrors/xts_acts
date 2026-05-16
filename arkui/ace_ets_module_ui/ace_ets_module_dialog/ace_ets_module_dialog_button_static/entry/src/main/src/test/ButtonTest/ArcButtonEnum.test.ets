/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, Level } from '../../../../hypium/index';
import { ArcButtonPosition, ArcButtonStyleMode, ArcButtonStatus } from '@ohos.arkui.advanced.ArcButton';

export default function ArcButtonEnumTest() {
  describe('ArcButtonEnumTest', () => {
    /**
     * @tc.number ArcButtonEnumTest_001
     * @tc.name arcButtonPositionBottomEdge
     * @tc.desc Test ArcButtonPosition BOTTOM_EDGE enum value, verify BOTTOM_EDGE=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonPositionBottomEdge', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonPositionBottomEdge begin');
      expect(ArcButtonPosition.BOTTOM_EDGE).assertEqual(1);
      console.info('ArcButtonEnumTest: arcButtonPositionBottomEdge end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_002
     * @tc.name arcButtonStyleModeEmphasizedLight
     * @tc.desc Test ArcButtonStyleMode EMPHASIZED_LIGHT enum value, verify EMPHASIZED_LIGHT=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStyleModeEmphasizedLight', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStyleModeEmphasizedLight begin');
      expect(ArcButtonStyleMode.EMPHASIZED_LIGHT).assertEqual(0);
      console.info('ArcButtonEnumTest: arcButtonStyleModeEmphasizedLight end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_003
     * @tc.name arcButtonStyleModeEmphasizedDark
     * @tc.desc Test ArcButtonStyleMode EMPHASIZED_DARK enum value, verify EMPHASIZED_DARK=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStyleModeEmphasizedDark', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStyleModeEmphasizedDark begin');
      expect(ArcButtonStyleMode.EMPHASIZED_DARK).assertEqual(1);
      console.info('ArcButtonEnumTest: arcButtonStyleModeEmphasizedDark end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_004
     * @tc.name arcButtonStyleModeNormalLight
     * @tc.desc Test ArcButtonStyleMode NORMAL_LIGHT enum value, verify NORMAL_LIGHT=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStyleModeNormalLight', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStyleModeNormalLight begin');
      expect(ArcButtonStyleMode.NORMAL_LIGHT).assertEqual(2);
      console.info('ArcButtonEnumTest: arcButtonStyleModeNormalLight end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_005
     * @tc.name arcButtonStyleModeNormalDark
     * @tc.desc Test ArcButtonStyleMode NORMAL_DARK enum value, verify NORMAL_DARK=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStyleModeNormalDark', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStyleModeNormalDark begin');
      expect(ArcButtonStyleMode.NORMAL_DARK).assertEqual(3);
      console.info('ArcButtonEnumTest: arcButtonStyleModeNormalDark end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_006
     * @tc.name arcButtonStatusPressed
     * @tc.desc Test ArcButtonStatus PRESSED enum value, verify PRESSED=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStatusPressed', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStatusPressed begin');
      expect(ArcButtonStatus.PRESSED).assertEqual(1);
      console.info('ArcButtonEnumTest: arcButtonStatusPressed end');
      done();
    });

    /**
     * @tc.number ArcButtonEnumTest_007
     * @tc.name arcButtonStatusDisabled
     * @tc.desc Test ArcButtonStatus DISABLED enum value, verify DISABLED=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('arcButtonStatusDisabled', Level.LEVEL1, (done: () => void) => {
      console.info('ArcButtonEnumTest: arcButtonStatusDisabled begin');
      expect(ArcButtonStatus.DISABLED).assertEqual(2);
      console.info('ArcButtonEnumTest: arcButtonStatusDisabled end');
      done();
    });
  });
}
