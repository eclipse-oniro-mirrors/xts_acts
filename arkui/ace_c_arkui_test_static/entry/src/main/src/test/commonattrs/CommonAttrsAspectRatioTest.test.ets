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

export default function commonAttrsAspectRatioTest() {

  describe('CommonAttrsAspectRatioTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAspectRatioTest001
     * @tc.name     testCommonAttrsAspectRatioTest001
     * @tc.desc     testCommonAttrsAspectRatioTest001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAspectRatioTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAspectRatioTest001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAspectRatioTest002
     * @tc.name     testCommonAttrsAspectRatioTest002
     * @tc.desc     testCommonAttrsAspectRatioTest002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAspectRatioTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAspectRatioTest002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAspectRatioTest003
     * @tc.name     testCommonAttrsAspectRatioTest003
     * @tc.desc     testCommonAttrsAspectRatioTest003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAspectRatioTest003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAspectRatioTest003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsAspectRatioTest004
     * @tc.name     testCommonAttrsAspectRatioTest004
     * @tc.desc     testCommonAttrsAspectRatioTest004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAspectRatioTest004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAspectRatioTest004()).assertEqual(0)
      done()
    })
  })
}