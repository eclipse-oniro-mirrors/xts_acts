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


export default function DragEndPendingTest(){
  describe('DragEndPendingTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   DragEndPendingTest_a
     * @tc.number DragEndPendingTest_a
     * @tc.desc   DragEndPendingTest_a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragEndPendingTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.DragEndPendingTest_a()).assertEqual(0)
      console.log('DragEndPendingTest_a will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   DragEndPendingTest_a1
     * @tc.number DragEndPendingTest_a1
     * @tc.desc   DragEndPendingTest_a1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragEndPendingTest_a1',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.DragEndPendingTest_a1()).assertEqual(0)
      console.log('DragEndPendingTest_a1 will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   DragEndPendingTest_b
     * @tc.number DragEndPendingTest_b
     * @tc.desc   DragEndPendingTest_b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragEndPendingTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.DragEndPendingTest_b()).assertEqual(0)
      console.log('DragEndPendingTest_b will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })

    /**
     * @tc.name   DragEndPendingTest_c
     * @tc.number DragEndPendingTest_c
     * @tc.desc   DragEndPendingTest_c
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DragEndPendingTest_c',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.DragEndPendingTest_c()).assertEqual(0)
      console.log('DragEndPendingTest_c will drag and check:: ')
      await Utils.sleep(200)
      
      done()
    })


  })
}