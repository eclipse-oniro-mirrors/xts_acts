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

export default function commonAttrsMarginTest() {

  describe('CommonAttrsMarginTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsMargin001
     * @tc.name     testCommonAttrsMargin001
     * @tc.desc     testCommonAttrsMargin001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMargin001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMargin001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMargin002
     * @tc.name     testCommonAttrsMargin002
     * @tc.desc     testCommonAttrsMargin002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMargin002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMargin002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMargin003
     * @tc.name     testCommonAttrsMargin003
     * @tc.desc     testCommonAttrsMargin003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMargin003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMargin003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsMargin004
     * @tc.name     testCommonAttrsMargin004
     * @tc.desc     testCommonAttrsMargin004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsMargin004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsMargin004()).assertEqual(0)
      done()
    })

  })
}
