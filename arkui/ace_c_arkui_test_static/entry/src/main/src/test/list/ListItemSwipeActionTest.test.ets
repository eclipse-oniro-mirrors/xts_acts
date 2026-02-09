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

export default function listItemSwipeActionTest() {

  describe('ListItemSwipeActionTest', () => {

    
    
/**
     * @tc.number   testListItemSwipeAction001
     * @tc.name     testListItemSwipeAction001
     * @tc.desc     testListItemSwipeAction001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemSwipeAction002
     * @tc.name     testListItemSwipeAction002
     * @tc.desc     testListItemSwipeAction002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemSwipeAction003
     * @tc.name     testListItemSwipeAction003
     * @tc.desc     testListItemSwipeAction003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemSwipeAction004
     * @tc.name     testListItemSwipeAction004
     * @tc.desc     testListItemSwipeAction004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemSwipeAction005
     * @tc.name     testListItemSwipeAction005
     * @tc.desc     testListItemSwipeAction005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction005()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListItemSwipeAction006
     * @tc.name     testListItemSwipeAction006
     * @tc.desc     testListItemSwipeAction006
     * @tc.level    Level.LEVEL1
     */
    it('testListItemSwipeAction006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemSwipeAction006()).assertEqual(0)
      done()
    })
  })
}
