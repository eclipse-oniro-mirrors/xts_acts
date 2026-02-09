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
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function commonAttrsTransitionEffectMoveTest() {

  describe('CommonAttrsTransitionEffectMoveTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove001
     * @tc.name     testCommonAttrsTransitionMove001
     * @tc.desc     testCommonAttrsTransitionMove001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionMove001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove002
     * @tc.name     testCommonAttrsTransitionMove002
     * @tc.desc     testCommonAttrsTransitionMove002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove002', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove002()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove003
     * @tc.name     testCommonAttrsTransitionMove003
     * @tc.desc     testCommonAttrsTransitionMove003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove003', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove003()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove004
     * @tc.name     testCommonAttrsTransitionMove004
     * @tc.desc     testCommonAttrsTransitionMove004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove004', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove004()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove005
     * @tc.name     testCommonAttrsTransitionMove005
     * @tc.desc     testCommonAttrsTransitionMove005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove005', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove005()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove006
     * @tc.name     testCommonAttrsTransitionMove006
     * @tc.desc     testCommonAttrsTransitionMove006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove006', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove006()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionMove007
     * @tc.name     testCommonAttrsTransitionMove007
     * @tc.desc     testCommonAttrsTransitionMove007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionMove007', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionMove007()).assertEqual(0)
        done()
    })
  })
}