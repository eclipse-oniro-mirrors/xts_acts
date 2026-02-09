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

export default function customComponentAlignSelfTest() {

  describe('CustomComponentAlignSelfTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCustomComponentAlignSelf001
     * @tc.name     testCustomComponentAlignSelf001
     * @tc.desc     testCustomComponentAlignSelf001
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf001()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCustomComponentAlignSelf002
     * @tc.name     testCustomComponentAlignSelf002
     * @tc.desc     testCustomComponentAlignSelf002
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf002()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCustomComponentAlignSelf003
     * @tc.name     testCustomComponentAlignSelf003
     * @tc.desc     testCustomComponentAlignSelf003
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf003()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCustomComponentAlignSelf004
     * @tc.name     testCustomComponentAlignSelf004
     * @tc.desc     testCustomComponentAlignSelf004
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf004()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCustomComponentAlignSelf005
     * @tc.name     testCustomComponentAlignSelf005
     * @tc.desc     testCustomComponentAlignSelf005
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf005()).assertEqual(0)
      done();
    })

    
    
/**
     * @tc.number   testCustomComponentAlignSelf006
     * @tc.name     testCustomComponentAlignSelf006
     * @tc.desc     testCustomComponentAlignSelf006
     * @tc.level    Level.LEVEL1
     */
    it('testCustomComponentAlignSelf006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCustomComponentAlignSelf006()).assertEqual(0)
      done();
    })
  })
}
