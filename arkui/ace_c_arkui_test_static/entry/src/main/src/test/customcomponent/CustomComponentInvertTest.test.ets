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

export default function customComponentInvertTest() {

  describe('CustomComponentInvertTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentInvert001
     * @tc.name     testCustomComponentInvert001
     * @tc.desc     testCustomComponentInvert001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentInvert002
     * @tc.name     testCustomComponentInvert002
     * @tc.desc     testCustomComponentInvert002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentInvert003
     * @tc.name     testCustomComponentInvert003
     * @tc.desc     testCustomComponentInvert003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentInvert004
     * @tc.name     testCustomComponentInvert004
     * @tc.desc     testCustomComponentInvert004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentInvert005
     * @tc.name     testCustomComponentInvert005
     * @tc.desc     testCustomComponentInvert005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentInvert006
     * @tc.name     testCustomComponentInvert006
     * @tc.desc     testCustomComponentInvert006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentInvert006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentInvert006()).assertEqual(0)
      done()
    })

  })
}
