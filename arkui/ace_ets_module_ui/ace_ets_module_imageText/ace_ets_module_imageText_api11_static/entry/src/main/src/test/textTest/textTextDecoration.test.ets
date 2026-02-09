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
import {
  TextDecorationType,
  ResourceColor,
  Color,
  $r
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import Utils from '../Utils.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { MessageManagerBase } from '../../../ets/MainAbility/common/MessageManager2';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface ValueType { 
  type?:TextDecorationType,
  color?:ResourceColor
}
export default function textTextDecorationTest() {
  describe('textTextDecorationTest', ()=> {

    beforeAll(() => {
      console.info("textTextDecorationTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("textTextDecorationTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/text/textDecoration',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get textTextDecorationTest state pages:" + JSON.stringify(pages));
        if (!("textDecoration" == pages.name)) {
          console.info("get textTextDecorationTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push textTextDecorationTest page error:" + err);
      }
      console.info("textTextDecorationTest beforeEach end");
    });


    afterEach(async  ()=> {
      await CommonFunc.sleep(1000)
      console.info("TextDecoration after each called");
    })

    
    /**
     * @tc.number   textTextDecoration_static_0100
     * @tc.name     textTextDecoration_static_0100
     * @tc.desc     textTextDecoration_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('textTextDecoration_static_0100', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextDecoration_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<TextDecorationType|undefined>>("messageManagerTextDecorationType")?.notify({
          name: 'textDecorationType', value: undefined
        });
        AppStorage.get<MessageManagerBase<ResourceColor|undefined>>("messageManagerTextDecorationColor")?.notify({
          name: 'textDecorationColor', value: undefined
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textDecoration')
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));

      expect(obj.getElement('$attrs').getString('decoration'))
      .assertEqual('{"type":"TextDecorationType.None","color":"#FF000000","style":"TextDecorationStyle.SOLID"}');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textTextDecoration_static_0200
     * @tc.name     textTextDecoration_static_0200
     * @tc.desc     textTextDecoration_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('textTextDecoration_static_0200', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextDecoration_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<TextDecorationType|undefined>>("messageManagerTextDecorationType")?.notify({
          name: 'textDecorationType', value: TextDecorationType.Underline
        });
        AppStorage.get<MessageManagerBase<ResourceColor|undefined>>("messageManagerTextDecorationColor")?.notify({
          name: 'textDecorationColor', value: Color.Black
        });

      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textDecoration')
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));

      expect(obj.getElement('$attrs').getString('decoration'))
      .assertEqual('{"type":"TextDecorationType.Underline","color":"#FF000000","style":"TextDecorationStyle.SOLID"}');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    /**
     * @tc.number   textTextDecoration_static_0300
     * @tc.name     textTextDecoration_static_0300
     * @tc.desc     textTextDecoration_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('textTextDecoration_static_0300', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextDecoration_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        AppStorage.get<MessageManagerBase<TextDecorationType|undefined>>("messageManagerTextDecorationType")?.notify({
          name: 'textDecorationType', value: TextDecorationType.Overline
        });
        AppStorage.get<MessageManagerBase<ResourceColor|undefined>>("messageManagerTextDecorationColor")?.notify({
          name: 'textDecorationColor', value: Color.Red
        });
      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textDecoration')
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));

      expect(obj.getElement('$attrs').getString('decoration'))
      .assertEqual('{"type":"TextDecorationType.Overline","color":"#FFFF0000","style":"TextDecorationStyle.SOLID"}');


      console.info('[' + tagName + '] END ===========================');
      done();
    });

     
    /**
     * @tc.number   textTextDecoration_static_0400
     * @tc.name     textTextDecoration_static_0400
     * @tc.desc     textTextDecoration_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('textTextDecoration_static_0400', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextDecoration_static_0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {

        AppStorage.get<MessageManagerBase<TextDecorationType|undefined>>("messageManagerTextDecorationType")?.notify({
          name: 'textDecorationType', value: TextDecorationType.None
        });
        AppStorage.get<MessageManagerBase<ResourceColor|undefined>>("messageManagerTextDecorationColor")?.notify({
          name: 'textDecorationColor', value: Color.Blue
        });

      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);

      let strJsonNew = inspector.getInspectorByKey('key_text_textDecoration')
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));

      expect(obj.getElement('$attrs').getString('decoration'))
      .assertEqual('{"type":"TextDecorationType.None","color":"#FF0000FF","style":"TextDecorationStyle.SOLID"}');


      console.info('[' + tagName + '] END ===========================');
      done();
    });

     
     /**
     * @tc.number   textTextDecoration_static_0500
     * @tc.name     textTextDecoration_static_0500
     * @tc.desc     textTextDecoration_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('textTextDecoration_static_0500', Level.LEVEL0, async (done: ()=>void) => {
      let tagName = 'textTextDecoration_static_0500';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {

        AppStorage.get<MessageManagerBase<TextDecorationType|undefined>>("messageManagerTextDecorationType")?.notify({
          name: 'textDecorationType', value: TextDecorationType.None
        });
        AppStorage.get<MessageManagerBase<ResourceColor|undefined>>("messageManagerTextDecorationColor")?.notify({
          name: 'textDecorationColor', value: $r('app.color.color_D90013_red')
        });

      } catch (err:Error) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = inspector.getInspectorByKey('key_text_textDecoration');
      let obj  = JSON.parseJsonElement(strJsonNew);
      console.info('[' + tagName + '] Text decoration is: ' + JSON.stringify(obj.getElement('$attrs').getString('decoration')));

      expect(obj.getElement('$attrs').getString('decoration'))
      .assertEqual('{"type":"TextDecorationType.None","color":"#FFD90013","style":"TextDecorationStyle.SOLID"}');
  
        
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}
