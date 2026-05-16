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

export default function commonAttrsDirectionTest() {

  describe('CommonAttrsDirectionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsDirection001
     * @tc.name     testCommonAttrsDirection001
     * @tc.desc     testCommonAttrsDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDirection001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDirection002
     * @tc.name     testCommonAttrsDirection002
     * @tc.desc     testCommonAttrsDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDirection002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDirection003
     * @tc.name     testCommonAttrsDirection003
     * @tc.desc     testCommonAttrsDirection003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDirection003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDirection003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDirection004
     * @tc.name     testCommonAttrsDirection004
     * @tc.desc     testCommonAttrsDirection004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDirection004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDirection004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsDirection005
     * @tc.name     testCommonAttrsDirection005
     * @tc.desc     testCommonAttrsDirection005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsDirection005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsDirection005()).assertEqual(0)
      done()
    })

  })
}
