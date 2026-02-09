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

export default function geometryTransitionTest() {

  describe('GeometryTransitionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testGeometryTransition001
     * @tc.name     testGeometryTransition001
     * @tc.desc     testGeometryTransition001
     * @tc.level    Level.LEVEL1
     */
    it('testGeometryTransition001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGeometryTransition001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGeometryTransition002
     * @tc.name     testGeometryTransition002
     * @tc.desc     testGeometryTransition002
     * @tc.level    Level.LEVEL1
     */
    it('testGeometryTransition002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGeometryTransition002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGeometryTransition003
     * @tc.name     testGeometryTransition003
     * @tc.desc     testGeometryTransition003
     * @tc.level    Level.LEVEL1
     */
    it('testGeometryTransition003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGeometryTransition003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGeometryTransition004
     * @tc.name     testGeometryTransition004
     * @tc.desc     testGeometryTransition004
     * @tc.level    Level.LEVEL1
     */
    it('testGeometryTransition004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGeometryTransition004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testGeometryTransition005
     * @tc.name     testGeometryTransition005
     * @tc.desc     testGeometryTransition005
     * @tc.level    Level.LEVEL1
     */
    it('testGeometryTransition005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testGeometryTransition005()).assertEqual(0)
      done()
    })

  })
}
