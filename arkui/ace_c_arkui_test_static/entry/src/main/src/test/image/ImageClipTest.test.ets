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

export default function imageClipTest() {

  describe('ImageClipTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageClip001
     * @tc.name     testImageClip001
     * @tc.desc     testImageClip001
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip002
     * @tc.name     testImageClip002
     * @tc.desc     testImageClip002
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip003
     * @tc.name     testImageClip003
     * @tc.desc     testImageClip003
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip004
     * @tc.name     testImageClip004
     * @tc.desc     testImageClip004
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip005
     * @tc.name     testImageClip005
     * @tc.desc     testImageClip005
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip006
     * @tc.name     testImageClip006
     * @tc.desc     testImageClip006
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageClip007
     * @tc.name     testImageClip007
     * @tc.desc     testImageClip007
     * @tc.level    Level.LEVEL1
     */
    it('testImageClip007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageClip007()).assertEqual(0)
      done()
    })

  })
}
