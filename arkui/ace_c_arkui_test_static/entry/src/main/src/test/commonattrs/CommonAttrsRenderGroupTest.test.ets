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

export default function commonAttrsRenderGroupTest() {

  describe('CommonAttrsRenderGroupTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsRenderGroup001
     * @tc.name     testCommonAttrsRenderGroup001
     * @tc.desc     testCommonAttrsRenderGroup001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRenderGroup001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRenderGroup001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRenderGroup002
     * @tc.name     testCommonAttrsRenderGroup002
     * @tc.desc     testCommonAttrsRenderGroup002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRenderGroup002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRenderGroup002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRenderGroup003
     * @tc.name     testCommonAttrsRenderGroup003
     * @tc.desc     testCommonAttrsRenderGroup003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRenderGroup003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRenderGroup003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsRenderGroup004
     * @tc.name     testCommonAttrsRenderGroup004
     * @tc.desc     testCommonAttrsRenderGroup004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsRenderGroup004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsRenderGroup004()).assertEqual(0)
      done()
    })
  })
}