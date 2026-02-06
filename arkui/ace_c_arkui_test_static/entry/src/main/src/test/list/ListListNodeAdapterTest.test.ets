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

export default function listListNodeAdapterTest() {

  describe('ListListNodeAdapterTest', () => {

    
    
/**
     * @tc.number   testListListNodeAdapter001
     * @tc.name     testListListNodeAdapter001
     * @tc.desc     testListListNodeAdapter001
     * @tc.level    Level.LEVEL1
     */
    it('testListListNodeAdapter001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListListNodeAdapter001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListListNodeAdapter002
     * @tc.name     testListListNodeAdapter002
     * @tc.desc     testListListNodeAdapter002
     * @tc.level    Level.LEVEL1
     */
    it('testListListNodeAdapter002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListListNodeAdapter002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListListNodeAdapter003
     * @tc.name     testListListNodeAdapter003
     * @tc.desc     testListListNodeAdapter003
     * @tc.level    Level.LEVEL1
     */
    it('testListListNodeAdapter003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListListNodeAdapter003()).assertEqual(0)
      done()
    })
  })
}
