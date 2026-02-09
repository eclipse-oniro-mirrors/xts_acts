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

export default function commonAttrsBorderWidthTest() {
  commonAttrsBorderWidthTest
  describe('CommonAttrsBorderWidthTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBorderWidth001
     * @tc.name     testCommonAttrsBorderWidth001
     * @tc.desc     testCommonAttrsBorderWidth001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderWidth001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderWidth001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderWidth002
     * @tc.name     testCommonAttrsBorderWidth002
     * @tc.desc     testCommonAttrsBorderWidth002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderWidth002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderWidth002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderWidth003
     * @tc.name     testCommonAttrsBorderWidth003
     * @tc.desc     testCommonAttrsBorderWidth003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderWidth003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderWidth003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderWidth004
     * @tc.name     testCommonAttrsBorderWidth004
     * @tc.desc     testCommonAttrsBorderWidth004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderWidth004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderWidth004()).assertEqual(0)
      done()
    })

  })
}
