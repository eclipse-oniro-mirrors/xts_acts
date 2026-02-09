/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';


export default function NavDestinationJsunit() {
  describe('navDestinationJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("NavDestination beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/NavDestinationPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavDestination state pages: " + JSON.stringify(pages));
        if (!("NavDestinationPage" == pages.name)) {
          console.info("get NavDestination state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push NavDestination page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {


        console.error("push NavDestination page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0100
     * @tc.number NavDestinationJsunit_0100
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0100',  Level.LEVEL0, async (done: Function) => {
      // Get title name of NavDestination component
      console.info('[NavDestinationJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('NavRouter1'));
      await textComponent.click();
      await CommonFunc.sleep(2000);
      let textComponent1 = await driver.findComponent(BY.key('NavDestination1'));
      let text = await textComponent1.getText();
      console.info("[NavDestinationJsunit_0100] text: " + JSON.stringify(text));
      //expect(text == 'NavDestination1').assertTrue();
      console.info('[NavDestinationJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0200
     * @tc.number NavDestinationJsunit_0200
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0200',  Level.LEVEL0, async (done: Function) => {
      // Get backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('NavDestination1');

      console.info("[NavDestinationJsunit_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FF808080');
      console.info('[NavDestinationJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0300
     * @tc.number NavDestinationJsunit_0300
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0300',  Level.LEVEL0, async (done: Function) => {
      // Modify title name of NavDestination component
      console.info('[NavDestinationJsunit_0300] START');
      globalThis.value.message.notify({
        name: 'title', value: 'NavDestinationTitle'
      })
      await CommonFunc.sleep(2000);
      // Get the name of the sub title
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('NavDestination1'));
      let text = await textComponent.getText();
      console.info("[NavDestinationJsunit_0300] text: " + JSON.stringify(text));
      //expect(text == 'NavDestinationTitle1').assertTrue();
      console.info('[NavDestinationJsunit_0300] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0400
     * @tc.number NavDestinationJsunit_0400
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0400',  Level.LEVEL0, async (done: Function) => {
      // Modify backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_0400] START');
      globalThis.value.message.notify({
        name: 'backColor', value: Color.Green
      })
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('NavDestination1');
      
      console.info("[NavDestinationJsunit_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0400] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FF008000');
      console.info('[NavDestinationJsunit_0400] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0500
     * @tc.number NavDestinationJsunit_0500
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0500',  Level.LEVEL0, async (done: Function) => {
      // illegal modify title name of NavDestination component
      console.info('[NavDestinationJsunit_0500] START');
      globalThis.value.message.notify({
        name: 'title', value: 123
      })
      await CommonFunc.sleep(2000);
      // Get the name of the sub title
      let driver = await UiDriver.create()
      let textComponent = await driver.findComponent(BY.key('NavDestination1'));
      let text = await textComponent.getText();
      console.info("[NavDestinationJsunit_0500] text: " + JSON.stringify(text));
      //expect(text == '1231').assertTrue();
      console.info('[NavDestinationJsunit_0500] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0600
     * @tc.number NavDestinationJsunit_0600
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0600',  Level.LEVEL0, async (done: Function) => {
      // illegal modify backgroundColor of NavDestination component
      console.info('[NavDestinationJsunit_0600] START');
      globalThis.value.message.notify({
        name: 'backColor', value: 123
      })
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('NavDestination1');
      
      console.info("[NavDestinationJsunit_0600] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0600] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual('#FF00007B');
      console.info('[NavDestinationJsunit_0600] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0700
     * @tc.number NavDestinationJsunit_0700
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0700',  Level.LEVEL0, async (done: Function) => {
      // Get hideTitleBar value of NavDestination component
      console.info('[NavDestinationJsunit_0700] START');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('NavDestination1');
      
      console.info("[NavDestinationJsunit_0700] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0700] hideTitleBar: " + JSON.stringify(JSON.parse(strJson).$attrs.hideTitleBar));
      //expect(JSON.parse(strJson).$attrs.hideTitleBar).assertTrue();
      console.info('[NavDestinationJsunit_0700] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0800
     * @tc.number NavDestinationJsunit_0800
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0800',  Level.LEVEL0, async (done: Function) => {
      // Modify hideTitleBar value of NavDestination component 
      console.info('[NavDestinationJsunit_0700] START');
      globalThis.value.message.notify({
        name: 'hideTitleBar', value: true
      })
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('NavDestination1');
      
      console.info("[NavDestinationJsunit_0700] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0700] hideTitleBar: " + JSON.stringify(JSON.parse(strJson).$attrs.hideTitleBar));
      //expect(JSON.parse(strJson).$attrs.hideTitleBar).assertTrue();
      console.info('[NavDestinationJsunit_0700] END');
      done();
    });

    /**
     * @tc.name   NavDestinationJsunit_0900
     * @tc.number NavDestinationJsunit_0900
     * @tc.desc   Test HomePageInfo name and param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('NavDestinationJsunit_0900',  Level.LEVEL0, async (done: Function) => {
      // illegal modify hideTitleBar value of NavDestination component 
      console.info('[NavDestinationJsunit_0900] START');
      globalThis.value.message.notify({
        name: 'hideTitleBar', value: 123
      })
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('NavDestination1');
      
      console.info("[NavDestinationJsunit_0900] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[NavDestinationJsunit_0900] hideTitleBar: " + JSON.stringify(JSON.parse(strJson).$attrs.hideTitleBar));
      //expect(JSON.parse(strJson).$attrs.hideTitleBar).assertTrue();
      console.info('[NavDestinationJsunit_0900] END');
      done();
    });
  })
}
