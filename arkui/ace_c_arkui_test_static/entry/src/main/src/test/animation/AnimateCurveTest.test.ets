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

export default function animateCurveTest() {

  describe('AnimateCurveTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testAnimateCurve001
     * @tc.name     testAnimateCurve001
     * @tc.desc     testAnimateCurve001
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve002
     * @tc.name     testAnimateCurve002
     * @tc.desc     testAnimateCurve002
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve003
     * @tc.name     testAnimateCurve003
     * @tc.desc     testAnimateCurve003
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve004
     * @tc.name     testAnimateCurve004
     * @tc.desc     testAnimateCurve004
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve005
     * @tc.name     testAnimateCurve005
     * @tc.desc     testAnimateCurve005
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve006
     * @tc.name     testAnimateCurve006
     * @tc.desc     testAnimateCurve006
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve007
     * @tc.name     testAnimateCurve007
     * @tc.desc     testAnimateCurve007
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve008
     * @tc.name     testAnimateCurve008
     * @tc.desc     testAnimateCurve008
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve009
     * @tc.name     testAnimateCurve009
     * @tc.desc     testAnimateCurve009
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve010
     * @tc.name     testAnimateCurve010
     * @tc.desc     testAnimateCurve010
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testAnimateCurve011
     * @tc.name     testAnimateCurve011
     * @tc.desc     testAnimateCurve011
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateCurve011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testAnimateCurve011()).assertEqual(0)
      done()
    })

  })
}
