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

async function mouseMoveToCommonEvent(id: string) {
  let driver = Driver.create();
  let component = await driver.findComponent(ON.id(id));
  let point = await component.getBounds();
  let centerX = Math.round((point.left + point.right) / 2);
  let centerY = Math.round((point.top + point.bottom) / 2);
  await driver.mouseMoveTo({x: centerX, y: centerY});
}

export default function buttonOnClickEventTest() {

  describe('ButtonOnHoverTest', () => {

    let PAGE_TAG = 'ButtonOnHoverEventTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`button/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testButtonOnHover001
     * @tc.number SUB_ARKUI_CAPI_BUTTON_ONHOVER_EVENT_0100
     * @tc.desc   test onHover event not callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testButtonOnHover001', Level.LEVEL1, async (done: Function) => {
      await mouseMoveToCommonEvent('OnHoverTestButton')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnHoverTestButton').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}