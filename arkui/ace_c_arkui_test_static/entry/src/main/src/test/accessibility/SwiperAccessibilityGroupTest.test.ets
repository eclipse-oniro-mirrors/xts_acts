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

export default function swiperAccessibilityGroupTest() {

  describe('SwiperAccessibilityGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSwiperAccessibilityGroup001
     * @tc.name     testSwiperAccessibilityGroup001
     * @tc.desc     testSwiperAccessibilityGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityGroup002
     * @tc.name     testSwiperAccessibilityGroup002
     * @tc.desc     testSwiperAccessibilityGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityGroup003
     * @tc.name     testSwiperAccessibilityGroup003
     * @tc.desc     testSwiperAccessibilityGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSwiperAccessibilityGroup004
     * @tc.name     testSwiperAccessibilityGroup004
     * @tc.desc     testSwiperAccessibilityGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testSwiperAccessibilityGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperAccessibilityGroup004()).assertEqual(0)
      done()
    })
  })
}
