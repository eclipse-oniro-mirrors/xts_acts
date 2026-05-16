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

export default function listItemClipTest() {

  describe('ListItemClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListItemClip001
     * @tc.name     testListItemClip001
     * @tc.desc     testListItemClip001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip002
     * @tc.name     testListItemClip002
     * @tc.desc     testListItemClip002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip003
     * @tc.name     testListItemClip003
     * @tc.desc     testListItemClip003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip004
     * @tc.name     testListItemClip004
     * @tc.desc     testListItemClip004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip005
     * @tc.name     testListItemClip005
     * @tc.desc     testListItemClip005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip006
     * @tc.name     testListItemClip006
     * @tc.desc     testListItemClip006
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemClip007
     * @tc.name     testListItemClip007
     * @tc.desc     testListItemClip007
     * @tc.level    Level.LEVEL1
     */
    it('testListItemClip007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemClip007()).assertEqual(0)
      done()
    })
  })
}
