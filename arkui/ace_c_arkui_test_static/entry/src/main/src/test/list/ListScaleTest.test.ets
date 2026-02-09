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

export default function listScaleTest() {

  describe('ListScaleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testListScale001
     * @tc.name     testListScale001
     * @tc.desc     testListScale001
     * @tc.level    Level.LEVEL1
     */
    it('testListScale001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScale001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListScale002
     * @tc.name     testListScale002
     * @tc.desc     testListScale002
     * @tc.level    Level.LEVEL1
     */
    it('testListScale002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScale002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListScale003
     * @tc.name     testListScale003
     * @tc.desc     testListScale003
     * @tc.level    Level.LEVEL1
     */
    it('testListScale003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScale003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListScale004
     * @tc.name     testListScale004
     * @tc.desc     testListScale004
     * @tc.level    Level.LEVEL1
     */
    it('testListScale004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScale004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testListScale005
     * @tc.name     testListScale005
     * @tc.desc     testListScale005
     * @tc.level    Level.LEVEL1
     */
    it('testListScale005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListScale005()).assertEqual(0)
      done()
    })
  })
}
