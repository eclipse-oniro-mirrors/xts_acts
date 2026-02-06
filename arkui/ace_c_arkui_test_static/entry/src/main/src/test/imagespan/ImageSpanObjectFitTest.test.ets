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

export default function imageSpanObjectFitTest() {

  describe('ImageSpanObjectFitTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageSpanObjectFit001
     * @tc.name     testImageSpanObjectFit001
     * @tc.desc     testImageSpanObjectFit001
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit002
     * @tc.name     testImageSpanObjectFit002
     * @tc.desc     testImageSpanObjectFit002
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit003
     * @tc.name     testImageSpanObjectFit003
     * @tc.desc     testImageSpanObjectFit003
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit004
     * @tc.name     testImageSpanObjectFit004
     * @tc.desc     testImageSpanObjectFit004
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit005
     * @tc.name     testImageSpanObjectFit005
     * @tc.desc     testImageSpanObjectFit005
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit006
     * @tc.name     testImageSpanObjectFit006
     * @tc.desc     testImageSpanObjectFit006
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageSpanObjectFit007
     * @tc.name     testImageSpanObjectFit007
     * @tc.desc     testImageSpanObjectFit007
     * @tc.level    Level.LEVEL1
     */
    it('testImageSpanObjectFit007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageSpanObjectFit007()).assertEqual(0)
      done()
    })

  })
}
