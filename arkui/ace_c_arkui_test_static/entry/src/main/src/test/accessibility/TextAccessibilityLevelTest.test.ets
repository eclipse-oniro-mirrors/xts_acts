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

export default function textAccessibilityLevelTest() {

  describe('TextAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextAccessibilityLevel001
     * @tc.name     testTextAccessibilityLevel001
     * @tc.desc     testTextAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityLevel002
     * @tc.name     testTextAccessibilityLevel002
     * @tc.desc     testTextAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityLevel003
     * @tc.name     testTextAccessibilityLevel003
     * @tc.desc     testTextAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityLevel004
     * @tc.name     testTextAccessibilityLevel004
     * @tc.desc     testTextAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityLevel005
     * @tc.name     testTextAccessibilityLevel005
     * @tc.desc     testTextAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityLevel006
     * @tc.name     testTextAccessibilityLevel006
     * @tc.desc     testTextAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
