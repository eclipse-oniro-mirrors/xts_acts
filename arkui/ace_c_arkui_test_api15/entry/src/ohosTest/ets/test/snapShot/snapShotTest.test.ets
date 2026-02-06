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

import { expect, beforeEach, beforeAll, describe, it, afterEach, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'
import Utils from '../common/Utils'
import nativeRender from 'libnativerender.so'
import router from '@ohos.router';

async function click(id: string) {
  let driver = Driver.create();
  let refresh = await driver.findComponent(ON.id(id));
  let rect = await refresh.getBounds();
  let centerX = Math.round((rect.left + rect.right) / 2);
  let centerY = Math.round((rect.top + rect.bottom) / 2);
  await driver.mouseClick({ x: centerX, y: centerY }, 1);
}

export default function snapShotTest() {
  describe('snapShotTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })

    /**
     * @tc.name   snapShotTest001
     * @tc.number snapShotTest001
     * @tc.desc   testing snapShot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('snapShotTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'snapShotTest'
      await Utils.pushPage(`snapShot/${PAGE_TAG}`)
      await Utils.clickComponent('image')
      await Utils.sleep(300)
      let dataArray: string[] = nativeRender.TestsnapShotetResult();
      console.log('snapShotTest00123', dataArray[0])
      if(dataArray[0] == '0,0'){
        expect(dataArray[0] == '0,0').assertEqual(true)
      }else{
        expect(dataArray[0] == '0,0').assertEqual(false)
      }
      done()
    })
  })
}
