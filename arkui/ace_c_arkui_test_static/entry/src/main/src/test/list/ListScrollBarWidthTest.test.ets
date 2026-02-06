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

export default function listScrollBarWidthTest() {

  describe('ListScrollBarWidthTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListScrollBarWidth001
     * @tc.name     testListScrollBarWidth001
     * @tc.desc     testListScrollBarWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollBarWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollBarWidth001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollBarWidth002
     * @tc.name     testListScrollBarWidth002
     * @tc.desc     testListScrollBarWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollBarWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollBarWidth002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollBarWidth003
     * @tc.name     testListScrollBarWidth003
     * @tc.desc     testListScrollBarWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollBarWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollBarWidth003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollBarWidth004
     * @tc.name     testListScrollBarWidth004
     * @tc.desc     testListScrollBarWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollBarWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollBarWidth004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListScrollBarWidth005
     * @tc.name     testListScrollBarWidth005
     * @tc.desc     testListScrollBarWidth005
     * @tc.level    Level.LEVEL1
     */
    it('testListScrollBarWidth005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScrollBarWidth005()).assertEqual(0)
      done()
    })
  })
}
