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

export default function customComponentMarginTest() {

  describe('CustomComponentMarginTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentMargin001
     * @tc.name     testCustomComponentMargin001
     * @tc.desc     testCustomComponentMargin001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentMargin001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentMargin001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentMargin002
     * @tc.name     testCustomComponentMargin002
     * @tc.desc     testCustomComponentMargin002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentMargin002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentMargin002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentMargin003
     * @tc.name     testCustomComponentMargin003
     * @tc.desc     testCustomComponentMargin003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentMargin003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentMargin003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentMargin004
     * @tc.name     testCustomComponentMargin004
     * @tc.desc     testCustomComponentMargin004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentMargin004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentMargin004()).assertEqual(0)
      done()
    })

  })
}
