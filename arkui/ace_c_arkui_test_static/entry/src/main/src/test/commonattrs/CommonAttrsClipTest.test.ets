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

export default function commonAttrsClipTest() {

  describe('CommonAttrsClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsClip001
     * @tc.name     testCommonAttrsClip001
     * @tc.desc     testCommonAttrsClip001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip002
     * @tc.name     testCommonAttrsClip002
     * @tc.desc     testCommonAttrsClip002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip003
     * @tc.name     testCommonAttrsClip003
     * @tc.desc     testCommonAttrsClip003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip004
     * @tc.name     testCommonAttrsClip004
     * @tc.desc     testCommonAttrsClip004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip005
     * @tc.name     testCommonAttrsClip005
     * @tc.desc     testCommonAttrsClip005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip006
     * @tc.name     testCommonAttrsClip006
     * @tc.desc     testCommonAttrsClip006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsClip007
     * @tc.name     testCommonAttrsClip007
     * @tc.desc     testCommonAttrsClip007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsClip007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsClip007()).assertEqual(0)
      done()
    })
  })
}
