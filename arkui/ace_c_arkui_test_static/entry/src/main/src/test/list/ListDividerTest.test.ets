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

export default function listDividerTest() {

  describe('ListDividerTest', () => {

    
    
/**
     * @tc.number   testListDivider001
     * @tc.name     testListDivider001
     * @tc.desc     testListDivider001
     * @tc.level    Level.LEVEL1
     */
    it('testListDivider001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListDivider001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListDivider002
     * @tc.name     testListDivider002
     * @tc.desc     testListDivider002
     * @tc.level    Level.LEVEL1
     */
    it('testListDivider002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListDivider002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListDivider003
     * @tc.name     testListDivider003
     * @tc.desc     testListDivider003
     * @tc.level    Level.LEVEL1
     */
    it('testListDivider003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListDivider003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListDivider004
     * @tc.name     testListDivider004
     * @tc.desc     testListDivider004
     * @tc.level    Level.LEVEL1
     */
    it('testListDivider004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListDivider004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListDivider005
     * @tc.name     testListDivider005
     * @tc.desc     testListDivider005
     * @tc.level    Level.LEVEL1
     */
    it('testListDivider005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListDivider005()).assertEqual(0)
      done()
    })
  })
}
