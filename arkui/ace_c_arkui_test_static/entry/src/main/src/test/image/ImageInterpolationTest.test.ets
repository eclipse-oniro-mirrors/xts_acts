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

export default function imageInterpolationTest() {

  describe('ImageInterpolationTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageInterpolation001
     * @tc.name     testImageInterpolation001
     * @tc.desc     testImageInterpolation001
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageInterpolation002
     * @tc.name     testImageInterpolation002
     * @tc.desc     testImageInterpolation002
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageInterpolation003
     * @tc.name     testImageInterpolation003
     * @tc.desc     testImageInterpolation003
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageInterpolation004
     * @tc.name     testImageInterpolation004
     * @tc.desc     testImageInterpolation004
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageInterpolation005
     * @tc.name     testImageInterpolation005
     * @tc.desc     testImageInterpolation005
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageInterpolation006
     * @tc.name     testImageInterpolation006
     * @tc.desc     testImageInterpolation006
     * @tc.level    Level.LEVEL1
     */
    it('testImageInterpolation006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageInterpolation006()).assertEqual(0)
      done()
    })

  })
}
