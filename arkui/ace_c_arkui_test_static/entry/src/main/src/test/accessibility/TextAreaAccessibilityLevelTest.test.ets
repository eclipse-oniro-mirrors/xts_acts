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

export default function textAreaAccessibilityLevelTest() {

  describe('TextAreaAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel001
     * @tc.name     testTextAreaAccessibilityLevel001
     * @tc.desc     testTextAreaAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel002
     * @tc.name     testTextAreaAccessibilityLevel002
     * @tc.desc     testTextAreaAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel003
     * @tc.name     testTextAreaAccessibilityLevel003
     * @tc.desc     testTextAreaAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel004
     * @tc.name     testTextAreaAccessibilityLevel004
     * @tc.desc     testTextAreaAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel005
     * @tc.name     testTextAreaAccessibilityLevel005
     * @tc.desc     testTextAreaAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAreaAccessibilityLevel006
     * @tc.name     testTextAreaAccessibilityLevel006
     * @tc.desc     testTextAreaAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAreaAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
