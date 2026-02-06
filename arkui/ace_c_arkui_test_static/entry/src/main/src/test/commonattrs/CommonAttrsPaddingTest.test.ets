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

export default function commonAttrsPaddingTest() {

  describe('CommonAttrsPaddingTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsPadding001
     * @tc.name     testCommonAttrsPadding001
     * @tc.desc     testCommonAttrsPadding001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsPadding001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsPadding001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsPadding002
     * @tc.name     testCommonAttrsPadding002
     * @tc.desc     testCommonAttrsPadding002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsPadding002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsPadding002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsPadding003
     * @tc.name     testCommonAttrsPadding003
     * @tc.desc     testCommonAttrsPadding003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsPadding003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsPadding003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsPadding004
     * @tc.name     testCommonAttrsPadding004
     * @tc.desc     testCommonAttrsPadding004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsPadding004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsPadding004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsPadding005
     * @tc.name     testCommonAttrsPadding005
     * @tc.desc     testCommonAttrsPadding005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsPadding005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsPadding005()).assertEqual(0)
      done()
    })
  })
}
