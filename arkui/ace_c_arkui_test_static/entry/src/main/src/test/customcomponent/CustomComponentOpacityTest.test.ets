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

export default function customComponentOpacityTest() {

  describe('CustomComponentOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentOpacity001
     * @tc.name     testCustomComponentOpacity001
     * @tc.desc     testCustomComponentOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOpacity002
     * @tc.name     testCustomComponentOpacity002
     * @tc.desc     testCustomComponentOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOpacity003
     * @tc.name     testCustomComponentOpacity003
     * @tc.desc     testCustomComponentOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOpacity004
     * @tc.name     testCustomComponentOpacity004
     * @tc.desc     testCustomComponentOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOpacity005
     * @tc.name     testCustomComponentOpacity005
     * @tc.desc     testCustomComponentOpacity005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentOpacity006
     * @tc.name     testCustomComponentOpacity006
     * @tc.desc     testCustomComponentOpacity006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentOpacity006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentOpacity006()).assertEqual(0)
      done()
    })

  })
}
