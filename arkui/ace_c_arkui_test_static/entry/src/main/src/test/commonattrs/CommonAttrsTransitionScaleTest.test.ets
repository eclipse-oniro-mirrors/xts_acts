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

export default function commonAttrsTransitionEffectScaleTest() {

  describe('CommonAttrsTransitionEffectScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale001
     * @tc.name     testCommonAttrsTransitionScale001
     * @tc.desc     testCommonAttrsTransitionScale001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale002
     * @tc.name     testCommonAttrsTransitionScale002
     * @tc.desc     testCommonAttrsTransitionScale002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale002()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale003
     * @tc.name     testCommonAttrsTransitionScale003
     * @tc.desc     testCommonAttrsTransitionScale003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale003()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale004
     * @tc.name     testCommonAttrsTransitionScale004
     * @tc.desc     testCommonAttrsTransitionScale004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale004()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale005
     * @tc.name     testCommonAttrsTransitionScale005
     * @tc.desc     testCommonAttrsTransitionScale005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale005()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale006
     * @tc.name     testCommonAttrsTransitionScale006
     * @tc.desc     testCommonAttrsTransitionScale006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale006', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale006()).assertEqual(0)
        done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionScale007
     * @tc.name     testCommonAttrsTransitionScale007
     * @tc.desc     testCommonAttrsTransitionScale007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionScale007', Level.LEVEL1, async (done: () => void): Promise<void> => {
        expect(libUtil.testCommonAttrsTransitionScale007()).assertEqual(0)
        done()
    })
  })
}