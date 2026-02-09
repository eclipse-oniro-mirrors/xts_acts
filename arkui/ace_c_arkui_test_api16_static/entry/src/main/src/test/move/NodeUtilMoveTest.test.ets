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

export default function nodeUtilMoveTestTestTest(){

  describe('NodeUtilMoveTestTestTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testNodeUtilMove001
     * @tc.name     testNodeUtilMove001
     * @tc.desc     testNodeUtilMove001
     * @tc.level    Level.LEVEL1
     */
    it('testNodeUtilMove001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestNodeUtilMove001';
      await Utils.pushPage(`move/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button0:Component | null = await driver.findComponent(ON.id('bt1_id'));
      await (button0?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button1:Component | null = await driver.findComponent(ON.id('bt0_id'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button2:Component | null = await driver.findComponent(ON.id('column1_id'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('bt0_id')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('bt1_id')
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

  })
}