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

export default function refreshOffsetTest() {

  describe('RefreshOffsetTest', () => {

    beforeAll(async () => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    beforeEach(async () => {
      await Utils.sleep(100);
    })

    
    
/**
     * @tc.number   testRefreshOffset001
     * @tc.name     testRefreshOffset001
     * @tc.desc     testRefreshOffset001
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshOffset001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshOffset001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRefreshOffset002
     * @tc.name     testRefreshOffset002
     * @tc.desc     testRefreshOffset002
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshOffset002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshOffset002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRefreshOffset003
     * @tc.name     testRefreshOffset003
     * @tc.desc     testRefreshOffset003
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshOffset003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshOffset003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testRefreshOffset004
     * @tc.name     testRefreshOffset004
     * @tc.desc     testRefreshOffset004
     * @tc.level    Level.LEVEL1
     */
    it('testRefreshOffset004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testRefreshOffset004()).assertEqual(0)
      done();
    })

  })
}
