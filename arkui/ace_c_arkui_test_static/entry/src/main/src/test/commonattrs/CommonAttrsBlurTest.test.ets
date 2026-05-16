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

export default function commonAttrsBlurTest() {

  describe('CommonAttrsBlurTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBlur001
     * @tc.name     testCommonAttrsBlur001
     * @tc.desc     testCommonAttrsBlur001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBlur002
     * @tc.name     testCommonAttrsBlur002
     * @tc.desc     testCommonAttrsBlur002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBlur003
     * @tc.name     testCommonAttrsBlur003
     * @tc.desc     testCommonAttrsBlur003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBlur004
     * @tc.name     testCommonAttrsBlur004
     * @tc.desc     testCommonAttrsBlur004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBlur005
     * @tc.name     testCommonAttrsBlur005
     * @tc.desc     testCommonAttrsBlur005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBlur006
     * @tc.name     testCommonAttrsBlur006
     * @tc.desc     testCommonAttrsBlur006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBlur006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBlur006()).assertEqual(0)
      done()
    })
  })
}