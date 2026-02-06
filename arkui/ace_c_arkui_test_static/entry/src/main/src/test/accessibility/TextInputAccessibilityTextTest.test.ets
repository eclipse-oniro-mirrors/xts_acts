'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function textInputAccessibilityTextTest() {

  describe('TextInputAccessibilityTextTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextInputAccessibilityText001
     * @tc.name     testTextInputAccessibilityText001
     * @tc.desc     testTextInputAccessibilityText001
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityText001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityText001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityText002
     * @tc.name     testTextInputAccessibilityText002
     * @tc.desc     testTextInputAccessibilityText002
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityText002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityText002()).assertEqual(0)
      done()
    })
  })
}
