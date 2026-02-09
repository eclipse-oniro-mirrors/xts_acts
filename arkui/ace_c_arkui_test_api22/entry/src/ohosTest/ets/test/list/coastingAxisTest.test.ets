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
import { Driver, ON, PointerMatrix, Rect, UiDirection} from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';


export default function CoastingAxisTest(){
  describe('CoastingAxisTest',  () =>{

    beforeEach(async (done: Function) => {
       await Utils.pushPage(`list/coastingAxisTest`, done);
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   CoastingAxisTest
     * @tc.number CoastingAxisTest003
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CoastingAxisTest',  Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(500);
      console.log('CoastingAxisTest000 0')
      let driver = await Driver.create();
      console.log('CoastingAxisTest000 1')
      let scrollBar = await driver.findComponent(ON.id('column'));
      console.log('CoastingAxisTest000 2')
      let center = await scrollBar.getBoundsCenter();
      console.log('CoastingAxisTest000 3')
      await Utils.sleep(500);
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      console.log('CoastingAxisTest000 4')
      await Utils.sleep(500);
      expect(nativeRender.CoastingAxisTest_c()).assertEqual(0)
      console.log('CoastingAxisEventTest_c End')
      await Utils.sleep(200)
      expect(nativeRender.CoastingAxisTest_d()).assertEqual(0)
      console.log('CoastingAxisEventTest_d End')
      await Utils.sleep(200)
      expect(nativeRender.CoastingAxisTest_e()).assertEqual(0)
      console.log('CoastingAxisEventTest_e End')
      await Utils.sleep(200)
      done()
    })

    /**
     * @tc.name   CoastingAxisTest_a
     * @tc.number CoastingAxisTest001
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CoastingAxisTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CoastingAxisTest_a()).assertEqual(0)
      console.log('CoastingAxisEventTest_a End')
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.name   CoastingAxisTest_b
     * @tc.number CoastingAxisTest002
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CoastingAxisTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CoastingAxisTest_b()).assertEqual(0)
      console.log('CoastingAxisEventTest_b End')
      await Utils.sleep(200)
      done()
    })
  })
}