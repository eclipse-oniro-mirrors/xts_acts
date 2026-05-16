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

export default function progressValueTest() {

  describe('ProgressValueTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testProgressValue001
     * @tc.name     testProgressValue001
     * @tc.desc     testProgressValue001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressValue002
     * @tc.name     testProgressValue002
     * @tc.desc     testProgressValue002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressValue003
     * @tc.name     testProgressValue003
     * @tc.desc     testProgressValue003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue003()).assertEqual(0)
      done();
    });

        
    
/**
     * @tc.number   testProgressValue004
     * @tc.name     testProgressValue004
     * @tc.desc     testProgressValue004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue004()).assertEqual(0)
      done();
    });

        
    
/**
     * @tc.number   testProgressValue005
     * @tc.name     testProgressValue005
     * @tc.desc     testProgressValue005
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue005()).assertEqual(0)
      done();
    });

        
    
/**
     * @tc.number   testProgressValue006
     * @tc.name     testProgressValue006
     * @tc.desc     testProgressValue006
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue006()).assertEqual(0)
      done();
    });

        
    
/**
     * @tc.number   testProgressValue007
     * @tc.name     testProgressValue007
     * @tc.desc     testProgressValue007
     * @tc.level    Level.LEVEL1
     */
    it('testProgressValue007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressValue007()).assertEqual(0)
      done();
    });
  })
}
