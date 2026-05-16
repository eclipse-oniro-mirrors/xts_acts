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

export default function nativeTest() {

  describe('nativeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   nativeTest001
     * @tc.name     nativeTest001
     * @tc.desc     nativeTest001
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   nativeTest002
     * @tc.name     nativeTest002
     * @tc.desc     nativeTest002
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   nativeTest003
     * @tc.name     nativeTest003
     * @tc.desc     nativeTest003
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest005
     * @tc.name     nativeTest005
     * @tc.desc     nativeTest005
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_005()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest006
     * @tc.name     nativeTest006
     * @tc.desc     nativeTest006
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_006()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest007
     * @tc.name     nativeTest007
     * @tc.desc     nativeTest007
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_007()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest008
     * @tc.name     nativeTest008
     * @tc.desc     nativeTest008
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_008()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest009
     * @tc.name     nativeTest009
     * @tc.desc     nativeTest009
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_009()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest010
     * @tc.name     nativeTest010
     * @tc.desc     nativeTest010
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_010()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest011
     * @tc.name     nativeTest011
     * @tc.desc     nativeTest011
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_011()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest012
     * @tc.name     nativeTest012
     * @tc.desc     nativeTest012
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_012()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest013
     * @tc.name     nativeTest013
     * @tc.desc     nativeTest013
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_013()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   nativeTest014
     * @tc.name     nativeTest014
     * @tc.desc     nativeTest014
     * @tc.level    Level.LEVEL1
     */
    it('nativeTest014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.native_014()).assertEqual(0)
      done()
    })

  })
}
