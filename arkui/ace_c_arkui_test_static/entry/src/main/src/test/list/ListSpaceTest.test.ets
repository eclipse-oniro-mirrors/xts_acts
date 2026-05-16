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

export default function listSpaceTest() {

  describe('ListSpaceTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });
    
    
/**
     * @tc.number   testListSpace001
     * @tc.name     testListSpace001
     * @tc.desc     testListSpace001
     * @tc.level    Level.LEVEL1
     */
    it('testListSpace001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSpace001()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListSpace002
     * @tc.name     testListSpace002
     * @tc.desc     testListSpace002
     * @tc.level    Level.LEVEL1
     */
    it('testListSpace002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSpace002()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListSpace003
     * @tc.name     testListSpace003
     * @tc.desc     testListSpace003
     * @tc.level    Level.LEVEL1
     */
    it('testListSpace003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSpace003()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListSpace004
     * @tc.name     testListSpace004
     * @tc.desc     testListSpace004
     * @tc.level    Level.LEVEL1
     */
    it('testListSpace004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSpace004()).assertEqual(0)
      done()
    })
    
    
/**
     * @tc.number   testListSpace005
     * @tc.name     testListSpace005
     * @tc.desc     testListSpace005
     * @tc.level    Level.LEVEL1
     */
    it('testListSpace005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testListSpace005()).assertEqual(0)
      done()
    })
  })
}
