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

export default function listAccessibilityGroupTest() {

  describe('ListAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListAccessibilityGroup001
     * @tc.name     testListAccessibilityGroup001
     * @tc.desc     testListAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testListAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListAccessibilityGroup002
     * @tc.name     testListAccessibilityGroup002
     * @tc.desc     testListAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testListAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListAccessibilityGroup003
     * @tc.name     testListAccessibilityGroup003
     * @tc.desc     testListAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testListAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListAccessibilityGroup004
     * @tc.name     testListAccessibilityGroup004
     * @tc.desc     testListAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testListAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
