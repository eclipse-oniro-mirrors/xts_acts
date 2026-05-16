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

export default function scrollLinearGradientTest() {

  describe('ScrollLinearGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    /*
     * @tc.number   testScrollLinearGradient001
     * @tc.name     testScrollLinearGradient001
     * @tc.desc     testScrollLinearGradient001
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient001()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient002
     * @tc.name     testScrollLinearGradient002
     * @tc.desc     testScrollLinearGradient002
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient002()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient003
     * @tc.name     testScrollLinearGradient003
     * @tc.desc     testScrollLinearGradient003
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient003()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient004
     * @tc.name     testScrollLinearGradient004
     * @tc.desc     testScrollLinearGradient004
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient004()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient005
     * @tc.name     testScrollLinearGradient005
     * @tc.desc     testScrollLinearGradient005
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient005()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient006
     * @tc.name     testScrollLinearGradient006
     * @tc.desc     testScrollLinearGradient006
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient006()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient007
     * @tc.name     testScrollLinearGradient007
     * @tc.desc     testScrollLinearGradient007
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient007()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient008
     * @tc.name     testScrollLinearGradient008
     * @tc.desc     testScrollLinearGradient008
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient008()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient009
     * @tc.name     testScrollLinearGradient009
     * @tc.desc     testScrollLinearGradient009
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient009()).assertEqual(0)
      done();
    });

    
    /*
     * @tc.number   testScrollLinearGradient010
     * @tc.name     testScrollLinearGradient010
     * @tc.desc     testScrollLinearGradient010
     * @tc.level    Level.LEVEL1
     */
it('testScrollLinearGradient010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollLinearGradient010()).assertEqual(0)
      done();
    });
  })
}
