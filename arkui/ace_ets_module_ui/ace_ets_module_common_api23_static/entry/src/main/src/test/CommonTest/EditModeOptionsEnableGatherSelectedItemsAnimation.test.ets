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
import { EditModeOptions } from '@ohos.arkui.component';

export default function EditModeOptionsEnableGatherSelectedItemsAnimationTest() {
  describe('EditModeOptionsEnableGatherSelectedItemsAnimationTest', () => {
    /**
     * @tc.number EditModeOptionsEnableGatherSelectedItemsAnimationTest_001
     * @tc.name editModeOptionsEnableGatherSelectedItemsAnimationTrue
     * @tc.desc Test EditModeOptions.enableGatherSelectedItemsAnimation property with true value
     *          common.d.ets EditModeOptions.enableGatherSelectedItemsAnimation?: boolean;
     *          Verify that enableGatherSelectedItemsAnimation can be set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsEnableGatherSelectedItemsAnimationTrue', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationTrue begin');
      
      let options: EditModeOptions = {
        enableGatherSelectedItemsAnimation: true
      };
      
      console.info('EditModeOptions enableGatherSelectedItemsAnimation=true: ' + options.enableGatherSelectedItemsAnimation);
      console.info('enableGatherSelectedItemsAnimation true type: ' + typeof options.enableGatherSelectedItemsAnimation);
      expect(options.enableGatherSelectedItemsAnimation).assertEqual(true);
      console.info('enableGatherSelectedItemsAnimation true value verification passed');
      
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationTrue end');
      done();
    });

    /**
     * @tc.number EditModeOptionsEnableGatherSelectedItemsAnimationTest_002
     * @tc.name editModeOptionsEnableGatherSelectedItemsAnimationFalse
     * @tc.desc Test EditModeOptions.enableGatherSelectedItemsAnimation property with false value
     *          common.d.ets EditModeOptions.enableGatherSelectedItemsAnimation?: boolean;
     *          Verify that enableGatherSelectedItemsAnimation can be set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsEnableGatherSelectedItemsAnimationFalse', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationFalse begin');
      
      let options: EditModeOptions = {
        enableGatherSelectedItemsAnimation: false
      };
      
      console.info('EditModeOptions enableGatherSelectedItemsAnimation=false: ' + options.enableGatherSelectedItemsAnimation);
      console.info('enableGatherSelectedItemsAnimation false type: ' + typeof options.enableGatherSelectedItemsAnimation);
      expect(options.enableGatherSelectedItemsAnimation).assertEqual(false);
      console.info('enableGatherSelectedItemsAnimation false value verification passed');
      
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationFalse end');
      done();
    });

    /**
     * @tc.number EditModeOptionsEnableGatherSelectedItemsAnimationTest_003
     * @tc.name editModeOptionsEnableGatherSelectedItemsAnimationUndefined
     * @tc.desc Test EditModeOptions.enableGatherSelectedItemsAnimation property with undefined value
     *          common.d.ets EditModeOptions.enableGatherSelectedItemsAnimation?: boolean;
     *          Verify that enableGatherSelectedItemsAnimation can be undefined (optional property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsEnableGatherSelectedItemsAnimationUndefined', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationUndefined begin');
      
      let options: EditModeOptions = {};
      
      console.info('EditModeOptions enableGatherSelectedItemsAnimation=unset: ' + options.enableGatherSelectedItemsAnimation);
      console.info('enableGatherSelectedItemsAnimation undefined type: ' + typeof options.enableGatherSelectedItemsAnimation);
      expect(options.enableGatherSelectedItemsAnimation == undefined).assertEqual(true);
      console.info('enableGatherSelectedItemsAnimation undefined verification passed');
      
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationUndefined end');
      done();
    });

    /**
     * @tc.number EditModeOptionsEnableGatherSelectedItemsAnimationTest_004
     * @tc.name editModeOptionsEnableGatherSelectedItemsAnimationToggle
     * @tc.desc Test EditModeOptions.enableGatherSelectedItemsAnimation property value toggle
     *          common.d.ets EditModeOptions.enableGatherSelectedItemsAnimation?: boolean;
     *          Verify that enableGatherSelectedItemsAnimation can be changed from true to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('editModeOptionsEnableGatherSelectedItemsAnimationToggle', Level.LEVEL1, (done: () => void) => {
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationToggle begin');
      
      let options: EditModeOptions = {
        enableGatherSelectedItemsAnimation: true
      };
      
      // Verify initial value
      expect(options.enableGatherSelectedItemsAnimation).assertEqual(true);
      console.info('Initial enableGatherSelectedItemsAnimation: ' + options.enableGatherSelectedItemsAnimation);
      
      // Change to false
      options.enableGatherSelectedItemsAnimation = false;
      expect(options.enableGatherSelectedItemsAnimation).assertEqual(false);
      console.info('Changed enableGatherSelectedItemsAnimation: ' + options.enableGatherSelectedItemsAnimation);
      
      console.info('EditModeOptionsEnableGatherSelectedItemsAnimationTest: enableGatherSelectedItemsAnimationToggle end');
      done();
    });
  });
}