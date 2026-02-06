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

export default function customComponentRadialGradientTest() {

  describe('CustomComponentRadialGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentRadialGradient001
     * @tc.name     testCustomComponentRadialGradient001
     * @tc.desc     testCustomComponentRadialGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentRadialGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentRadialGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentRadialGradient002
     * @tc.name     testCustomComponentRadialGradient002
     * @tc.desc     testCustomComponentRadialGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentRadialGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentRadialGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentRadialGradient003
     * @tc.name     testCustomComponentRadialGradient003
     * @tc.desc     testCustomComponentRadialGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentRadialGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentRadialGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentRadialGradient004
     * @tc.name     testCustomComponentRadialGradient004
     * @tc.desc     testCustomComponentRadialGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentRadialGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentRadialGradient004()).assertEqual(0)
      done()
    })
  })
}
