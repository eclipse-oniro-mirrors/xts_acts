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

import { expect, beforeEach, beforeAll, describe, it, afterEach, Level } from '../../../../hypium'
import { Driver, ON ,Component,Point,MouseButton } from '@ohos.UiTest'
import Utils from '../common/Utils'
import router from '@ohos.router';
import { UtilsTest } from '../Util.test'
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

async function click(id: string) {
  console.log('[ets_snapShotTest.test.ets]click start')
  let driver = Driver.create();
  let refresh:Component = await driver.findComponent(ON.id(id)) as Component;
  let rect = await refresh.getBounds();
  let centerX = Math.round((rect.left + rect.right) / 2).toInt();
  let centerY = Math.round((rect.top + rect.bottom) / 2).toInt();
  driver.mouseClick({ x: centerX, y: centerY } as Point,MouseButton.MOUSE_BUTTON_LEFT, 1);
  console.log('[ets_snapShotTest.test.ets]click end')
}

export default function snapShotTest() {
  describe('snapShotTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100)
    })

    
    /**
     * @tc.number   snapShotTest001
     * @tc.name     snapShotTest001
     * @tc.desc     snapShotTest001
     * @tc.level    Level.LEVEL1
     */
    it('snapShotTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'snapShotTest'
      await Utils.pushPage(`snapShot/${PAGE_TAG}`)
      await Utils.clickComponent('image')
      await Utils.sleep(300)
      let dataArray: string[] = libUtil.TestsnapShotetResult();
      console.log('snapShotTest00123', dataArray[0])
      expect(dataArray[0] == '0,0').assertEqual(true)
      done()
    })
  })
}
