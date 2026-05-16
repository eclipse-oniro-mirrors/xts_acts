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

export default function gridRowsGapTest() {

  describe('GridRowsGapTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testGridRowsGap001
     * @tc.name     testGridRowsGap001
     * @tc.desc     testGridRowsGap001
     * @tc.level    Level.LEVEL1
     */
    it('testGridRowsGap001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridRowsGap001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testGridRowsGap002
     * @tc.name     testGridRowsGap002
     * @tc.desc     testGridRowsGap002
     * @tc.level    Level.LEVEL1
     */
    it('testGridRowsGap002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridRowsGap002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testGridRowsGap003
     * @tc.name     testGridRowsGap003
     * @tc.desc     testGridRowsGap003
     * @tc.level    Level.LEVEL1
     */
    it('testGridRowsGap003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridRowsGap003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testGridRowsGap004
     * @tc.name     testGridRowsGap004
     * @tc.desc     testGridRowsGap004
     * @tc.level    Level.LEVEL1
     */
    it('testGridRowsGap004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGridRowsGap004()).assertEqual(0)
      done();
    })

  })
}
