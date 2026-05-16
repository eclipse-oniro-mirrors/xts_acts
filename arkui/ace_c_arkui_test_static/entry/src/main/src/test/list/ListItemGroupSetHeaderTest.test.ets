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

export default function listItemGroupSetHeaderTest() {

  describe('ListItemGroupSetHeaderTest', () => {

    
    
/**
     * @tc.number   testListItemGroupSetHeader001
     * @tc.name     testListItemGroupSetHeader001
     * @tc.desc     testListItemGroupSetHeader001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupSetHeader001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupSetHeader001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemGroupSetHeader002
     * @tc.name     testListItemGroupSetHeader002
     * @tc.desc     testListItemGroupSetHeader002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupSetHeader002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupSetHeader002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemGroupSetHeader003
     * @tc.name     testListItemGroupSetHeader003
     * @tc.desc     testListItemGroupSetHeader003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemGroupSetHeader003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemGroupSetHeader003()).assertEqual(0)
      done()
    })
  })
}
