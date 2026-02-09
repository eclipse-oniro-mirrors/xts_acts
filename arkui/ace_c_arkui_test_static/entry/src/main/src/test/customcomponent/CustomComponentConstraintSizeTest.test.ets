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

export default function customComponentConstraintSizeTest() {

  describe('CustomComponentConstraintSizeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentConstraintSize001
     * @tc.name     testCustomComponentConstraintSize001
     * @tc.desc     testCustomComponentConstraintSize001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentConstraintSize001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentConstraintSize001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentConstraintSize002
     * @tc.name     testCustomComponentConstraintSize002
     * @tc.desc     testCustomComponentConstraintSize002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentConstraintSize002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentConstraintSize002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentConstraintSize003
     * @tc.name     testCustomComponentConstraintSize003
     * @tc.desc     testCustomComponentConstraintSize003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentConstraintSize003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentConstraintSize003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentConstraintSize004
     * @tc.name     testCustomComponentConstraintSize004
     * @tc.desc     testCustomComponentConstraintSize004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentConstraintSize004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentConstraintSize004()).assertEqual(0)
      done()
    })
  })
}
