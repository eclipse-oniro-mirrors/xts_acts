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

export default function commonAttrsChainModeTest() {

  describe('CommonAttrsChainModeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsChainMode001
     * @tc.name     testCommonAttrsChainMode001
     * @tc.desc     testCommonAttrsChainMode001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode002
     * @tc.name     testCommonAttrsChainMode002
     * @tc.desc     testCommonAttrsChainMode002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode003
     * @tc.name     testCommonAttrsChainMode003
     * @tc.desc     testCommonAttrsChainMode003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode004
     * @tc.name     testCommonAttrsChainMode004
     * @tc.desc     testCommonAttrsChainMode004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode005
     * @tc.name     testCommonAttrsChainMode005
     * @tc.desc     testCommonAttrsChainMode005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode006
     * @tc.name     testCommonAttrsChainMode006
     * @tc.desc     testCommonAttrsChainMode006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode006()).assertEqual(0)
      done()
    })
   
    
    
/**
     * @tc.number   testCommonAttrsChainMode007
     * @tc.name     testCommonAttrsChainMode007
     * @tc.desc     testCommonAttrsChainMode007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsChainMode008
     * @tc.name     testCommonAttrsChainMode008
     * @tc.desc     testCommonAttrsChainMode008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsChainMode008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsChainMode008()).assertEqual(0)
      done()
    })
  })
}