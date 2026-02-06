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

export default function lazyForEachSetTotalNodeCountTest() {

  describe('LazyForEachSetTotalNodeCountTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testLazyForEachSetTotalNodeCount001
     * @tc.name     testLazyForEachSetTotalNodeCount001
     * @tc.desc     testLazyForEachSetTotalNodeCount001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachSetTotalNodeCount001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachSetTotalNodeCount001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachSetTotalNodeCount002
     * @tc.name     testLazyForEachSetTotalNodeCount002
     * @tc.desc     testLazyForEachSetTotalNodeCount002
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachSetTotalNodeCount002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachSetTotalNodeCount002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testLazyForEachSetTotalNodeCount003
     * @tc.name     testLazyForEachSetTotalNodeCount003
     * @tc.desc     testLazyForEachSetTotalNodeCount003
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachSetTotalNodeCount003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testLazyForEachSetTotalNodeCount003()).assertEqual(0)
      done()
    })

  })
}