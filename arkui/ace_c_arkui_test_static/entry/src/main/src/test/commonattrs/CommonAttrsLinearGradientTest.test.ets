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

export default function commonAttrsLinearGradientTest() {

  describe('CommonAttrsLinearGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient001
     * @tc.name     testCommonAttrsLinearGradient001
     * @tc.desc     testCommonAttrsLinearGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient002
     * @tc.name     testCommonAttrsLinearGradient002
     * @tc.desc     testCommonAttrsLinearGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient003
     * @tc.name     testCommonAttrsLinearGradient003
     * @tc.desc     testCommonAttrsLinearGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient004
     * @tc.name     testCommonAttrsLinearGradient004
     * @tc.desc     testCommonAttrsLinearGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient005
     * @tc.name     testCommonAttrsLinearGradient005
     * @tc.desc     testCommonAttrsLinearGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient006
     * @tc.name     testCommonAttrsLinearGradient006
     * @tc.desc     testCommonAttrsLinearGradient006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient007
     * @tc.name     testCommonAttrsLinearGradient007
     * @tc.desc     testCommonAttrsLinearGradient007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient008
     * @tc.name     testCommonAttrsLinearGradient008
     * @tc.desc     testCommonAttrsLinearGradient008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient009
     * @tc.name     testCommonAttrsLinearGradient009
     * @tc.desc     testCommonAttrsLinearGradient009
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsLinearGradient010
     * @tc.name     testCommonAttrsLinearGradient010
     * @tc.desc     testCommonAttrsLinearGradient010
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsLinearGradient010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
