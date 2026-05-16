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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function searchButton() {
  describe('searchButton', (): void => {
    beforeAll(() => {
      console.info("searchButton beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("searchButton beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Search/searchButton",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get searchButton state pages:" + "");
        if (!("searchButton" == pages.name)) {
          console.info("get searchButton pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push searchButton page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push searchButton page error:" + err);
      }
      console.info("searchButton beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("searchButton after each called");
    });


    
    /**
     * @tc.number   searchButton_static_0001
     * @tc.name     searchButton_static_0001
     * @tc.desc     searchButton_static_0001
     * @tc.level    Level.LEVEL1
     */
it('searchButton_static_0001', Level.LEVEL1, async () => {
      let driver = Driver.create();
      console.info('searchButton searchButton_static_0001 START');
      await CommonFunc.sleep(500);

      let strJson: string = inspector.getInspectorByKey('search1');
      let obj = JSON.parseJsonElement(strJson);
      console.log('searchButton_static_0001---obj.$attrs.searchButtonOption.autoDisable---' +
      obj.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable'));
      expect(obj.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable')).assertEqual(true);
      //true
      let strJson2: string = inspector.getInspectorByKey('search2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.log('searchButton_static_0001---obj2.$attrs.searchButtonOption.autoDisable---' +
      obj2.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable'));
      expect(obj2.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable')).assertEqual(false);
      //false
      let strJson3: string = inspector.getInspectorByKey('search3');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.log('searchButton_static_0001---obj3.$attrs.searchButtonOption.autoDisable---' +
      obj3.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable'));
      expect(obj3.getElement('$attrs').getElement('searchButtonOption').getBoolean('autoDisable')).assertEqual(false);
      //false
      console.info("[searchButton_static_0001] end");
    });
  })
}
