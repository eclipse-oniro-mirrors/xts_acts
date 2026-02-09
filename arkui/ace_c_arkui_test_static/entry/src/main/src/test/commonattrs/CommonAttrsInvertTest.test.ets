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

export default function commonAttrsInvertTest() {

  describe('CommonAttrsInvertTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsInvert001
     * @tc.name     testCommonAttrsInvert001
     * @tc.desc     testCommonAttrsInvert001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsInvert002
     * @tc.name     testCommonAttrsInvert002
     * @tc.desc     testCommonAttrsInvert002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsInvert003
     * @tc.name     testCommonAttrsInvert003
     * @tc.desc     testCommonAttrsInvert003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsInvert004
     * @tc.name     testCommonAttrsInvert004
     * @tc.desc     testCommonAttrsInvert004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsInvert005
     * @tc.name     testCommonAttrsInvert005
     * @tc.desc     testCommonAttrsInvert005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsInvert006
     * @tc.name     testCommonAttrsInvert006
     * @tc.desc     testCommonAttrsInvert006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsInvert006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsInvert006()).assertEqual(0)
      done()
    })

  })
}
