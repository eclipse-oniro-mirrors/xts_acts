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

export default function expectedFrameRateRangeCallback() {

  describe('ExpectedFrameRateRangeCallback', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api18.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   ExpectedFrameRateRangeCallback001
     * @tc.name     ExpectedFrameRateRangeCallback001
     * @tc.desc     ExpectedFrameRateRangeCallback001
     * @tc.level    Level.LEVEL1
     */
    it('ExpectedFrameRateRangeCallback001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ExpectedFrameRateRangeCallback';
      await Utils.pushPage(`ExpectedFrameRateRange/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('onClick1'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('onClick3'));
      await (button3?.click() as Promise<void>);
      await Utils.sleep(1000)

      let strJson1 = inspector.getInspectorByKey('text_id');
      await Utils.sleep(200);
      let obj1 = JSON.parseJsonElement(strJson1);

      console.info("[ExpectedFrameRateRangeCallback001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ExpectedFrameRateRangeCallback001] content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('正常值')

      let button2 = await driver.findComponent(ON.id('onClick2'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(1000)

      await (button3?.click() as Promise<void>);
      await Utils.sleep(1000)

      let strJson2 = inspector.getInspectorByKey('text_id');
      await Utils.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);

      console.info("[ExpectedFrameRateRangeCallback001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ExpectedFrameRateRangeCallback001] content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('异常值')

      done();
    });

  })
}