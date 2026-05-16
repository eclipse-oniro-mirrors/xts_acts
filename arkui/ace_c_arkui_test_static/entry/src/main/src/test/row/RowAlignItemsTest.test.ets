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

export default function rowAlignItemsTest() {

  describe('RowAlignItemsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testRowAlignItems001
     * @tc.name     testRowAlignItems001
     * @tc.desc     testRowAlignItems001
     * @tc.level    Level.LEVEL1
     */
    it('testRowAlignItems001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowAlignItems001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowAlignItems002
     * @tc.name     testRowAlignItems002
     * @tc.desc     testRowAlignItems002
     * @tc.level    Level.LEVEL1
     */
    it('testRowAlignItems002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowAlignItems002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowAlignItems003
     * @tc.name     testRowAlignItems003
     * @tc.desc     testRowAlignItems003
     * @tc.level    Level.LEVEL1
     */
    it('testRowAlignItems003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowAlignItems003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testRowAlignItems004
     * @tc.name     testRowAlignItems004
     * @tc.desc     testRowAlignItems004
     * @tc.level    Level.LEVEL1
     */
    it('testRowAlignItems004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRowAlignItems004()).assertEqual(0)
      done()
    })
  })
}
