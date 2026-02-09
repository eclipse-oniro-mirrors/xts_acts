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

export default function commonAttrsAlignSelfTest() {

  describe('CommonAttrsAlignSelfTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf001
     * @tc.name     testCommonAttrsAlignSelf001
     * @tc.desc     testCommonAttrsAlignSelf001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf002
     * @tc.name     testCommonAttrsAlignSelf002
     * @tc.desc     testCommonAttrsAlignSelf002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf003
     * @tc.name     testCommonAttrsAlignSelf003
     * @tc.desc     testCommonAttrsAlignSelf003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf004
     * @tc.name     testCommonAttrsAlignSelf004
     * @tc.desc     testCommonAttrsAlignSelf004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf005
     * @tc.name     testCommonAttrsAlignSelf005
     * @tc.desc     testCommonAttrsAlignSelf005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCommonAttrsAlignSelf006
     * @tc.name     testCommonAttrsAlignSelf006
     * @tc.desc     testCommonAttrsAlignSelf006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsAlignSelf006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsAlignSelf006()).assertEqual(0)
      done();
    })
  })
}
