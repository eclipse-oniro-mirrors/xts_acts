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

export default function refreshAccessibilityGroupTest() {

  describe('RefreshAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRefreshAccessibilityGroup001
     * @tc.name     testRefreshAccessibilityGroup001
     * @tc.desc     testRefreshAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityGroup002
     * @tc.name     testRefreshAccessibilityGroup002
     * @tc.desc     testRefreshAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityGroup003
     * @tc.name     testRefreshAccessibilityGroup003
     * @tc.desc     testRefreshAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRefreshAccessibilityGroup004
     * @tc.name     testRefreshAccessibilityGroup004
     * @tc.desc     testRefreshAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
