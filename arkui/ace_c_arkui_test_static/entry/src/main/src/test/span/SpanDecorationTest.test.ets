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

export default function spanDecorationTest() {

  describe('SpanDecorationTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testSpanDecoration001
     * @tc.name     testSpanDecoration001
     * @tc.desc     testSpanDecoration001
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration002
     * @tc.name     testSpanDecoration002
     * @tc.desc     testSpanDecoration002
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration003
     * @tc.name     testSpanDecoration003
     * @tc.desc     testSpanDecoration003
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration004
     * @tc.name     testSpanDecoration004
     * @tc.desc     testSpanDecoration004
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration005
     * @tc.name     testSpanDecoration005
     * @tc.desc     testSpanDecoration005
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration006
     * @tc.name     testSpanDecoration006
     * @tc.desc     testSpanDecoration006
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration007
     * @tc.name     testSpanDecoration007
     * @tc.desc     testSpanDecoration007
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration008
     * @tc.name     testSpanDecoration008
     * @tc.desc     testSpanDecoration008
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration008()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration009
     * @tc.name     testSpanDecoration009
     * @tc.desc     testSpanDecoration009
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration009()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration010
     * @tc.name     testSpanDecoration010
     * @tc.desc     testSpanDecoration010
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration010()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration011
     * @tc.name     testSpanDecoration011
     * @tc.desc     testSpanDecoration011
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration011()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testSpanDecoration012
     * @tc.name     testSpanDecoration012
     * @tc.desc     testSpanDecoration012
     * @tc.level    Level.LEVEL1
     */
    it('testSpanDecoration012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testSpanDecoration012()).assertEqual(0)
      done()
    })
  })
}
