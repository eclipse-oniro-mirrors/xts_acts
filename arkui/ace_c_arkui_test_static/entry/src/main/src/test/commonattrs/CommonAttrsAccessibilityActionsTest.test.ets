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

export default function commonAttrsAccessibilityActionsTest() {

  describe('CommonAttrsAccessibilityActionsTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions001
     * @tc.name     testCommonAttrsAccessibilityActions001
     * @tc.desc     testCommonAttrsAccessibilityActions001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions002
     * @tc.name     testCommonAttrsAccessibilityActions002
     * @tc.desc     testCommonAttrsAccessibilityActions002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions003
     * @tc.name     testCommonAttrsAccessibilityActions003
     * @tc.desc     testCommonAttrsAccessibilityActions003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions004
     * @tc.name     testCommonAttrsAccessibilityActions004
     * @tc.desc     testCommonAttrsAccessibilityActions004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions005
     * @tc.name     testCommonAttrsAccessibilityActions005
     * @tc.desc     testCommonAttrsAccessibilityActions005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAccessibilityActions006
     * @tc.name     testCommonAttrsAccessibilityActions006
     * @tc.desc     testCommonAttrsAccessibilityActions006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAccessibilityActions006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAccessibilityActions006()).assertEqual(0)
      done()
    })
  })
}