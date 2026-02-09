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
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();

async function penClickEvent(id: string) {
  console.log('[ui]Driver.create start');
  let driver = Driver.create();
  console.log('[ui]Driver.create end');
  let component = await driver.findComponent(ON.id(id));
  console.log('[ui]Driver.findComponent end:' + component);
  let point = await (component?.getBounds() as Promise<Rect>);
  let centerX = Math.round((point.left + point.right).toInt() / 2);
  let centerY = Math.round((point.top + point.bottom).toInt() / 2);
  console.log('[ui]Driver.penClick start');
  await (driver.penClick({x: centerX.toInt(), y: centerY.toInt()}) as Promise<void>);
  console.log('[ui]Driver.penClick ent');
}

export default function buttonRollAngleTest() {

  describe('ButtonRollAngleTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api17_static", "EntryAbility")
      let PAGE_TAG = 'ButtonOnHoverEventTest';
      Utils.pushPage(`button/${PAGE_TAG}`, false);
    });

    
    /**
     * @tc.number   buttonRollAngleTest001
     * @tc.name     buttonRollAngleTest001
     * @tc.desc     buttonRollAngleTest001
     * @tc.level    Level.LEVEL1
     */
    it('buttonRollAngleTest001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log('[ui]RollAngleTestButton start');
      await penClickEvent('RollAngleTestButton')
      console.log('[ui]RollAngleTestButton end');
      await Utils.sleep(2000)
      let strJson = inspector.getInspectorByKey('RollAngleTestButton');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

  })
}