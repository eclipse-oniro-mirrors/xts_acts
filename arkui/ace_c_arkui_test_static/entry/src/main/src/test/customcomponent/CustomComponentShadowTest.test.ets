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

export default function customComponentShadowTest() {

  describe('CustomComponentShadowTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentShadow001
     * @tc.name     testCustomComponentShadow001
     * @tc.desc     testCustomComponentShadow001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentShadow002
     * @tc.name     testCustomComponentShadow002
     * @tc.desc     testCustomComponentShadow002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentShadow003
     * @tc.name     testCustomComponentShadow003
     * @tc.desc     testCustomComponentShadow003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentShadow004
     * @tc.name     testCustomComponentShadow004
     * @tc.desc     testCustomComponentShadow004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentShadow005
     * @tc.name     testCustomComponentShadow005
     * @tc.desc     testCustomComponentShadow005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCustomComponentShadow006
     * @tc.name     testCustomComponentShadow006
     * @tc.desc     testCustomComponentShadow006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentShadow006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentShadow006()).assertEqual(0)
      done()
    })
  })
}
