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

export default function scrollOpacityTest() {

  describe('ScrollOpacityTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollOpacity001
     * @tc.name     testScrollOpacity001
     * @tc.desc     testScrollOpacity001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOpacity001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOpacity001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOpacity002
     * @tc.name     testScrollOpacity002
     * @tc.desc     testScrollOpacity002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOpacity002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOpacity002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOpacity003
     * @tc.name     testScrollOpacity003
     * @tc.desc     testScrollOpacity003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOpacity003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOpacity003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollOpacity004
     * @tc.name     testScrollOpacity004
     * @tc.desc     testScrollOpacity004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollOpacity004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollOpacity004()).assertEqual(0)
      done();
    });
  })
}
