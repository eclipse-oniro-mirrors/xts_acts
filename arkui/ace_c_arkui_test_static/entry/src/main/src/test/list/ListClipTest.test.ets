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

export default function listClipTest() {

  describe('ListClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListClip001
     * @tc.name     testListClip001
     * @tc.desc     testListClip001
     * @tc.level    Level.LEVEL1
     */
    it('testListClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip002
     * @tc.name     testListClip002
     * @tc.desc     testListClip002
     * @tc.level    Level.LEVEL1
     */
    it('testListClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip003
     * @tc.name     testListClip003
     * @tc.desc     testListClip003
     * @tc.level    Level.LEVEL1
     */
    it('testListClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip004
     * @tc.name     testListClip004
     * @tc.desc     testListClip004
     * @tc.level    Level.LEVEL1
     */
    it('testListClip004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip005
     * @tc.name     testListClip005
     * @tc.desc     testListClip005
     * @tc.level    Level.LEVEL1
     */
    it('testListClip005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip006
     * @tc.name     testListClip006
     * @tc.desc     testListClip006
     * @tc.level    Level.LEVEL1
     */
    it('testListClip006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListClip007
     * @tc.name     testListClip007
     * @tc.desc     testListClip007
     * @tc.level    Level.LEVEL1
     */
    it('testListClip007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListClip007()).assertEqual(0)
      done()
    })
  })
}
