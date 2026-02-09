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

export default function customComponentBorderWidthTest() {
  customComponentBorderWidthTest
  describe('CustomComponentBorderWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentBorderWidth001
     * @tc.name     testCustomComponentBorderWidth001
     * @tc.desc     testCustomComponentBorderWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderWidth002
     * @tc.name     testCustomComponentBorderWidth002
     * @tc.desc     testCustomComponentBorderWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderWidth003
     * @tc.name     testCustomComponentBorderWidth003
     * @tc.desc     testCustomComponentBorderWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderWidth003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentBorderWidth004
     * @tc.name     testCustomComponentBorderWidth004
     * @tc.desc     testCustomComponentBorderWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentBorderWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentBorderWidth004()).assertEqual(0)
      done()
    })

  })
}
