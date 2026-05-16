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

import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function PostOnIdleTest(){

  describe('PostOnIdleTest', (): void  => {
    beforeAll(async (): Promise<void> => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api20.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });

    
    /**
     * @tc.number   testPostOnIdle001
     * @tc.name     testPostOnIdle001
     * @tc.desc     testPostOnIdle001
     * @tc.level    Level.LEVEL1
     */
    it('testPostOnIdle001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestPostOnIdle';
      await Utils.pushPage(`onIdle/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('onClick1'));
      await (button1?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button2 = await driver.findComponent(ON.id('onClick2'));
      await (button2?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button3 = await driver.findComponent(ON.id('onClick3'));
      await (button3?.click() as Promise<void>);
      await Utils.sleep(1000)
      let button5 = await driver.findComponent(ON.id('onClick5'));
      await (button5?.click() as Promise<void>);
      await Utils.sleep(1000)
      let strJson1:string = inspector.getInspectorByKey('onClick1');
      let strJson2:string = inspector.getInspectorByKey('onClick2');
      let strJson3:string = inspector.getInspectorByKey('onClick3');
      let strJson5:string = inspector.getInspectorByKey('onClick5');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

  })
}