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

export default function customComponentDirectionTest() {

  describe('CustomComponentDirectionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentDirection001
     * @tc.name     testCustomComponentDirection001
     * @tc.desc     testCustomComponentDirection001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentDirection001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentDirection001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentDirection002
     * @tc.name     testCustomComponentDirection002
     * @tc.desc     testCustomComponentDirection002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentDirection002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentDirection002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentDirection003
     * @tc.name     testCustomComponentDirection003
     * @tc.desc     testCustomComponentDirection003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentDirection003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentDirection003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentDirection004
     * @tc.name     testCustomComponentDirection004
     * @tc.desc     testCustomComponentDirection004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentDirection004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentDirection004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentDirection005
     * @tc.name     testCustomComponentDirection005
     * @tc.desc     testCustomComponentDirection005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentDirection005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentDirection005()).assertEqual(0)
      done()
    })

  })
}
