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

export default function textAccessibilityGroupTest() {

  describe('TextAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testTextAccessibilityGroup001
     * @tc.name     testTextAccessibilityGroup001
     * @tc.desc     testTextAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityGroup002
     * @tc.name     testTextAccessibilityGroup002
     * @tc.desc     testTextAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityGroup003
     * @tc.name     testTextAccessibilityGroup003
     * @tc.desc     testTextAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testTextAccessibilityGroup004
     * @tc.name     testTextAccessibilityGroup004
     * @tc.desc     testTextAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testTextAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testTextAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
