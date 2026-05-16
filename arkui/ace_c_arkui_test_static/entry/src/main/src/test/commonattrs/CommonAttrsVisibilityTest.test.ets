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

export default function commonAttrsVisibilityTest() {

  describe('CommonAttrsVisibilityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsVisibility001
     * @tc.name     testCommonAttrsVisibility001
     * @tc.desc     testCommonAttrsVisibility001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsVisibility002
     * @tc.name     testCommonAttrsVisibility002
     * @tc.desc     testCommonAttrsVisibility002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsVisibility003
     * @tc.name     testCommonAttrsVisibility003
     * @tc.desc     testCommonAttrsVisibility003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsVisibility004
     * @tc.name     testCommonAttrsVisibility004
     * @tc.desc     testCommonAttrsVisibility004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsVisibility005
     * @tc.name     testCommonAttrsVisibility005
     * @tc.desc     testCommonAttrsVisibility005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsVisibility006
     * @tc.name     testCommonAttrsVisibility006
     * @tc.desc     testCommonAttrsVisibility006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsVisibility006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsVisibility006()).assertEqual(0)
      done()
    })
  })
}
