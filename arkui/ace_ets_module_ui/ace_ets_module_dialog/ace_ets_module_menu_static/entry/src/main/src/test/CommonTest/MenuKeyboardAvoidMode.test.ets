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
import { MenuKeyboardAvoidMode } from '@ohos.arkui.component';

export default function MenuKeyboardAvoidModeTest() {
  describe('MenuKeyboardAvoidModeTest', () => {
    /**
     * @tc.number MenuKeyboardAvoidModeTest_001
     * @tc.name menuKeyboardAvoidModeNone
     * @tc.desc Test MenuKeyboardAvoidMode NONE enum value, verify NONE=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('menuKeyboardAvoidModeNone', Level.LEVEL1, (done: () => void) => {
      console.info('MenuKeyboardAvoidModeTest: menuKeyboardAvoidModeNone begin');
      expect(MenuKeyboardAvoidMode.NONE).assertEqual(0);
      console.info('MenuKeyboardAvoidModeTest: menuKeyboardAvoidModeNone end');
      done();
    });

    /**
     * @tc.number MenuKeyboardAvoidModeTest_002
     * @tc.name menuKeyboardAvoidModeTranslateAndResize
     * @tc.desc Test MenuKeyboardAvoidMode TRANSLATE_AND_RESIZE enum value, verify TRANSLATE_AND_RESIZE=1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('menuKeyboardAvoidModeTranslateAndResize', Level.LEVEL1, (done: () => void) => {
      console.info('MenuKeyboardAvoidModeTest: menuKeyboardAvoidModeTranslateAndResize begin');
      expect(MenuKeyboardAvoidMode.TRANSLATE_AND_RESIZE).assertEqual(1);
      console.info('MenuKeyboardAvoidModeTest: menuKeyboardAvoidModeTranslateAndResize end');
      done();
    });
  });
}
