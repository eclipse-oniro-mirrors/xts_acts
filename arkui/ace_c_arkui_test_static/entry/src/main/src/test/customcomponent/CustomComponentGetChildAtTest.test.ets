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

export default function customComponentGetChildAtTest() {

  describe('customComponentGetChildAtTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentGetChildAt001
     * @tc.name     testCustomComponentGetChildAt001
     * @tc.desc     testCustomComponentGetChildAt001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildAt001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildAt001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetChildAt002
     * @tc.name     testCustomComponentGetChildAt002
     * @tc.desc     testCustomComponentGetChildAt002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildAt002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildAt002()).assertEqual(0)
      done()
    }) 
    
    
/**
     * @tc.number   testCustomComponentGetChildAt003
     * @tc.name     testCustomComponentGetChildAt003
     * @tc.desc     testCustomComponentGetChildAt003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildAt003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildAt003()).assertEqual(0)
      done()
    }) 
    
    
/**
     * @tc.number   testCustomComponentGetChildAt004
     * @tc.name     testCustomComponentGetChildAt004
     * @tc.desc     testCustomComponentGetChildAt004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetChildAt004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetChildAt004()).assertEqual(0)
      done()
    })        
  })
}
