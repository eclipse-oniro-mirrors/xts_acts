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

export default function customComponentAccessibilityGroupTest() {

  describe('CustomComponentAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentAccessibilityGroup001
     * @tc.name     testCustomComponentAccessibilityGroup001
     * @tc.desc     testCustomComponentAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAccessibilityGroup002
     * @tc.name     testCustomComponentAccessibilityGroup002
     * @tc.desc     testCustomComponentAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAccessibilityGroup003
     * @tc.name     testCustomComponentAccessibilityGroup003
     * @tc.desc     testCustomComponentAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAccessibilityGroup004
     * @tc.name     testCustomComponentAccessibilityGroup004
     * @tc.desc     testCustomComponentAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
