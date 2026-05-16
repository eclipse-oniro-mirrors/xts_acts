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

export default function imageOpacityTest() {

  describe('ImageOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageOpacity001
     * @tc.name     testImageOpacity001
     * @tc.desc     testImageOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageOpacity002
     * @tc.name     testImageOpacity002
     * @tc.desc     testImageOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageOpacity003
     * @tc.name     testImageOpacity003
     * @tc.desc     testImageOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageOpacity004
     * @tc.name     testImageOpacity004
     * @tc.desc     testImageOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageOpacity005
     * @tc.name     testImageOpacity005
     * @tc.desc     testImageOpacity005
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageOpacity006
     * @tc.name     testImageOpacity006
     * @tc.desc     testImageOpacity006
     * @tc.level    Level.LEVEL1
     */
    it('testImageOpacity006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageOpacity006()).assertEqual(0)
      done()
    })

  })
}
