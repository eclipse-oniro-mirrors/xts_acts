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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Point} from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onSelectionChange5() {
  describe('onSelectionChange5', () => {
    beforeAll(() => {
      console.info("onSelectionChange5 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.api12.static", "EntryAbility")

    });
    beforeEach(async () => {
      console.info("onSelectionChange5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/onSelectionChange5',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get onSelectionChange5 state pages:" + JSON.stringify(pages));
        if (!("onSelectionChange5" == pages.name)) {
          console.info("get onSelectionChange5 pages.name:" + JSON.stringify(pages.name));
          //let result = await router.push(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push onSelectionChange5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onSelectionChange5 page error:" + err);
      }
      console.info("onSelectionChange5 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onSelectionChange5 after each called");
    });
    
    
/**
     * @tc.number   onSelectionChange5_static_0100
     * @tc.name     onSelectionChange5_static_0100
     * @tc.desc     onSelectionChange5_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('onSelectionChange5_static_0100', Level.LEVEL2, async (done: ()=>void) => {
      console.info('[onSelectionChange5_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(300);



        let richEditor = await driver.findComponent(ON.id('onSelectionChange5_RichEditor'));
        await (richEditor?.longClick() as Promise<void>);
        await CommonFunc.sleep(1000);
        let Select  = await driver.findComponent(ON.text('全选'))
        await (Select?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        let text1_1 = inspector.getInspectorByKey('onSelectionChange5_text1');
        let Obj1_1=JSON.parseJsonElement(text1_1);
        expect(Obj1_1.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_1 = inspector.getInspectorByKey('onSelectionChange5_text2');
        let Obj2_1=JSON.parseJsonElement(text2_1);
        expect(Obj2_1.getElement('$attrs').getString('content')).assertEqual('0');
        let text3_1 = inspector.getInspectorByKey('onSelectionChange5_text3');
        let Obj3_1=JSON.parseJsonElement(text3_1);
        expect(Obj3_1.getElement('$attrs').getString('content')).assertEqual('4');

        let copy = await driver.findComponent(ON.text('复制'))
        await (copy?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let text1_2 = inspector.getInspectorByKey('onSelectionChange5_text1');
        let Obj1_2=JSON.parseJsonElement(text1_2);
        expect(Obj1_2.getElement('$attrs').getString('content')).assertEqual('2');
        let text2_2 = inspector.getInspectorByKey('onSelectionChange5_text2');
        let Obj2_2=JSON.parseJsonElement(text2_2);
        expect(Obj2_2.getElement('$attrs').getString('content')).assertEqual('0');
        let text3_2 = inspector.getInspectorByKey('onSelectionChange5_text3');
        let Obj3_2=JSON.parseJsonElement(text3_2);
        expect(Obj3_2.getElement('$attrs').getString('content')).assertEqual('4');
        await CommonFunc.sleep(2500);

        let richEditor2 = await driver.findComponent(ON.id('onSelectionChange5_RichEditor'));
        // doubleClick
        let centerPoint = await (richEditor2?.getBoundsCenter() as Promise<Point>);
        let point = `${centerPoint.x} ${centerPoint.y}`;
        let cmd = `uinput -T -d ${point} -u ${point} -i 50 -d ${point} -u ${point}`;
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        abilityDelegator.executeShellCommand(cmd);
        await CommonFunc.sleep(2000);

        let paste = await driver.findComponent(ON.text('粘贴'))
        await (paste?.click() as Promise<void>)
        await CommonFunc.sleep(1000);
        let text1_3 = inspector.getInspectorByKey('onSelectionChange5_text1');
        let Obj1_3=JSON.parseJsonElement(text1_3);
        expect(Obj1_3.getElement('$attrs').getString('content')).assertEqual('4');
        let text2_3 = inspector.getInspectorByKey('onSelectionChange5_text2');
        let Obj2_3=JSON.parseJsonElement(text2_3);
        expect(Obj2_3.getElement('$attrs').getString('content')).assertEqual('5');
        let text3_3 = inspector.getInspectorByKey('onSelectionChange5_text3');
        let Obj3_3=JSON.parseJsonElement(text3_3);
        expect(Obj3_3.getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[onSelectionChange5_0100] END');
      done();
    });

  })
}
