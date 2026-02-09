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

export default function scrollScrollSnapTest() {

  describe('ScrollScrollSnapTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollScrollSnap001
     * @tc.name     testScrollScrollSnap001
     * @tc.desc     testScrollScrollSnap001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollSnap001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollSnap001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollSnap002
     * @tc.name     testScrollScrollSnap002
     * @tc.desc     testScrollScrollSnap002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollSnap002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollSnap002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollSnap003
     * @tc.name     testScrollScrollSnap003
     * @tc.desc     testScrollScrollSnap003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollSnap003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollSnap003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollSnap004
     * @tc.name     testScrollScrollSnap004
     * @tc.desc     testScrollScrollSnap004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollSnap004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollSnap004()).assertEqual(0)
      done();
    });
  })
}
