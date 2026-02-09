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

export default function gridCachedCountTest() {

  describe('GridCachedCountTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testGridCachedCount001
     * @tc.name     testGridCachedCount001
     * @tc.desc     testGridCachedCount001
     * @tc.level    Level.LEVEL1
     */
    it('testGridCachedCount001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridCachedCount001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGridCachedCount002
     * @tc.name     testGridCachedCount002
     * @tc.desc     testGridCachedCount002
     * @tc.level    Level.LEVEL1
     */
    it('testGridCachedCount002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridCachedCount002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGridCachedCount003
     * @tc.name     testGridCachedCount003
     * @tc.desc     testGridCachedCount003
     * @tc.level    Level.LEVEL1
     */
    it('testGridCachedCount003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridCachedCount003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGridCachedCount004
     * @tc.name     testGridCachedCount004
     * @tc.desc     testGridCachedCount004
     * @tc.level    Level.LEVEL1
     */
    it('testGridCachedCount004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridCachedCount004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGridCachedCount005
     * @tc.name     testGridCachedCount005
     * @tc.desc     testGridCachedCount005
     * @tc.level    Level.LEVEL1
     */
    it('testGridCachedCount005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridCachedCount005()).assertEqual(0)
      done()
    })
  })
}
