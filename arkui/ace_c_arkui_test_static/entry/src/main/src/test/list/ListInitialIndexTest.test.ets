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

export default function listInitialIndexTest() {

  describe('ListInitialIndexTest', () => {

    
    
/**
     * @tc.number   testListInitialIndex001
     * @tc.name     testListInitialIndex001
     * @tc.desc     testListInitialIndex001
     * @tc.level    Level.LEVEL1
     */
    it('testListInitialIndex001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListInitialIndex001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListInitialIndex002
     * @tc.name     testListInitialIndex002
     * @tc.desc     testListInitialIndex002
     * @tc.level    Level.LEVEL1
     */
    it('testListInitialIndex002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListInitialIndex002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListInitialIndex003
     * @tc.name     testListInitialIndex003
     * @tc.desc     testListInitialIndex003
     * @tc.level    Level.LEVEL1
     */
    it('testListInitialIndex003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListInitialIndex003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListInitialIndex004
     * @tc.name     testListInitialIndex004
     * @tc.desc     testListInitialIndex004
     * @tc.level    Level.LEVEL1
     */
    it('testListInitialIndex004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListInitialIndex004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListInitialIndex005
     * @tc.name     testListInitialIndex005
     * @tc.desc     testListInitialIndex005
     * @tc.level    Level.LEVEL1
     */
    it('testListInitialIndex005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListInitialIndex005()).assertEqual(0)
      done()
    })

  })
}
