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

export default function customComponentSepiaTest() {

  describe('CustomComponentSepiaTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentSepia001
     * @tc.name     testCustomComponentSepia001
     * @tc.desc     testCustomComponentSepia001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSepia002
     * @tc.name     testCustomComponentSepia002
     * @tc.desc     testCustomComponentSepia002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSepia003
     * @tc.name     testCustomComponentSepia003
     * @tc.desc     testCustomComponentSepia003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSepia004
     * @tc.name     testCustomComponentSepia004
     * @tc.desc     testCustomComponentSepia004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSepia005
     * @tc.name     testCustomComponentSepia005
     * @tc.desc     testCustomComponentSepia005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentSepia006
     * @tc.name     testCustomComponentSepia006
     * @tc.desc     testCustomComponentSepia006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentSepia006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentSepia006()).assertEqual(0)
      done()
    })

  })
}
