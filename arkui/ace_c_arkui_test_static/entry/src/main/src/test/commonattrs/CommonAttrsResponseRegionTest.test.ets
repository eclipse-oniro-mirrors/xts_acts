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

export default function commonAttrsResponseRegionTest() {

  describe('CommonAttrsResponseRegionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion001
     * @tc.name     testCommonAttrsResponseRegion001
     * @tc.desc     testCommonAttrsResponseRegion001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion002
     * @tc.name     testCommonAttrsResponseRegion002
     * @tc.desc     testCommonAttrsResponseRegion002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion003
     * @tc.name     testCommonAttrsResponseRegion003
     * @tc.desc     testCommonAttrsResponseRegion003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion004
     * @tc.name     testCommonAttrsResponseRegion004
     * @tc.desc     testCommonAttrsResponseRegion004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion005
     * @tc.name     testCommonAttrsResponseRegion005
     * @tc.desc     testCommonAttrsResponseRegion005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion006
     * @tc.name     testCommonAttrsResponseRegion006
     * @tc.desc     testCommonAttrsResponseRegion006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsResponseRegion007
     * @tc.name     testCommonAttrsResponseRegion007
     * @tc.desc     testCommonAttrsResponseRegion007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsResponseRegion007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsResponseRegion007()).assertEqual(0)
      done()
    })
  })
}