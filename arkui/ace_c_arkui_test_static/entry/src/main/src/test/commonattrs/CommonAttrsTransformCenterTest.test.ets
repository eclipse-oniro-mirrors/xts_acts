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

export default function commonAttrsTransformCenterTest() {

  describe('CommonAttrsTransformCenterTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter001
     * @tc.name     testCommonAttrsTransformCenter001
     * @tc.desc     testCommonAttrsTransformCenter001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter002
     * @tc.name     testCommonAttrsTransformCenter002
     * @tc.desc     testCommonAttrsTransformCenter002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter003
     * @tc.name     testCommonAttrsTransformCenter003
     * @tc.desc     testCommonAttrsTransformCenter003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter004
     * @tc.name     testCommonAttrsTransformCenter004
     * @tc.desc     testCommonAttrsTransformCenter004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter005
     * @tc.name     testCommonAttrsTransformCenter005
     * @tc.desc     testCommonAttrsTransformCenter005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter006
     * @tc.name     testCommonAttrsTransformCenter006
     * @tc.desc     testCommonAttrsTransformCenter006
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsTransformCenter007
     * @tc.name     testCommonAttrsTransformCenter007
     * @tc.desc     testCommonAttrsTransformCenter007
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsTransformCenter007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsTransformCenter007()).assertEqual(0)
      done()
    })
  })
}