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

export default function commonAttrsForegroundColorTest() {

  describe('CommonAttrsForegroundColorTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsForegroundColor001
     * @tc.name     testCommonAttrsForegroundColor001
     * @tc.desc     testCommonAttrsForegroundColor001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsForegroundColor001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsForegroundColor001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsForegroundColor002
     * @tc.name     testCommonAttrsForegroundColor002
     * @tc.desc     testCommonAttrsForegroundColor002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsForegroundColor002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsForegroundColor002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsForegroundColor003
     * @tc.name     testCommonAttrsForegroundColor003
     * @tc.desc     testCommonAttrsForegroundColor003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsForegroundColor003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsForegroundColor003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsForegroundColor004
     * @tc.name     testCommonAttrsForegroundColor004
     * @tc.desc     testCommonAttrsForegroundColor004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsForegroundColor004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsForegroundColor004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsForegroundColor005
     * @tc.name     testCommonAttrsForegroundColor005
     * @tc.desc     testCommonAttrsForegroundColor005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsForegroundColor005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsForegroundColor005()).assertEqual(0)
      done()
    })
  })
}