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

import { beforeEach, describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
let libUtil:LibUtil = new LibUtil();

export default function scrollShadowTest() {

  describe('ScrollShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testScrollShadow001
     * @tc.name     testScrollShadow001
     * @tc.desc     testScrollShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow001()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollShadow002
     * @tc.name     testScrollShadow002
     * @tc.desc     testScrollShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow002()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollShadow003
     * @tc.name     testScrollShadow003
     * @tc.desc     testScrollShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow003()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollShadow004
     * @tc.name     testScrollShadow004
     * @tc.desc     testScrollShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow004()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollShadow005
     * @tc.name     testScrollShadow005
     * @tc.desc     testScrollShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow005()).assertEqual(0)
      done();
    });

    
    
/**
     * @tc.number   testScrollShadow006
     * @tc.name     testScrollShadow006
     * @tc.desc     testScrollShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testScrollShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testScrollShadow006()).assertEqual(0)
      done();
    });
  })
}
