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

export default function progressAccessibilityLevelTest() {

  describe('ProgressAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testProgressAccessibilityLevel001
     * @tc.name     testProgressAccessibilityLevel001
     * @tc.desc     testProgressAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityLevel002
     * @tc.name     testProgressAccessibilityLevel002
     * @tc.desc     testProgressAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityLevel003
     * @tc.name     testProgressAccessibilityLevel003
     * @tc.desc     testProgressAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityLevel004
     * @tc.name     testProgressAccessibilityLevel004
     * @tc.desc     testProgressAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityLevel005
     * @tc.name     testProgressAccessibilityLevel005
     * @tc.desc     testProgressAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityLevel006
     * @tc.name     testProgressAccessibilityLevel006
     * @tc.desc     testProgressAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
