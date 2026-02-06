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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function getWindowInfoTest(){

  describe('GetWindowInfoTest', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testGetWindowInfo001
     * @tc.name     testGetWindowInfo001
     * @tc.desc     testGetWindowInfo001
     * @tc.level    Level.LEVEL1
     */
    it('testGetWindowInfo001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestGetWindowInfo';
      await Utils.pushPage(`window/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id0')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let button2:Component = await driver.findComponent(ON.id('button_id1')) as Component;
      await button2.click();
      await Utils.sleep(1000)
      let button3:Component = await driver.findComponent(ON.id('button_id2')) as Component;
      await button3.click();
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('button_id0')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('button_id1')
      let obj2 = JSON.parseJsonElement(strJson2);
      let strJson3 = inspector.getInspectorByKey('button_id1')
      let obj3 = JSON.parseJsonElement(strJson3);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testHostWindowInfoGetName002
     * @tc.name     testHostWindowInfoGetName002
     * @tc.desc     testHostWindowInfoGetName002
     * @tc.level    Level.LEVEL1
     */
    it('testHostWindowInfoGetName002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestHostWindowInfoGetName';
      await Utils.pushPage(`window/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id0')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('button_id0')
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

  })
}