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

export default function commonAttrsTransitionEffectRotateTest() {

  describe('CommonAttrsTransitionEffectRotateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate001
     * @tc.name     testCommonAttrsTransitionRotate001
     * @tc.desc     testCommonAttrsTransitionRotate001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate002
     * @tc.name     testCommonAttrsTransitionRotate002
     * @tc.desc     testCommonAttrsTransitionRotate002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate003
     * @tc.name     testCommonAttrsTransitionRotate003
     * @tc.desc     testCommonAttrsTransitionRotate003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate004
     * @tc.name     testCommonAttrsTransitionRotate004
     * @tc.desc     testCommonAttrsTransitionRotate004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate005
     * @tc.name     testCommonAttrsTransitionRotate005
     * @tc.desc     testCommonAttrsTransitionRotate005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate006
     * @tc.name     testCommonAttrsTransitionRotate006
     * @tc.desc     testCommonAttrsTransitionRotate006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate007
     * @tc.name     testCommonAttrsTransitionRotate007
     * @tc.desc     testCommonAttrsTransitionRotate007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionRotate008
     * @tc.name     testCommonAttrsTransitionRotate008
     * @tc.desc     testCommonAttrsTransitionRotate008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionRotate008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionRotate008()).assertEqual(0)
      done()
    })
  })
}