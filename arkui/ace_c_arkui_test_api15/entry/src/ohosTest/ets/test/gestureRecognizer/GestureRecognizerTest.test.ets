/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'
import Utils from '../common/Utils'
import nativeRender from 'libnativerender.so'

async function click(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let centerX = Math.round((rect.left + rect.right) / 2);
  let centerY = Math.round((rect.top + rect.bottom) / 2);
  await driver.mouseClick({ x: centerX, y: centerY }, 1);
}

export default function GestureCaseTest() {

  describe('GestureCaseTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_GESTURE_CASE_001
     * @tc.name       : GestureCaseTest001
     * @tc.desc       : testing List lanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('GestureCaseTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureRecognizerTest'
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`)
      await click('image')
      await Utils.sleep(1000)
      let dataArray: string[] = nativeRender.TestGestureRecognizerGetResult()
      console.log('GestureCaseTest001', dataArray[0])
      expect(dataArray[0] == '0').assertEqual(true)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_GESTURE_CASE_002
     * @tc.name       : GestureCaseTest002
     * @tc.desc       : testing List lanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('GestureCaseTest002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'GestureRecognizerTest'
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`)
      let driver = Driver.create()
      let refresh = await driver.findComponent(ON.id('image'))
      await refresh.click()
      await Utils.sleep(1000)
      let dataArray: string[] = nativeRender.TestGestureRecognizerGetResult()
      console.log('GestureCaseTest002', dataArray[0])
      expect(dataArray[0] == '0,0').assertEqual(true)
      done()
    })
  })
}