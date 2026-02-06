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

export default function listNestedScrollTest() {

  describe('listNestedScrollTest', () => {

    
    
/**
     * @tc.number   testListNestedScroll001
     * @tc.name     testListNestedScroll001
     * @tc.desc     testListNestedScroll001
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll002
     * @tc.name     testListNestedScroll002
     * @tc.desc     testListNestedScroll002
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll003
     * @tc.name     testListNestedScroll003
     * @tc.desc     testListNestedScroll003
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll004
     * @tc.name     testListNestedScroll004
     * @tc.desc     testListNestedScroll004
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll005
     * @tc.name     testListNestedScroll005
     * @tc.desc     testListNestedScroll005
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll005()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll006
     * @tc.name     testListNestedScroll006
     * @tc.desc     testListNestedScroll006
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll006()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListNestedScroll007
     * @tc.name     testListNestedScroll007
     * @tc.desc     testListNestedScroll007
     * @tc.level    Level.LEVEL1
     */
    it('testListNestedScroll007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListNestedScroll007()).assertEqual(0)
      done()
    })
  })
}
