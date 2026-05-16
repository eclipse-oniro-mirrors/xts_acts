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

export default function commonAttrsDisplayPriorityTest() {
    
  describe('CommonAttrsDisplayPriorityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority001
     * @tc.name     testCommonAttrsDisplayPriority001
     * @tc.desc     testCommonAttrsDisplayPriority001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority002
     * @tc.name     testCommonAttrsDisplayPriority002
     * @tc.desc     testCommonAttrsDisplayPriority002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority003
     * @tc.name     testCommonAttrsDisplayPriority003
     * @tc.desc     testCommonAttrsDisplayPriority003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority004
     * @tc.name     testCommonAttrsDisplayPriority004
     * @tc.desc     testCommonAttrsDisplayPriority004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority005
     * @tc.name     testCommonAttrsDisplayPriority005
     * @tc.desc     testCommonAttrsDisplayPriority005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDisplayPriority006
     * @tc.name     testCommonAttrsDisplayPriority006
     * @tc.desc     testCommonAttrsDisplayPriority006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDisplayPriority006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDisplayPriority006()).assertEqual(0)
      done()
    })
  })
}