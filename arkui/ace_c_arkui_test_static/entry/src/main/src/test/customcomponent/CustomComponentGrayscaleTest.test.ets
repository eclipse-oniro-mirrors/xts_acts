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

export default function customComponentGrayscaleTest() {

  describe('CustomComponentGrayscaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentGrayscale001
     * @tc.name     testCustomComponentGrayscale001
     * @tc.desc     testCustomComponentGrayscale001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentGrayscale002
     * @tc.name     testCustomComponentGrayscale002
     * @tc.desc     testCustomComponentGrayscale002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentGrayscale003
     * @tc.name     testCustomComponentGrayscale003
     * @tc.desc     testCustomComponentGrayscale003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentGrayscale004
     * @tc.name     testCustomComponentGrayscale004
     * @tc.desc     testCustomComponentGrayscale004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentGrayscale005
     * @tc.name     testCustomComponentGrayscale005
     * @tc.desc     testCustomComponentGrayscale005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentGrayscale006
     * @tc.name     testCustomComponentGrayscale006
     * @tc.desc     testCustomComponentGrayscale006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGrayscale006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGrayscale006()).assertEqual(0)
      done()
    })

  })
}
