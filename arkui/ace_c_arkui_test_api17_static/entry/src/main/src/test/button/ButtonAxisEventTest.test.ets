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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'


async function mouseScrollCommonEvent(id: string) {
  let driver = Driver.create();
  let component = await driver.findComponent(ON.id(id));
  let point = await (component?.getBounds() as Promise<Rect>);
  let centerX = Math.round((point.left + point.right) as int / 2);
  let centerY = Math.round((point.top + point.bottom) as int / 2);
  driver.mouseScroll({x: centerX.toInt(), y: centerY.toInt()}, true, 30, 2027);
}

export default function buttonAxisEventTest() {

  describe('ButtonAxisEventTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api17_static", "EntryAbility")
      let PAGE_TAG = 'ButtonAxisEventTest';
      Utils.pushPage(`button/${PAGE_TAG}`, false);
    });


    
    /**
     * @tc.number   testButtonAxis001
     * @tc.name     testButtonAxis001
     * @tc.desc     testButtonAxis001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonAxis001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      await mouseScrollCommonEvent('OnAxisTestButton')
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('OnAxisTestButton');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

  })
}