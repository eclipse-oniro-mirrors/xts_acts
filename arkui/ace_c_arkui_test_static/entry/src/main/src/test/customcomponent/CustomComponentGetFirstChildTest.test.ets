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

export default function customComponentGetFirstChildTest() {

  describe('customComponentGetFirstChildTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentGetFirstChild001
     * @tc.name     testCustomComponentGetFirstChild001
     * @tc.desc     testCustomComponentGetFirstChild001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetFirstChild001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetFirstChild001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetFirstChild002
     * @tc.name     testCustomComponentGetFirstChild002
     * @tc.desc     testCustomComponentGetFirstChild002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetFirstChild002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetFirstChild002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testCustomComponentGetFirstChild003
     * @tc.name     testCustomComponentGetFirstChild003
     * @tc.desc     testCustomComponentGetFirstChild003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentGetFirstChild003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentGetFirstChild003()).assertEqual(0)
      done()
    })           
  })
}
