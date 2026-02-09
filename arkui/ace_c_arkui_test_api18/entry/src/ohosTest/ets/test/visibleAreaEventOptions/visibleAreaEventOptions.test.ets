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

async function panAndPinchGesture(){

}

export default function VisibleAreaEventOptionsTest(){
  describe('VisibleAreaEventOptionsTest',  () =>{
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })


    /**
     * @tc.name   VisibleAreaEventOptionsTest
     * @tc.number VisibleAreaEventOptionsTest
     * @tc.desc   VisibleAreaEventOptionsTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VisibleAreaEventOptionsTest', Level.LEVEL1, async (done: Function) => {
      console.info("push VisibleAreaEventOptionsTest page success: ")
      let ret = nativeRender.DragEndPendingTest_001()
      console.log('VisibleAreaEventOptionsTest will drag and check:: ', ret)
      expect().assertEqual();
      done()
    })
    /**
     * @tc.name   VisibleAreaEventOptionsTest_a
     * @tc.number VisibleAreaEventOptionsTest_a
     * @tc.desc   VisibleAreaEventOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VisibleAreaEventOptionsTest_a', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.VisibleAreaEventOptionsTest_a()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   VisibleAreaEventOptionsTest_b
     * @tc.number VisibleAreaEventOptionsTest_b
     * @tc.desc   VisibleAreaEventOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VisibleAreaEventOptionsTest_b', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.VisibleAreaEventOptionsTest_b()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
    /**
     * @tc.name   VisibleAreaEventOptionsTest_c
     * @tc.number VisibleAreaEventOptionsTest_c
     * @tc.desc   VisibleAreaEventOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VisibleAreaEventOptionsTest_c', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.VisibleAreaEventOptionsTest_c()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
    /**
     * @tc.name   VisibleAreaEventOptionsTest_d
     * @tc.number VisibleAreaEventOptionsTest_d
     * @tc.desc   VisibleAreaEventOption
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('VisibleAreaEventOptionsTest_d', Level.LEVEL1, async (done: Function) => {
      expect(nativeRender.VisibleAreaEventOptionsTest_d()).assertEqual(0)
      await Utils.sleep(100)
      done()
    })
  })
}