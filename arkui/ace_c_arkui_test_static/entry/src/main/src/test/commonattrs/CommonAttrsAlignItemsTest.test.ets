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

import { beforeEach, describe, expect, it, Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsAlignItemsTest() {

  describe('CommonAttrsAlignItemsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAlignItems001
     * @tc.name     testCommonAttrsAlignItems001
     * @tc.desc     testCommonAttrsAlignItems001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignItems002
     * @tc.name     testCommonAttrsAlignItems002
     * @tc.desc     testCommonAttrsAlignItems002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignItems003
     * @tc.name     testCommonAttrsAlignItems003
     * @tc.desc     testCommonAttrsAlignItems003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignItems004
     * @tc.name     testCommonAttrsAlignItems004
     * @tc.desc     testCommonAttrsAlignItems004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignItems005
     * @tc.name     testCommonAttrsAlignItems005
     * @tc.desc     testCommonAttrsAlignItems005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignItems006
     * @tc.name     testCommonAttrsAlignItems006
     * @tc.desc     testCommonAttrsAlignItems006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignItems006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignItems006()).assertEqual(0)
      done();
    })
  })
}
