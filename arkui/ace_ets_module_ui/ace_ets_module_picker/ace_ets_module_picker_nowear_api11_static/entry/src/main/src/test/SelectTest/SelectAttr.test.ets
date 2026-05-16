'use static';
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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import Utils from "../../../ets/MainAbility/common/Utils";
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SelectAttr() {
  describe('SelectAttr', () => {
    beforeAll(() => {
      console.info("SelectAttr beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");

    });
    beforeEach(async (): Promise<void> => {
      console.info("SelectAttr beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/SelectAttr',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectAttr state pages:" + JSON.stringify(pages));
        if (!("SelectAttr" == pages.name)) {
          console.info("get SelectAttr pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push SelectAttr page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SelectAttr page error: " + err);
      }
      // done()
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("SelectAttr after each called");
    });


    
    /**
     * @tc.number   SelectAttr_static_001
     * @tc.name     SelectAttr_static_001
     * @tc.desc     SelectAttr_static_001
     * @tc.level    Level.LEVEL1
     */
it('SelectAttr_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SelectAttr_static_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('SelectAttr_Select'));
      await (btn1?.click() as Promise<void>)
      await Utils.sleep(3000);

      let strJson1 = inspector.getInspectorByKey('SelectAttr_Select');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SelectAttr_static_001] obj1 is: " + JSON.stringify(obj1));

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      console.info("[SelectAttr_static_001] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getArray("$children")[1].getArray("$children")[0].getElement('$attrs').getString("width"))
        .assertEqual(obj1.getElement('$attrs').getString("width"));

      console.info('[SelectAttr_static_001] END');
      done();
    });

  })
}


