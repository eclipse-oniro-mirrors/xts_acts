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

export default function customComponentSweepGradientTest() {

  describe('CustomComponentSweepGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentSweepGradient001
     * @tc.name     testCustomComponentSweepGradient001
     * @tc.desc     testCustomComponentSweepGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSweepGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSweepGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSweepGradient002
     * @tc.name     testCustomComponentSweepGradient002
     * @tc.desc     testCustomComponentSweepGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSweepGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSweepGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSweepGradient003
     * @tc.name     testCustomComponentSweepGradient003
     * @tc.desc     testCustomComponentSweepGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSweepGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSweepGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSweepGradient004
     * @tc.name     testCustomComponentSweepGradient004
     * @tc.desc     testCustomComponentSweepGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSweepGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSweepGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSweepGradient005
     * @tc.name     testCustomComponentSweepGradient005
     * @tc.desc     testCustomComponentSweepGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSweepGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSweepGradient005()).assertEqual(0)
      done()
    })

  })
}
