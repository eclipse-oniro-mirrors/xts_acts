'use static';
/**
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function scrollByJsunit() {
  describe('scrollPageJsunit', () => {
    beforeAll(() => {
      console.info("scrollPageJsunit beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("scrollPageJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/scrollPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get scrollPageJsunit state pages: " + JSON.stringify(pages));
        if (!("scrollPage" == pages.name)) {
          console.info("get scrollPageJsunit state pages.name: " + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }

      } catch (err) {
        console.error("push scrollPageJsunit page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      // const routerInstance = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      // routerInstance.clear()
      console.info("List_scrollToIndex1 after each called");
    });

    


    
    



/**
     * @tc.number   scrollPageJsunit_static_0001
     * @tc.name     scrollPageJsunit_static_0001
     * @tc.desc     scrollPageJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('scrollPageJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollPageJsunit_0010] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage1'));
      await btn!.click();
      await CommonFunc.sleep(1000);


      let strJson2 = inspector.getInspectorByKey('scrollPage_text1');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('1');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollPage_text1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();


      console.info('[scrollPageJsunit_0010] END');
      done();
    });

    

    
    



/**
     * @tc.number   scrollPageJsunit_static_0002
     * @tc.name     scrollPageJsunit_static_0002
     * @tc.desc     scrollPageJsunit_static_0002
     * @tc.level    Level.LEVEL0
     */
it('scrollPageJsunit_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[scrollPageJsunit_0020] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn = await driver.findComponent(ON.id('scrollPage2'));
      await btn!.click();
      await CommonFunc.sleep(1000);


      let strJson2 = inspector.getInspectorByKey('scrollPage_text0');

      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0');

      let ScrollBarItem: RectValue = CommonFunc.getComponentRect('gridPage');
      let scrollTextItem: RectValue = CommonFunc.getComponentRect('scrollPage_text0');
      await CommonFunc.sleep(1000);
  console.info('[scrollPageJsunit_0020]ScrollBarItem.top = ' + ScrollBarItem.top);
  console.info('[scrollPageJsunit_0020] scrollTextItem.top = ' + scrollTextItem.top);
      expect(Math.abs(Math.round(ScrollBarItem.top) - Math.round(scrollTextItem.top)) <= 1).assertTrue();

      console.info('[scrollPageJsunit_0020] END');
      done();
    });

  })
}
