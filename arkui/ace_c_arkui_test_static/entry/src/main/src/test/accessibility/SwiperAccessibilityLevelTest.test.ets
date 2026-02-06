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

export default function swiperAccessibilityLevelTest() {

  describe('SwiperAccessibilityLevelTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel001
     * @tc.name     testSwiperAccessibilityLevel001
     * @tc.desc     testSwiperAccessibilityLevel001
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel002
     * @tc.name     testSwiperAccessibilityLevel002
     * @tc.desc     testSwiperAccessibilityLevel002
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel003
     * @tc.name     testSwiperAccessibilityLevel003
     * @tc.desc     testSwiperAccessibilityLevel003
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel004
     * @tc.name     testSwiperAccessibilityLevel004
     * @tc.desc     testSwiperAccessibilityLevel004
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel005
     * @tc.name     testSwiperAccessibilityLevel005
     * @tc.desc     testSwiperAccessibilityLevel005
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityLevel006
     * @tc.name     testSwiperAccessibilityLevel006
     * @tc.desc     testSwiperAccessibilityLevel006
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityLevel006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityLevel006()).assertEqual(0)
      done()
    })
  })
}
