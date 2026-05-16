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

export default function commonAttrsTransitionTranslateTest() {

  describe('CommonAttrsTransitionTranslateTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate001
     * @tc.name     testCommonAttrsTransitionTranslate001
     * @tc.desc     testCommonAttrsTransitionTranslate001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate002
     * @tc.name     testCommonAttrsTransitionTranslate002
     * @tc.desc     testCommonAttrsTransitionTranslate002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate003
     * @tc.name     testCommonAttrsTransitionTranslate003
     * @tc.desc     testCommonAttrsTransitionTranslate003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate004
     * @tc.name     testCommonAttrsTransitionTranslate004
     * @tc.desc     testCommonAttrsTransitionTranslate004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate005
     * @tc.name     testCommonAttrsTransitionTranslate005
     * @tc.desc     testCommonAttrsTransitionTranslate005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate006
     * @tc.name     testCommonAttrsTransitionTranslate006
     * @tc.desc     testCommonAttrsTransitionTranslate006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate007
     * @tc.name     testCommonAttrsTransitionTranslate007
     * @tc.desc     testCommonAttrsTransitionTranslate007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransitionTranslate008
     * @tc.name     testCommonAttrsTransitionTranslate008
     * @tc.desc     testCommonAttrsTransitionTranslate008
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransitionTranslate008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransitionTranslate008()).assertEqual(0)
      done()
    })
    
  })
}