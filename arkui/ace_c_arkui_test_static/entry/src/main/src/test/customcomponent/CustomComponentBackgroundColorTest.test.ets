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

export default function customComponentBackgroundColorTest() {

  describe('CustomComponentBackgroundColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentBackgroundColor001
     * @tc.name     testCustomComponentBackgroundColor001
     * @tc.desc     testCustomComponentBackgroundColor001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBackgroundColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBackgroundColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBackgroundColor002
     * @tc.name     testCustomComponentBackgroundColor002
     * @tc.desc     testCustomComponentBackgroundColor002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBackgroundColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBackgroundColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBackgroundColor003
     * @tc.name     testCustomComponentBackgroundColor003
     * @tc.desc     testCustomComponentBackgroundColor003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBackgroundColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBackgroundColor003()).assertEqual(0)
      done()
    })
  })
}
