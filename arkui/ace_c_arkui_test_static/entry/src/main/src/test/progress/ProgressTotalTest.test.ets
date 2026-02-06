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

export default function progressTotalTest() {

  describe('ProgressTotalTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testProgressTotal001
     * @tc.name     testProgressTotal001
     * @tc.desc     testProgressTotal001
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressTotal002
     * @tc.name     testProgressTotal002
     * @tc.desc     testProgressTotal002
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressTotal003
     * @tc.name     testProgressTotal003
     * @tc.desc     testProgressTotal003
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressTotal004
     * @tc.name     testProgressTotal004
     * @tc.desc     testProgressTotal004
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal004()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressTotal005
     * @tc.name     testProgressTotal005
     * @tc.desc     testProgressTotal005
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal005()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testProgressTotal006
     * @tc.name     testProgressTotal006
     * @tc.desc     testProgressTotal006
     * @tc.level    Level.LEVEL1
     */
    it('testProgressTotal006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testProgressTotal006()).assertEqual(0)
      done();
    });
  })
}
