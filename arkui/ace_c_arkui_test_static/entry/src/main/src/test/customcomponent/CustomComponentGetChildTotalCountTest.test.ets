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

export default function customComponentGetChildTotalCountTest() {

  describe('customComponentGetChildTotalCountTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentGetChildTotalCount001
     * @tc.name     testCustomComponentGetChildTotalCount001
     * @tc.desc     testCustomComponentGetChildTotalCount001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildTotalCount001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildTotalCount001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetChildTotalCount002
     * @tc.name     testCustomComponentGetChildTotalCount002
     * @tc.desc     testCustomComponentGetChildTotalCount002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildTotalCount002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildTotalCount002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetChildTotalCount003
     * @tc.name     testCustomComponentGetChildTotalCount003
     * @tc.desc     testCustomComponentGetChildTotalCount003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildTotalCount003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildTotalCount003()).assertEqual(0)
      done()
    })    
  })
}
