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

export default function customComponentBorderRadiusTest() {
  customComponentBorderRadiusTest
  describe('CustomComponentBorderRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentBorderRadius001
     * @tc.name     testCustomComponentBorderRadius001
     * @tc.desc     testCustomComponentBorderRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderRadius002
     * @tc.name     testCustomComponentBorderRadius002
     * @tc.desc     testCustomComponentBorderRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderRadius003
     * @tc.name     testCustomComponentBorderRadius003
     * @tc.desc     testCustomComponentBorderRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderRadius004
     * @tc.name     testCustomComponentBorderRadius004
     * @tc.desc     testCustomComponentBorderRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderRadius005
     * @tc.name     testCustomComponentBorderRadius005
     * @tc.desc     testCustomComponentBorderRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderRadius006
     * @tc.name     testCustomComponentBorderRadius006
     * @tc.desc     testCustomComponentBorderRadius006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderRadius006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderRadius006()).assertEqual(0)
      done()
    })
  })
}
