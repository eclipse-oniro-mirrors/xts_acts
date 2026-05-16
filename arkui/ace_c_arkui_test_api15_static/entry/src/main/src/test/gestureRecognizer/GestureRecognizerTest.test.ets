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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium'
import { Driver, ON, Component, Point, MouseButton, Rect } from '@ohos.UiTest'
import Utils from '../common/Utils'
import { LibUtil } from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'

let libUtil: LibUtil = new LibUtil();

async function click(id: string) {
  console.log('[ets_GestureRecognizerTest]click start')
  let driver = Driver.create();
  let refresh: Component | null = await driver.findComponent(ON.id(id));
  let rect = await (refresh?.getBounds() as Promise<Rect>);
  let centerX = Math.round((rect.left + rect.right) / 2).toInt();
  let centerY = Math.round((rect.top + rect.bottom) / 2).toInt();
  driver.mouseClick({ x: centerX, y: centerY } as Point, MouseButton.MOUSE_BUTTON_LEFT, 1);
  console.log('[ets_GestureRecognizerTest]click end')
}

export default function GestureCaseTest() {

  describe('GestureCaseTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   GestureCaseTest001
     * @tc.name     GestureCaseTest001
     * @tc.desc     GestureCaseTest001
     * @tc.level    Level.LEVEL1
     */
    it('GestureCaseTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureRecognizerTest'
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`)
      await click('image')
      let dataArray: string[] = libUtil.TestGestureRecognizerGetResult()
      console.log('GestureCaseTest001', dataArray[0])
      expect(dataArray[0] == '0').assertEqual(true)
      done()
    })

    
    /**
     * @tc.number   GestureCaseTest002
     * @tc.name     GestureCaseTest002
     * @tc.desc     GestureCaseTest002
     * @tc.level    Level.LEVEL1
     */
    it('GestureCaseTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureRecognizerTest'
      await Utils.pushPage(`gestureRecognizer/${PAGE_TAG}`)
      let driver = Driver.create()
      let refresh: Component | null = await driver.findComponent(ON.id('image'))
      await (refresh?.click() as Promise<void>)
      let dataArray: string[] = libUtil.TestGestureRecognizerGetResult()
      console.log('GestureCaseTest002', dataArray[0])
      expect(dataArray[0] == '0,0').assertEqual(true)
      done()
    })
  })
}