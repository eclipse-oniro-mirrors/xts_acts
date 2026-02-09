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

export default function scrollScrollBarColorTest() {

  describe('ScrollScrollBarColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollScrollBarColor001
     * @tc.name     testScrollScrollBarColor001
     * @tc.desc     testScrollScrollBarColor001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBarColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBarColor001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollBarColor002
     * @tc.name     testScrollScrollBarColor002
     * @tc.desc     testScrollScrollBarColor002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBarColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBarColor002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollScrollBarColor003
     * @tc.name     testScrollScrollBarColor003
     * @tc.desc     testScrollScrollBarColor003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollScrollBarColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollScrollBarColor003()).assertEqual(0)
      done();
    });
  })
}
