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

export default function imageTransformTest() {

  describe('ImageTransformTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageTransform001
     * @tc.name     testImageTransform001
     * @tc.desc     testImageTransform001
     * @tc.level    Level.LEVEL1
     */
    it('testImageTransform001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTransform001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTransform002
     * @tc.name     testImageTransform002
     * @tc.desc     testImageTransform002
     * @tc.level    Level.LEVEL1
     */
    it('testImageTransform002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTransform002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTransform003
     * @tc.name     testImageTransform003
     * @tc.desc     testImageTransform003
     * @tc.level    Level.LEVEL1
     */
    it('testImageTransform003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTransform003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTransform004
     * @tc.name     testImageTransform004
     * @tc.desc     testImageTransform004
     * @tc.level    Level.LEVEL1
     */
    it('testImageTransform004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTransform004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageTransform005
     * @tc.name     testImageTransform005
     * @tc.desc     testImageTransform005
     * @tc.level    Level.LEVEL1
     */
    it('testImageTransform005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageTransform005()).assertEqual(0)
      done()
    })

  })
}
