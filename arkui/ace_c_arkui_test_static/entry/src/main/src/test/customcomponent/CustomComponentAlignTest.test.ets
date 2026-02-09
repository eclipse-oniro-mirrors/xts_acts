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

export default function customComponentAlignTest() {

  describe('CustomComponentAlignTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentAlign001
     * @tc.name     testCustomComponentAlign001
     * @tc.desc     testCustomComponentAlign001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign002
     * @tc.name     testCustomComponentAlign002
     * @tc.desc     testCustomComponentAlign002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign003
     * @tc.name     testCustomComponentAlign003
     * @tc.desc     testCustomComponentAlign003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign004
     * @tc.name     testCustomComponentAlign004
     * @tc.desc     testCustomComponentAlign004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign005
     * @tc.name     testCustomComponentAlign005
     * @tc.desc     testCustomComponentAlign005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign006
     * @tc.name     testCustomComponentAlign006
     * @tc.desc     testCustomComponentAlign006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign007
     * @tc.name     testCustomComponentAlign007
     * @tc.desc     testCustomComponentAlign007
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign008
     * @tc.name     testCustomComponentAlign008
     * @tc.desc     testCustomComponentAlign008
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign009
     * @tc.name     testCustomComponentAlign009
     * @tc.desc     testCustomComponentAlign009
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign010
     * @tc.name     testCustomComponentAlign010
     * @tc.desc     testCustomComponentAlign010
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentAlign011
     * @tc.name     testCustomComponentAlign011
     * @tc.desc     testCustomComponentAlign011
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlign011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlign011()).assertEqual(0)
      done()
    })

  })
}
