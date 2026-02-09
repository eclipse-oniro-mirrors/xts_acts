/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';


export default function SwiperIndicatorTest(){
  describe('SwiperIndicatorTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   SwiperIndicatorTest_a
     * @tc.number SwiperIndicatorTest_a
     * @tc.desc   SwiperIndicatorTest_a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwiperIndicatorTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperIndicatorTest_a()).assertEqual(0)
      console.log('SwiperIndicatorTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   SwiperIndicatorTest_b
     * @tc.number SwiperIndicatorTest_b
     * @tc.desc   SwiperIndicatorTest_b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwiperIndicatorTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperIndicatorTest_b()).assertEqual(0)
      console.log('SwiperIndicatorTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   SwiperIndicatorTest_a1
     * @tc.number SwiperIndicatorTest_a1
     * @tc.desc   SwiperIndicatorTest_a1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwiperIndicatorTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperIndicatorTest_a1()).assertEqual(0)
      console.log('SwiperIndicatorTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   SwiperIndicatorTest_b1
     * @tc.number SwiperIndicatorTest_b1
     * @tc.desc   SwiperIndicatorTest_b1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwiperIndicatorTest_b1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.SwiperIndicatorTest_b1()).assertEqual(0)
      console.log('SwiperIndicatorTest_b1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

  })
}