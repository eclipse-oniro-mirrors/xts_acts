/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

async function mouseScrollCommonEvent(id: string) {
  let driver = Driver.create();
  let component = await driver.findComponent(ON.id(id));
  let point = await component.getBounds();
  let centerX = Math.round((point.left + point.right) / 2);
  let centerY = Math.round((point.top + point.bottom) / 2);
  await driver.mouseScroll({x: centerX, y: centerY}, true, 30, 2027);
}

export default function buttonAxisEventTest() {

  describe('ButtonAxisEventTest', () => {

    let PAGE_TAG = 'ButtonAxisEventTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`button/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_BUTTON_Axis_EVENT_0100
    * @tc.name       : testButtonOnAxisEvent001
    * @tc.desc       : test Axis event not callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testButtonAxis001', Level.LEVEL1, async (done: Function) => {
      await mouseScrollCommonEvent('OnAxisTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnAxisTestButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}