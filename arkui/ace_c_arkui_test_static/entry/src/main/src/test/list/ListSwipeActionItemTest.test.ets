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

export default function ListSwipeActionItemTest() {

  describe('ListSwipeActionItemTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListSwipeAction001
     * @tc.name     testListSwipeAction001
     * @tc.desc     testListSwipeAction001
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionCreate()).assertEqual(1)
      done()
    })

    
    
/**
     * @tc.number   testListSwipeAction002
     * @tc.name     testListSwipeAction002
     * @tc.desc     testListSwipeAction002
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionSetActionAreaDistance001()).assertEqual(0);
      done()
    })

     
    
/**
     * @tc.number   testListSwipeAction003
     * @tc.name     testListSwipeAction003
     * @tc.desc     testListSwipeAction003
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionOptionEdgeEffect()).assertEqual(0)
      done()
    })

     
    
/**
     * @tc.number   testListSwipeAction004
     * @tc.name     testListSwipeAction004
     * @tc.desc     testListSwipeAction004
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionItem007()).assertEqual(1)
      done()
    })

     
    
/**
     * @tc.number   testListSwipeAction005
     * @tc.name     testListSwipeAction005
     * @tc.desc     testListSwipeAction005
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionItem006()).assertEqual(1)
      done()
    })
    
     
    
/**
     * @tc.number   testListSwipeAction006
     * @tc.name     testListSwipeAction006
     * @tc.desc     testListSwipeAction006
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionOptionCreate()).assertEqual(1);
      done()
    })
    
    
    
/**
     * @tc.number   testListSwipeAction007
     * @tc.name     testListSwipeAction007
     * @tc.desc     testListSwipeAction007
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionItem008()).assertEqual(1);
      done()
    })

    
    
/**
     * @tc.number   testListSwipeAction008
     * @tc.name     testListSwipeAction008
     * @tc.desc     testListSwipeAction008
     * @tc.level    Level.LEVEL1
     */
    it('testListSwipeAction008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSwipeActionItem009()).assertEqual(1);
      done()
    })

  })
}
