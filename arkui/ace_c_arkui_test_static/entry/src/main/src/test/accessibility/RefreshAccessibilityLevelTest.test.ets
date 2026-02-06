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

export default function refreshAccessibilityLevelTest() {

  describe('RefreshAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel001
     * @tc.name     testRefreshAccessibilityLevel001
     * @tc.desc     testRefreshAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel002
     * @tc.name     testRefreshAccessibilityLevel002
     * @tc.desc     testRefreshAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel003
     * @tc.name     testRefreshAccessibilityLevel003
     * @tc.desc     testRefreshAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel004
     * @tc.name     testRefreshAccessibilityLevel004
     * @tc.desc     testRefreshAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel005
     * @tc.name     testRefreshAccessibilityLevel005
     * @tc.desc     testRefreshAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityLevel006
     * @tc.name     testRefreshAccessibilityLevel006
     * @tc.desc     testRefreshAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
