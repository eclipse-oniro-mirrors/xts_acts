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

export default function textInputAccessibilityLevelTest() {

  describe('TextInputAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel001
     * @tc.name     testTextInputAccessibilityLevel001
     * @tc.desc     testTextInputAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel002
     * @tc.name     testTextInputAccessibilityLevel002
     * @tc.desc     testTextInputAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel003
     * @tc.name     testTextInputAccessibilityLevel003
     * @tc.desc     testTextInputAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel004
     * @tc.name     testTextInputAccessibilityLevel004
     * @tc.desc     testTextInputAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel005
     * @tc.name     testTextInputAccessibilityLevel005
     * @tc.desc     testTextInputAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextInputAccessibilityLevel006
     * @tc.name     testTextInputAccessibilityLevel006
     * @tc.desc     testTextInputAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testTextInputAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextInputAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
