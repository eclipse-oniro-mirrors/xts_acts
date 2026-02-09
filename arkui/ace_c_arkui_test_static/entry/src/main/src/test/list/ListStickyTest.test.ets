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

export default function listStickyTest() {

  describe('ListStickyTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListSticky001
     * @tc.name     testListSticky001
     * @tc.desc     testListSticky001
     * @tc.level    Level.LEVEL1
     */
    it('testListSticky001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSticky001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSticky002
     * @tc.name     testListSticky002
     * @tc.desc     testListSticky002
     * @tc.level    Level.LEVEL1
     */
    it('testListSticky002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSticky002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSticky003
     * @tc.name     testListSticky003
     * @tc.desc     testListSticky003
     * @tc.level    Level.LEVEL1
     */
    it('testListSticky003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSticky003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSticky004
     * @tc.name     testListSticky004
     * @tc.desc     testListSticky004
     * @tc.level    Level.LEVEL1
     */
    it('testListSticky004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSticky004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListSticky005
     * @tc.name     testListSticky005
     * @tc.desc     testListSticky005
     * @tc.level    Level.LEVEL1
     */
    it('testListSticky005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSticky005()).assertEqual(0)
      done()
    })
  })
}
