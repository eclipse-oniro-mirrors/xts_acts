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

export default function commonAttrsSweepGradientTest() {

  describe('CommonAttrsSweepGradientTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testCommonAttrsSweepGradient001
     * @tc.name     testCommonAttrsSweepGradient001
     * @tc.desc     testCommonAttrsSweepGradient001
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSweepGradient001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSweepGradient001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSweepGradient002
     * @tc.name     testCommonAttrsSweepGradient002
     * @tc.desc     testCommonAttrsSweepGradient002
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSweepGradient002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSweepGradient002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSweepGradient003
     * @tc.name     testCommonAttrsSweepGradient003
     * @tc.desc     testCommonAttrsSweepGradient003
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSweepGradient003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSweepGradient003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSweepGradient004
     * @tc.name     testCommonAttrsSweepGradient004
     * @tc.desc     testCommonAttrsSweepGradient004
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSweepGradient004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSweepGradient004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testCommonAttrsSweepGradient005
     * @tc.name     testCommonAttrsSweepGradient005
     * @tc.desc     testCommonAttrsSweepGradient005
     * @tc.level    Level.LEVEL1
     */
    it('testCommonAttrsSweepGradient005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testCommonAttrsSweepGradient005()).assertEqual(0)
      done()
    })

  })
}
