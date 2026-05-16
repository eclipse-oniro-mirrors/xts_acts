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

export default function customComponentLinearGradientTest() {

  describe('CustomComponentLinearGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentLinearGradient001
     * @tc.name     testCustomComponentLinearGradient001
     * @tc.desc     testCustomComponentLinearGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient002
     * @tc.name     testCustomComponentLinearGradient002
     * @tc.desc     testCustomComponentLinearGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient003
     * @tc.name     testCustomComponentLinearGradient003
     * @tc.desc     testCustomComponentLinearGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient004
     * @tc.name     testCustomComponentLinearGradient004
     * @tc.desc     testCustomComponentLinearGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient005
     * @tc.name     testCustomComponentLinearGradient005
     * @tc.desc     testCustomComponentLinearGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient006
     * @tc.name     testCustomComponentLinearGradient006
     * @tc.desc     testCustomComponentLinearGradient006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient007
     * @tc.name     testCustomComponentLinearGradient007
     * @tc.desc     testCustomComponentLinearGradient007
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient008
     * @tc.name     testCustomComponentLinearGradient008
     * @tc.desc     testCustomComponentLinearGradient008
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient009
     * @tc.name     testCustomComponentLinearGradient009
     * @tc.desc     testCustomComponentLinearGradient009
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentLinearGradient010
     * @tc.name     testCustomComponentLinearGradient010
     * @tc.desc     testCustomComponentLinearGradient010
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentLinearGradient010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
