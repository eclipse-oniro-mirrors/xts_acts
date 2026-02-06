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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsRadialGradientTest() {

  describe('CommonAttrsRadialGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsRadialGradient001
     * @tc.name     testCommonAttrsRadialGradient001
     * @tc.desc     testCommonAttrsRadialGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRadialGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRadialGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRadialGradient002
     * @tc.name     testCommonAttrsRadialGradient002
     * @tc.desc     testCommonAttrsRadialGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRadialGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRadialGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRadialGradient003
     * @tc.name     testCommonAttrsRadialGradient003
     * @tc.desc     testCommonAttrsRadialGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRadialGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRadialGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRadialGradient004
     * @tc.name     testCommonAttrsRadialGradient004
     * @tc.desc     testCommonAttrsRadialGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRadialGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRadialGradient004()).assertEqual(0)
      done()
    })
  })
}
