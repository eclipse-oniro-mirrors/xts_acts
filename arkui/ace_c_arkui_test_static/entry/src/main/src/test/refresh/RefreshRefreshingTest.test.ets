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
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

export default function refreshRefreshingTest() {

  describe('RefreshRefreshingTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testRefreshRefreshing001
     * @tc.name     testRefreshRefreshing001
     * @tc.desc     testRefreshRefreshing001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshRefreshing001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshRefreshing001()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshRefreshing002
     * @tc.name     testRefreshRefreshing002
     * @tc.desc     testRefreshRefreshing002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshRefreshing002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshRefreshing002()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshRefreshing003
     * @tc.name     testRefreshRefreshing003
     * @tc.desc     testRefreshRefreshing003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshRefreshing003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshRefreshing003()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshRefreshing004
     * @tc.name     testRefreshRefreshing004
     * @tc.desc     testRefreshRefreshing004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshRefreshing004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshRefreshing004()).assertEqual(0)
      done();
    })
  })
}
