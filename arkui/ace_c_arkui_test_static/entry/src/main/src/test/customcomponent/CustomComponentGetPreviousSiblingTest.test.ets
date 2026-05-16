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

export default function customComponentGetPreviousSiblingTest() {

  describe('customComponentGetPreviousSiblingTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentGetPreviousSibling001
     * @tc.name     testCustomComponentGetPreviousSibling001
     * @tc.desc     testCustomComponentGetPreviousSibling001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetPreviousSibling001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetPreviousSibling001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetPreviousSibling002
     * @tc.name     testCustomComponentGetPreviousSibling002
     * @tc.desc     testCustomComponentGetPreviousSibling002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetPreviousSibling002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetPreviousSibling002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetPreviousSibling003
     * @tc.name     testCustomComponentGetPreviousSibling003
     * @tc.desc     testCustomComponentGetPreviousSibling003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetPreviousSibling003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetPreviousSibling003()).assertEqual(0)
      done()
    })                
  })
}
