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

export default function keyframeAnimateOptionTest() {

  describe('KeyframeAnimateOptionTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testKeyframeAnimateOption001
     * @tc.name     testKeyframeAnimateOption001
     * @tc.desc     testKeyframeAnimateOption001
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption002
     * @tc.name     testKeyframeAnimateOption002
     * @tc.desc     testKeyframeAnimateOption002
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption003
     * @tc.name     testKeyframeAnimateOption003
     * @tc.desc     testKeyframeAnimateOption003
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption004
     * @tc.name     testKeyframeAnimateOption004
     * @tc.desc     testKeyframeAnimateOption004
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption005
     * @tc.name     testKeyframeAnimateOption005
     * @tc.desc     testKeyframeAnimateOption005
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption006
     * @tc.name     testKeyframeAnimateOption006
     * @tc.desc     testKeyframeAnimateOption006
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption007
     * @tc.name     testKeyframeAnimateOption007
     * @tc.desc     testKeyframeAnimateOption007
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption008
     * @tc.name     testKeyframeAnimateOption008
     * @tc.desc     testKeyframeAnimateOption008
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption009
     * @tc.name     testKeyframeAnimateOption009
     * @tc.desc     testKeyframeAnimateOption009
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption010
     * @tc.name     testKeyframeAnimateOption010
     * @tc.desc     testKeyframeAnimateOption010
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption011
     * @tc.name     testKeyframeAnimateOption011
     * @tc.desc     testKeyframeAnimateOption011
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption013
     * @tc.name     testKeyframeAnimateOption013
     * @tc.desc     testKeyframeAnimateOption013
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption013()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption014
     * @tc.name     testKeyframeAnimateOption014
     * @tc.desc     testKeyframeAnimateOption014
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption014()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption015
     * @tc.name     testKeyframeAnimateOption015
     * @tc.desc     testKeyframeAnimateOption015
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption015', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption015()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption016
     * @tc.name     testKeyframeAnimateOption016
     * @tc.desc     testKeyframeAnimateOption016
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption016', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption016()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption017
     * @tc.name     testKeyframeAnimateOption017
     * @tc.desc     testKeyframeAnimateOption017
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption017', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption017()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption018
     * @tc.name     testKeyframeAnimateOption018
     * @tc.desc     testKeyframeAnimateOption018
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption018', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption018()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption019
     * @tc.name     testKeyframeAnimateOption019
     * @tc.desc     testKeyframeAnimateOption019
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption019', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption019()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption020
     * @tc.name     testKeyframeAnimateOption020
     * @tc.desc     testKeyframeAnimateOption020
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption020()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption021
     * @tc.name     testKeyframeAnimateOption021
     * @tc.desc     testKeyframeAnimateOption021
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption021', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption021()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption022
     * @tc.name     testKeyframeAnimateOption022
     * @tc.desc     testKeyframeAnimateOption022
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption022', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption022()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption024
     * @tc.name     testKeyframeAnimateOption024
     * @tc.desc     testKeyframeAnimateOption024
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption024', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption024()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testKeyframeAnimateOption025
     * @tc.name     testKeyframeAnimateOption025
     * @tc.desc     testKeyframeAnimateOption025
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption025', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testKeyframeAnimateOption025()).assertEqual(0)
      done()
    })

  })
}