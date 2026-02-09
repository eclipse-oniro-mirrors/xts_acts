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

export default function commonAttrsTransformTest() {

  describe('CommonAttrsTransformTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransform001
     * @tc.name     testCommonAttrsTransform001
     * @tc.desc     testCommonAttrsTransform001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransform001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransform001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransform002
     * @tc.name     testCommonAttrsTransform002
     * @tc.desc     testCommonAttrsTransform002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransform002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransform002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransform003
     * @tc.name     testCommonAttrsTransform003
     * @tc.desc     testCommonAttrsTransform003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransform003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransform003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransform004
     * @tc.name     testCommonAttrsTransform004
     * @tc.desc     testCommonAttrsTransform004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransform004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransform004()).assertEqual(0)
      done()
    })
  })
}
