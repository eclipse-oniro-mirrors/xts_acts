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

export default function nodeContentTest() {

  describe('NodeContentTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testNodeContent001
     * @tc.name     testNodeContent001
     * @tc.desc     testNodeContent001
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent002
     * @tc.name     testNodeContent002
     * @tc.desc     testNodeContent002
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent003
     * @tc.name     testNodeContent003
     * @tc.desc     testNodeContent003
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent004
     * @tc.name     testNodeContent004
     * @tc.desc     testNodeContent004
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent005
     * @tc.name     testNodeContent005
     * @tc.desc     testNodeContent005
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent006
     * @tc.name     testNodeContent006
     * @tc.desc     testNodeContent006
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testNodeContent007
     * @tc.name     testNodeContent007
     * @tc.desc     testNodeContent007
     * @tc.level    Level.LEVEL1
     */
    it('testNodeContent007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testNodeContent007()).assertEqual(0)
      done()
    })

  })
}
