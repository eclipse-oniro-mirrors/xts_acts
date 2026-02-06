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

export default function imageBorderRadiusTest() {

  describe('ImageBorderRadiusTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testImageBorderRadius001
     * @tc.name     testImageBorderRadius001
     * @tc.desc     testImageBorderRadius001
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius001()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius002
     * @tc.name     testImageBorderRadius002
     * @tc.desc     testImageBorderRadius002
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius002()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius003
     * @tc.name     testImageBorderRadius003
     * @tc.desc     testImageBorderRadius003
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius003()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius004
     * @tc.name     testImageBorderRadius004
     * @tc.desc     testImageBorderRadius004
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius004()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius005
     * @tc.name     testImageBorderRadius005
     * @tc.desc     testImageBorderRadius005
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius005()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius006
     * @tc.name     testImageBorderRadius006
     * @tc.desc     testImageBorderRadius006
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius006()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius007
     * @tc.name     testImageBorderRadius007
     * @tc.desc     testImageBorderRadius007
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius007()).assertEqual(0)
      done()
    })

    
    
/**
     * @tc.number   testImageBorderRadius008
     * @tc.name     testImageBorderRadius008
     * @tc.desc     testImageBorderRadius008
     * @tc.level    Level.LEVEL1
     */
    it('testImageBorderRadius008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      expect(libUtil.testImageBorderRadius008()).assertEqual(0)
      done()
    })
  })
}
