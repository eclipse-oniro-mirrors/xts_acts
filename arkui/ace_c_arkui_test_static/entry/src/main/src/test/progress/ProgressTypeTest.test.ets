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

export default function progressTypeTest() {

  describe('ProgressTypeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testProgressType001
     * @tc.name     testProgressType001
     * @tc.desc     testProgressType001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType002
     * @tc.name     testProgressType002
     * @tc.desc     testProgressType002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType003
     * @tc.name     testProgressType003
     * @tc.desc     testProgressType003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType004
     * @tc.name     testProgressType004
     * @tc.desc     testProgressType004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType004()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType005
     * @tc.name     testProgressType005
     * @tc.desc     testProgressType005
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType005()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType006
     * @tc.name     testProgressType006
     * @tc.desc     testProgressType006
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType006()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType007
     * @tc.name     testProgressType007
     * @tc.desc     testProgressType007
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType007()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType008
     * @tc.name     testProgressType008
     * @tc.desc     testProgressType008
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType008()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressType009
     * @tc.name     testProgressType009
     * @tc.desc     testProgressType009
     * @tc.level    Level.LEVEL1
     */
    it('testProgressType009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressType009()).assertEqual(0)
      done();
    });
  })
}
