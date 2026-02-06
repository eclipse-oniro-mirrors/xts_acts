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

export default function customComponentBorderStyleTest() {
  customComponentBorderStyleTest
  describe('CustomComponentBorderStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentBorderStyle001
     * @tc.name     testCustomComponentBorderStyle001
     * @tc.desc     testCustomComponentBorderStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderStyle002
     * @tc.name     testCustomComponentBorderStyle002
     * @tc.desc     testCustomComponentBorderStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderStyle003
     * @tc.name     testCustomComponentBorderStyle003
     * @tc.desc     testCustomComponentBorderStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderStyle004
     * @tc.name     testCustomComponentBorderStyle004
     * @tc.desc     testCustomComponentBorderStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderStyle005
     * @tc.name     testCustomComponentBorderStyle005
     * @tc.desc     testCustomComponentBorderStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderStyle006
     * @tc.name     testCustomComponentBorderStyle006
     * @tc.desc     testCustomComponentBorderStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderStyle006()).assertEqual(0)
      done()
    })
  })
}
