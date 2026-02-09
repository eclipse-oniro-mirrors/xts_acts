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

export default function progressAccessibilityGroupTest() {

  describe('ProgressAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testProgressAccessibilityGroup001
     * @tc.name     testProgressAccessibilityGroup001
     * @tc.desc     testProgressAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityGroup002
     * @tc.name     testProgressAccessibilityGroup002
     * @tc.desc     testProgressAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityGroup003
     * @tc.name     testProgressAccessibilityGroup003
     * @tc.desc     testProgressAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testProgressAccessibilityGroup004
     * @tc.name     testProgressAccessibilityGroup004
     * @tc.desc     testProgressAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
