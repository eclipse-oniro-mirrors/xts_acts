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

export default function commonAttrsContrastTest() {

  describe('CommonAttrsContrastTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsContrast001
     * @tc.name     testCommonAttrsContrast001
     * @tc.desc     testCommonAttrsContrast001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsContrast002
     * @tc.name     testCommonAttrsContrast002
     * @tc.desc     testCommonAttrsContrast002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsContrast003
     * @tc.name     testCommonAttrsContrast003
     * @tc.desc     testCommonAttrsContrast003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsContrast004
     * @tc.name     testCommonAttrsContrast004
     * @tc.desc     testCommonAttrsContrast004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsContrast005
     * @tc.name     testCommonAttrsContrast005
     * @tc.desc     testCommonAttrsContrast005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsContrast006
     * @tc.name     testCommonAttrsContrast006
     * @tc.desc     testCommonAttrsContrast006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsContrast006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsContrast006()).assertEqual(0)
      done()
    })

  })
}
