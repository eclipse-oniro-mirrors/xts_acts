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

export default function commonAttrsBorderRadiusTest() {
  commonAttrsBorderRadiusTest
  describe('CommonAttrsBorderRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius001
     * @tc.name     testCommonAttrsBorderRadius001
     * @tc.desc     testCommonAttrsBorderRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius002
     * @tc.name     testCommonAttrsBorderRadius002
     * @tc.desc     testCommonAttrsBorderRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius003
     * @tc.name     testCommonAttrsBorderRadius003
     * @tc.desc     testCommonAttrsBorderRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius004
     * @tc.name     testCommonAttrsBorderRadius004
     * @tc.desc     testCommonAttrsBorderRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius005
     * @tc.name     testCommonAttrsBorderRadius005
     * @tc.desc     testCommonAttrsBorderRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsBorderRadius006
     * @tc.name     testCommonAttrsBorderRadius006
     * @tc.desc     testCommonAttrsBorderRadius006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsBorderRadius006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsBorderRadius006()).assertEqual(0)
      done()
    })
  })
}
