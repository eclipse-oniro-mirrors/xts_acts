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

export default function customComponentHeightTest() {

  describe('CustomComponentHeightTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentHeight001
     * @tc.name     testCustomComponentHeight001
     * @tc.desc     testCustomComponentHeight001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentHeight001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentHeight001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentHeight002
     * @tc.name     testCustomComponentHeight002
     * @tc.desc     testCustomComponentHeight002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentHeight002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentHeight002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentHeight003
     * @tc.name     testCustomComponentHeight003
     * @tc.desc     testCustomComponentHeight003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentHeight003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentHeight003()).assertEqual(0)
      done()
    })
  })
}
