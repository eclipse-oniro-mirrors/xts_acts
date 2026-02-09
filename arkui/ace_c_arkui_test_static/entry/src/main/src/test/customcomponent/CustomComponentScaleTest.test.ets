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

export default function customComponentScaleTest() {

  describe('CustomComponentScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentScale001
     * @tc.name     testCustomComponentScale001
     * @tc.desc     testCustomComponentScale001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentScale002
     * @tc.name     testCustomComponentScale002
     * @tc.desc     testCustomComponentScale002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentScale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentScale003
     * @tc.name     testCustomComponentScale003
     * @tc.desc     testCustomComponentScale003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentScale003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentScale004
     * @tc.name     testCustomComponentScale004
     * @tc.desc     testCustomComponentScale004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentScale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentScale004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentScale005
     * @tc.name     testCustomComponentScale005
     * @tc.desc     testCustomComponentScale005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentScale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentScale005()).assertEqual(0)
      done()
    })
  })
}
