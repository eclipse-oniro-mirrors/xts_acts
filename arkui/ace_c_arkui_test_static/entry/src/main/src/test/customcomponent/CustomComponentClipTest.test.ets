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

export default function customComponentClipTest() {

  describe('CustomComponentClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentClip001
     * @tc.name     testCustomComponentClip001
     * @tc.desc     testCustomComponentClip001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip002
     * @tc.name     testCustomComponentClip002
     * @tc.desc     testCustomComponentClip002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip003
     * @tc.name     testCustomComponentClip003
     * @tc.desc     testCustomComponentClip003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip004
     * @tc.name     testCustomComponentClip004
     * @tc.desc     testCustomComponentClip004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip005
     * @tc.name     testCustomComponentClip005
     * @tc.desc     testCustomComponentClip005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip006
     * @tc.name     testCustomComponentClip006
     * @tc.desc     testCustomComponentClip006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentClip007
     * @tc.name     testCustomComponentClip007
     * @tc.desc     testCustomComponentClip007
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentClip007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentClip007()).assertEqual(0)
      done()
    })
  })
}
