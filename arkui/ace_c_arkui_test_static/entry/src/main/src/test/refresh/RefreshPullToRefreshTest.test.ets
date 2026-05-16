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

export default function refreshPullToRefreshTest() {

  describe('RefreshPullToRefreshTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testRefreshPullToRefresh001
     * @tc.name     testRefreshPullToRefresh001
     * @tc.desc     testRefreshPullToRefresh001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh001()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullToRefresh002
     * @tc.name     testRefreshPullToRefresh002
     * @tc.desc     testRefreshPullToRefresh002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh002()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullToRefresh003
     * @tc.name     testRefreshPullToRefresh003
     * @tc.desc     testRefreshPullToRefresh003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh003()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullToRefresh004
     * @tc.name     testRefreshPullToRefresh004
     * @tc.desc     testRefreshPullToRefresh004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh004()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullToRefresh005
     * @tc.name     testRefreshPullToRefresh005
     * @tc.desc     testRefreshPullToRefresh005
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh005()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullToRefresh006
     * @tc.name     testRefreshPullToRefresh006
     * @tc.desc     testRefreshPullToRefresh006
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullToRefresh006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullToRefresh006()).assertEqual(0)
      done();
    })
  })
}
