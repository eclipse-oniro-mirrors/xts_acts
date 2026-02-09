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
import { Driver, ON, Component,MouseButton,Point } from '@ohos.UiTest'
import Utils from '../common/Utils'
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

let libUtil:LibUtil = new LibUtil();

async function click(id: string) {
  let driver = Driver.create();
  let refresh: Component = await driver.findComponent(ON.id(id)) as Component;
  let rect = await refresh.getBounds();
  let centerX = Math.round((rect.left + rect.right) / 2).toInt();
  let centerY = Math.round((rect.top + rect.bottom) / 2).toInt();
  await Utils.sleep(500)
  driver.mouseClick({ x: centerX, y: centerY } as Point, MouseButton.MOUSE_BUTTON_LEFT, 1);
}

export default function EventInfoTest() {

  describe('EventInfoTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   EventInfoCaseTest001
     * @tc.name     EventInfoCaseTest001
     * @tc.desc     EventInfoCaseTest001
     * @tc.level    Level.LEVEL1
     */
    it('EventInfoCaseTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'EventInfoCaseTest1'
      await Utils.pushPage(`eventInfo/${PAGE_TAG}`)
      let driver = Driver.create()
      let refresh:Component = await driver.findComponent(ON.id('image')) as Component
      await refresh.click()
      await Utils.sleep(1000)
      let dataArrayTouch: string[] = libUtil.TestEventInfoGetResultTouch();
      // let dataArrayMove: string[] = libUtil.TestEventInfoGetResultMove();
      console.log('EventInfoTest001', dataArrayTouch[0])
      expect(dataArrayTouch[0] == '0,0').assertEqual(true)
      done()
    })

    
    /**
     * @tc.number   EventInfoCaseTest002
     * @tc.name     EventInfoCaseTest002
     * @tc.desc     EventInfoCaseTest002
     * @tc.level    Level.LEVEL1
     */
    it('EventInfoCaseTest002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'EventInfoCaseTest1'
      await Utils.sleep(1000)
      await click('image')
      await Utils.sleep(1000)
      // let dataArrayTouch: string[] = libUtil.TestEventInfoGetResultTouch();
      let dataArrayMove: string[] = libUtil.TestEventInfoGetResultMove();
      console.log('EventInfoTest002', dataArrayMove[0])
      expect(dataArrayMove[0] == '0,0,0,0,401').assertEqual(true)
      done()
    })
  })
}