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

export default function commonAttrsBorderStyleTest() {
  commonAttrsBorderStyleTest
  describe('CommonAttrsBorderStyleTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle001
     * @tc.name     testCommonAttrsBorderStyle001
     * @tc.desc     testCommonAttrsBorderStyle001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle002
     * @tc.name     testCommonAttrsBorderStyle002
     * @tc.desc     testCommonAttrsBorderStyle002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle003
     * @tc.name     testCommonAttrsBorderStyle003
     * @tc.desc     testCommonAttrsBorderStyle003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle004
     * @tc.name     testCommonAttrsBorderStyle004
     * @tc.desc     testCommonAttrsBorderStyle004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle005
     * @tc.name     testCommonAttrsBorderStyle005
     * @tc.desc     testCommonAttrsBorderStyle005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderStyle006
     * @tc.name     testCommonAttrsBorderStyle006
     * @tc.desc     testCommonAttrsBorderStyle006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderStyle006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderStyle006()).assertEqual(0)
      done()
    })
  })
}
