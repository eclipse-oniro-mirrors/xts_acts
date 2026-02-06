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

export default function listScrollEdgeTest() {

  describe('ListScrollEdgeTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    
    
/**
     * @tc.number   testListScrollEdge001
     * @tc.name     testListScrollEdge001
     * @tc.desc     testListScrollEdge001
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge002
     * @tc.name     testListScrollEdge002
     * @tc.desc     testListScrollEdge002
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge003
     * @tc.name     testListScrollEdge003
     * @tc.desc     testListScrollEdge003
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge004
     * @tc.name     testListScrollEdge004
     * @tc.desc     testListScrollEdge004
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge005
     * @tc.name     testListScrollEdge005
     * @tc.desc     testListScrollEdge005
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge005()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge006
     * @tc.name     testListScrollEdge006
     * @tc.desc     testListScrollEdge006
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge006()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollEdge007
     * @tc.name     testListScrollEdge007
     * @tc.desc     testListScrollEdge007
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollEdge007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollEdge007()).assertEqual(0)
      done()
    })
  })
}
