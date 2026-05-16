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

export default function scrollScrollBarTest() {

  describe('ScrollScrollBarTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollScrollBar001
     * @tc.name     testScrollScrollBar001
     * @tc.desc     testScrollScrollBar001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBar001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBar001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollBar002
     * @tc.name     testScrollScrollBar002
     * @tc.desc     testScrollScrollBar002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBar002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBar002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollBar003
     * @tc.name     testScrollScrollBar003
     * @tc.desc     testScrollScrollBar003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBar003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBar003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollBar004
     * @tc.name     testScrollScrollBar004
     * @tc.desc     testScrollScrollBar004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBar004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBar004()).assertEqual(0)
      done();
    });
  })
}
