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

export default function buttonBackgroundColorTest() {

  describe('ButtonBackgroundColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testButtonBackgroundColor001
     * @tc.name     testButtonBackgroundColor001
     * @tc.desc     testButtonBackgroundColor001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonBackgroundColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonBackgroundColor001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testButtonBackgroundColor002
     * @tc.name     testButtonBackgroundColor002
     * @tc.desc     testButtonBackgroundColor002
     * @tc.level    Level.LEVEL1
     */
    it('testButtonBackgroundColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonBackgroundColor002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testButtonBackgroundColor003
     * @tc.name     testButtonBackgroundColor003
     * @tc.desc     testButtonBackgroundColor003
     * @tc.level    Level.LEVEL1
     */
    it('testButtonBackgroundColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testButtonBackgroundColor003()).assertEqual(0)
      done();
    })
  })
}
