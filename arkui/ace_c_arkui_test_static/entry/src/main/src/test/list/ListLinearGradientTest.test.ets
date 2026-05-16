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

export default function listLinearGradientTest() {

  describe('ListLinearGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListLinearGradient001
     * @tc.name     testListLinearGradient001
     * @tc.desc     testListLinearGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient002
     * @tc.name     testListLinearGradient002
     * @tc.desc     testListLinearGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient003
     * @tc.name     testListLinearGradient003
     * @tc.desc     testListLinearGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient004
     * @tc.name     testListLinearGradient004
     * @tc.desc     testListLinearGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient005
     * @tc.name     testListLinearGradient005
     * @tc.desc     testListLinearGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient006
     * @tc.name     testListLinearGradient006
     * @tc.desc     testListLinearGradient006
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient007
     * @tc.name     testListLinearGradient007
     * @tc.desc     testListLinearGradient007
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient008
     * @tc.name     testListLinearGradient008
     * @tc.desc     testListLinearGradient008
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient009
     * @tc.name     testListLinearGradient009
     * @tc.desc     testListLinearGradient009
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListLinearGradient010
     * @tc.name     testListLinearGradient010
     * @tc.desc     testListLinearGradient010
     * @tc.level    Level.LEVEL1
     */
    it('testListLinearGradient010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListLinearGradient010()).assertEqual(0)
      done()
    })
  })
}
