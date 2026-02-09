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

export default function commonAttrsShadowTest() {

  describe('CommonAttrsShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsShadow001
     * @tc.name     testCommonAttrsShadow001
     * @tc.desc     testCommonAttrsShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsShadow002
     * @tc.name     testCommonAttrsShadow002
     * @tc.desc     testCommonAttrsShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsShadow003
     * @tc.name     testCommonAttrsShadow003
     * @tc.desc     testCommonAttrsShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsShadow004
     * @tc.name     testCommonAttrsShadow004
     * @tc.desc     testCommonAttrsShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsShadow005
     * @tc.name     testCommonAttrsShadow005
     * @tc.desc     testCommonAttrsShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsShadow006
     * @tc.name     testCommonAttrsShadow006
     * @tc.desc     testCommonAttrsShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsShadow006()).assertEqual(0)
      done()
    })
  })
}
