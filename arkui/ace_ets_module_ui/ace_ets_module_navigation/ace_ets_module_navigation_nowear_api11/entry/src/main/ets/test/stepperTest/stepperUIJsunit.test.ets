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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';
const waitUiReadyMs = 1000;

export default function stepperUIJsunit() {
  describe('stepperUIJsunit',  () =>{
    beforeEach(async  (done:Function) =>{
      console.info("stepperUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stepper/stepperUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stepperUIJsunit state pages:" + JSON.stringify(pages));
        if (!("stepperUI" == pages.name)) {
          console.info("get stepperUIJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push stepperUIJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
          console.error("push stepperUIJsunit page error:" + err);
	        expect().assertFail();
      }
      done();
    });

    it('stepperUIJsunit_0100',  Level.LEVEL0, async  (done:Function) =>{
       console.info('stepperUIJsunit_0100');
       await CommonFunc.sleep(1000);
       // get the stepperItem component and test attribute
       let strJson: string = getInspectorByKey('stepperTwo');
       let obj: Record<string, ESObject> = JSON.parse(strJson);
       console.info('stepperUIJsunit_0100 component obj is: ' + obj.$attrs.nextLabel + "---" + obj.$attrs.prevLabel + "---" + obj.$attrs.status);
       expect(obj.$attrs.nextLabel).assertEqual('下一步');
       expect(obj.$attrs.prevLabel).assertEqual('返回');
       expect(obj.$attrs.status).assertEqual('ItemState.Normal');
       done();
    });

   it('stepperUIJsunit_0200',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0200 START');
      // modify the normal value of stepperItem dynamically
      globalThis.value.message.notify({name:'nextLabel',value:'hhe'});
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'prevLabel',value:'hha'});
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'status',value:ItemState.Waiting});
      await CommonFunc.sleep(2000);
      // check the parameter value
      let strJson: string = getInspectorByKey('stepperTwo');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0200 component obj is: ' + obj.$attrs.nextLabel + "---" + obj.$attrs.prevLabel + "---" + obj.$attrs.status);
      expect(obj.$attrs.nextLabel).assertEqual('hhe');
      expect(obj.$attrs.prevLabel).assertEqual('hha');
      //expect(obj.$attrs.status).assertEqual('ItemState.Waiting');
      done();   
    });

    it('stepperUIJsunit_0300',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // test the status of enum value dynamically
      globalThis.value.message.notify({name:'status',value:ItemState.Disabled})
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('stepperTwo');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0300 component obj is: ' + obj.$attrs.status);
      //expect(obj.$attrs.status).assertEqual('ItemState.Disabled');
      globalThis.value.message.notify({name:'status',value:ItemState.Skip})
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('stepperTwo');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info('stepperUIJsunit_0300 component obj2 is: ' + obj2.$attrs.status);
      //expect(obj2.$attrs.status).assertEqual('ItemState.Skip');
      done();   
   });
   
    it('stepperUIJsunit_0400',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0400 START');
       await CommonFunc.sleep(1000);
      // test the status of illegal enum value dynamically
      globalThis.value.message.notify({name:'status',value:7})
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('stepperTwo');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0400 component obj is: ' + obj.$attrs.status);
      expect(obj.$attrs.status).assertEqual('ItemState.Normal');
      done();   
    });

    it('stepperUIJsunit_0500',  Level.LEVEL0, async  (done:Function) =>{
       console.info('stepperUIJsunit_0500 START');
      // get the stepper component and test attribute
       await CommonFunc.sleep(1000);
       // get the stepperItem component and test attribute
       let strJson: string = getInspectorByKey('stepkey');
       let obj: Record<string, ESObject> = JSON.parse(strJson);
       console.info('stepperUIJsunit_0500 component obj is: ' + obj.$attrs.index);
       expect(obj.$attrs.index).assertEqual('0');
       done();
    });

    it('stepperUIJsunit_0600',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0600 START');
      globalThis.value.message.notify({name:'status',value:ItemState.Normal});
      // test the stepper onChange onNext onPrevious event
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      let button = await driver.findComponent(BY.text('Next'));
      await button.click();
      console.info('stepperUIJsunit_0600 button click succ');
      await CommonFunc.sleep(1000);
      // reset the component init status
      globalThis.value.message.notify({name:'nextLabel',value:'下一步'});
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'prevLabel',value:'返回'});
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(BY.text('下一步'));
      await button2.click();
      console.info('stepperUIJsunit_0600 button2 click succ');
      await CommonFunc.sleep(1000);
      let strJson: string = getInspectorByKey('pageThree');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0600 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Page Three');
      // test the previous
      let button3 = await driver.findComponent(BY.text('返回'));
      await button3.click();
      await CommonFunc.sleep(1000);
      console.info('stepperUIJsunit_0600 button3 click succ');
      let strJson1 = getInspectorByKey('pageTwo');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info('stepperUIJsunit_0600 component obj1 is: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('Page Two');
      done();
    });

    it('stepperUIJsunit_0700',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0700 START');
      // test the stepper onFinish event
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      await CommonFunc.sleep(2000);
      let button2 = await driver.findComponent(BY.text('下一步'));
      await button2.click();
      console.info('stepperUIJsunit_0700 button2 click succ');
      await CommonFunc.sleep(2000);
      let button3 = await driver.findComponent(BY.text('下一步'));
      await button3.click();
      console.info('stepperUIJsunit_0700 button3 click succ');
      await CommonFunc.sleep(2000);
      let button4 = await driver.findComponent(BY.text('开始'));
      await button4.click();
      console.info('stepperUIJsunit_0700 button4 click succ');
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('pageOne');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0700 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Page One');
      done();
    });
    
    it('stepperUIJsunit_0800',  Level.LEVEL0, async  (done:Function) =>{
      console.info('stepperUIJsunit_0800');
      // test the stepper onSkip event
      await CommonFunc.sleep(1000);
      let driver = UiDriver.create();
      let button = await driver.findComponent(BY.text('Next'));
      await button.click();
      await CommonFunc.sleep(2000);
      let strJson: string = getInspectorByKey('pageTwo');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('stepperUIJsunit_0800 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('Page Two');
      done();
    });
  })
}
