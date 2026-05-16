'use static';
/**
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



export default function SwiperIndicatorTest(){
  describe('SwiperIndicatorTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api18_static", "EntryAbility")
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    /**
     * @tc.number   SwiperIndicatorTest_a
     * @tc.name     SwiperIndicatorTest_a
     * @tc.desc     SwiperIndicatorTest_a
     * @tc.level    Level.LEVEL0
     */
    it('SwiperIndicatorTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperIndicatorTest_a()).assertEqual(0)
      console.log('SwiperIndicatorTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperIndicatorTest_b
     * @tc.name     SwiperIndicatorTest_b
     * @tc.desc     SwiperIndicatorTest_b
     * @tc.level    Level.LEVEL0
     */
    it('SwiperIndicatorTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperIndicatorTest_b()).assertEqual(0)
      console.log('SwiperIndicatorTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperIndicatorTest_a1
     * @tc.name     SwiperIndicatorTest_a1
     * @tc.desc     SwiperIndicatorTest_a1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperIndicatorTest_a1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperIndicatorTest_a1()).assertEqual(0)
      console.log('SwiperIndicatorTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.number   SwiperIndicatorTest_b1
     * @tc.name     SwiperIndicatorTest_b1
     * @tc.desc     SwiperIndicatorTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('SwiperIndicatorTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      expect(libUtil.SwiperIndicatorTest_b1()).assertEqual(0)
      console.log('SwiperIndicatorTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}