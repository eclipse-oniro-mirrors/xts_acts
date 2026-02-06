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

export default function buttonAccessibilityLevelTest() {

  describe('ButtonAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testButtonAccessibilityLevel001
     * @tc.name     testButtonAccessibilityLevel001
     * @tc.desc     testButtonAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testButtonAccessibilityLevel002
     * @tc.name     testButtonAccessibilityLevel002
     * @tc.desc     testButtonAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testButtonAccessibilityLevel003
     * @tc.name     testButtonAccessibilityLevel003
     * @tc.desc     testButtonAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testButtonAccessibilityLevel004
     * @tc.name     testButtonAccessibilityLevel004
     * @tc.desc     testButtonAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testButtonAccessibilityLevel005
     * @tc.name     testButtonAccessibilityLevel005
     * @tc.desc     testButtonAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testButtonAccessibilityLevel006
     * @tc.name     testButtonAccessibilityLevel006
     * @tc.desc     testButtonAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
