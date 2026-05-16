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

export default function listItemLinearGradientTest() {

  describe('ListItemLinearGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListItemLinearGradient001
     * @tc.name     testListItemLinearGradient001
     * @tc.desc     testListItemLinearGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient002
     * @tc.name     testListItemLinearGradient002
     * @tc.desc     testListItemLinearGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient003
     * @tc.name     testListItemLinearGradient003
     * @tc.desc     testListItemLinearGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient004
     * @tc.name     testListItemLinearGradient004
     * @tc.desc     testListItemLinearGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient005
     * @tc.name     testListItemLinearGradient005
     * @tc.desc     testListItemLinearGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient006
     * @tc.name     testListItemLinearGradient006
     * @tc.desc     testListItemLinearGradient006
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient007
     * @tc.name     testListItemLinearGradient007
     * @tc.desc     testListItemLinearGradient007
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient008
     * @tc.name     testListItemLinearGradient008
     * @tc.desc     testListItemLinearGradient008
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient009
     * @tc.name     testListItemLinearGradient009
     * @tc.desc     testListItemLinearGradient009
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListItemLinearGradient010
     * @tc.name     testListItemLinearGradient010
     * @tc.desc     testListItemLinearGradient010
     * @tc.level    Level.LEVEL1
     */
    it('testListItemLinearGradient010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListItemLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
