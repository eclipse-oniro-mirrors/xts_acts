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

export default function refreshPullDownRatioTest() {

  describe('RefreshPullDownRatioTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testRefreshPullDownRatio001
     * @tc.name     testRefreshPullDownRatio001
     * @tc.desc     testRefreshPullDownRatio001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio001()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio002
     * @tc.name     testRefreshPullDownRatio002
     * @tc.desc     testRefreshPullDownRatio002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio002()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio003
     * @tc.name     testRefreshPullDownRatio003
     * @tc.desc     testRefreshPullDownRatio003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio003()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio004
     * @tc.name     testRefreshPullDownRatio004
     * @tc.desc     testRefreshPullDownRatio004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio004()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio005
     * @tc.name     testRefreshPullDownRatio005
     * @tc.desc     testRefreshPullDownRatio005
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio005()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio006
     * @tc.name     testRefreshPullDownRatio006
     * @tc.desc     testRefreshPullDownRatio006
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio006()).assertEqual(0)
      done();
    })


    
    /**
     * @tc.number   testRefreshPullDownRatio007
     * @tc.name     testRefreshPullDownRatio007
     * @tc.desc     testRefreshPullDownRatio007
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshPullDownRatio007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshPullDownRatio007()).assertEqual(0)
      done();
    })
  })
}
