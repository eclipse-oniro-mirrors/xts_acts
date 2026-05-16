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

import { expect, describe, it, afterEach, Level , beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import {LibUtil} from '../../../ets/pages/LibUtil'
let libUtil:LibUtil = new LibUtil();

export default function postFrameCallbackTest(){

  describe('PostFrameCallbackTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testPostFrameCallback001
     * @tc.name     testPostFrameCallback001
     * @tc.desc     testPostFrameCallback001
     * @tc.level    Level.LEVEL1
     */
    it('testPostFrameCallback001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestPostFrameCallback';
      await Utils.pushPage(`postFrame/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component | null = await driver.findComponent(ON.id('onClick1'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button2:Component | null = await driver.findComponent(ON.id('onClick2'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button3:Component | null = await driver.findComponent(ON.id('onClick3'));
      await (button3?.click() as Promise<void>);
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('onClick1')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('onClick2')
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('onClick3')
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

  })
}