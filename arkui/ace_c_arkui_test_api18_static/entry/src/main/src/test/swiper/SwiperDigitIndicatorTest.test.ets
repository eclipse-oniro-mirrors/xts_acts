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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();

export default function swiperDigitIndicatorTest() {

  describe('swiperDigitIndicatorTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   testSwiperDigitIndicator001
     * @tc.name     testSwiperDigitIndicator001
     * @tc.desc     testSwiperDigitIndicator001
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator001()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator002
     * @tc.name     testSwiperDigitIndicator002
     * @tc.desc     testSwiperDigitIndicator002
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator002()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator003
     * @tc.name     testSwiperDigitIndicator003
     * @tc.desc     testSwiperDigitIndicator003
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator003()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator004
     * @tc.name     testSwiperDigitIndicator004
     * @tc.desc     testSwiperDigitIndicator004
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator004()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator005
     * @tc.name     testSwiperDigitIndicator005
     * @tc.desc     testSwiperDigitIndicator005
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator005()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator006
     * @tc.name     testSwiperDigitIndicator006
     * @tc.desc     testSwiperDigitIndicator006
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator006()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator007
     * @tc.name     testSwiperDigitIndicator007
     * @tc.desc     testSwiperDigitIndicator007
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator007()).assertEqual(0)
      done()
    })

    
    /**
     * @tc.number   testSwiperDigitIndicator008
     * @tc.name     testSwiperDigitIndicator008
     * @tc.desc     testSwiperDigitIndicator008
     * @tc.level    Level.LEVEL0
     */
    it('testSwiperDigitIndicator008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.testSwiperDigitIndicator008()).assertEqual(0)
      done()
    })

  })
}
