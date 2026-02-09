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

export default function scrollBarWidthTest() {

  describe('ScrollBarWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollBarWidth001
     * @tc.name     testScrollBarWidth001
     * @tc.desc     testScrollBarWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBarWidth002
     * @tc.name     testScrollBarWidth002
     * @tc.desc     testScrollBarWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBarWidth003
     * @tc.name     testScrollBarWidth003
     * @tc.desc     testScrollBarWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBarWidth004
     * @tc.name     testScrollBarWidth004
     * @tc.desc     testScrollBarWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth004()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBarWidth005
     * @tc.name     testScrollBarWidth005
     * @tc.desc     testScrollBarWidth005
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth005()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollBarWidth006
     * @tc.name     testScrollBarWidth006
     * @tc.desc     testScrollBarWidth006
     * @tc.level    Level.LEVEL1
     */
    it('testScrollBarWidth006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollBarWidth006()).assertEqual(0)
      done();
    });

  })
}
