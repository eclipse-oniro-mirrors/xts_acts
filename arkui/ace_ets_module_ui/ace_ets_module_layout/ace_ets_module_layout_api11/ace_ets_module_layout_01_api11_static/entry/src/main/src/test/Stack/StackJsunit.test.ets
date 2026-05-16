'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Alignment} from '@ohos.arkui.component'
import events_emitter from '@ohos.events.emitter'
import { UtilsTest,startAbility } from '../Util.test'
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext } from '@ohos.arkui.UIContext';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

// function sleep(time: number) {
//   return new Promise<void>((resolve, reject) => {
//     setTimeout(() => {
//       resolve();
//     }, time * 1000);
//   }).then(() => {
//     console.info(`sleep ${time} over...`);
//   })
// }


export default function StackJsunit() {


  describe('StackTest', () => {
    beforeAll(async () => {
      console.info("StackTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility");

    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router")
        routerInstance?.clear();
        let pages = routerInstance?.getState();
        console.info("get Stack state success " + JSON.stringify(pages));
        if (!("Stack" == pages?.name)) {
          console.info("get Stack state success " + JSON.stringify(pages?.name));
          routerInstance?.pushUrl(options);
          // let result = await router.push(options);
          // console.info("push Stack page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack page error " + JSON.stringify(err));
      }
      // await sleep(2);
      // done();
    });

    afterEach(async () => {
      // await sleep(1);
      console.info("Stack after each called");
    });
    
    



    /**
     * @tc.number   testStackGetInspectorByKey010_static
     * @tc.name     testStackGetInspectorByKey010_static
     * @tc.desc     testStackGetInspectorByKey010_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey010_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetInspectorByKey START');
      let strJson = inspector.getInspectorByKey('stack');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack component obj is: " + JSON.stringify(obj));
      console.log("cd stack type" + JSON.stringify(obj.getString('$type')));
      console.log("cd stack alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      console.info('cd stackGetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey020_static
     * @tc.name     testStackGetInspectorByKey020_static
     * @tc.desc     testStackGetInspectorByKey020_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey020_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack1 component obj is: " + JSON.stringify(obj));
      console.log("cd stack1 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getString('$type')).assertEqual('Stack');
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      console.info('cd stack1GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey030_static
     * @tc.name     testStackGetInspectorByKey030_static
     * @tc.desc     testStackGetInspectorByKey030_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey030_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack2 component obj is: " + JSON.stringify(obj));
      console.log("cd stack2 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      console.info('cd stack2GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey040_static
     * @tc.name     testStackGetInspectorByKey040_static
     * @tc.desc     testStackGetInspectorByKey040_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey040_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack3 component obj is: " + JSON.stringify(obj));
      console.log("cd stack3 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      console.info('cd stack3GetInspectorByKey END');
      done();
    });
    
    



    /**
     * @tc.number   testStackGetInspectorByKey050_static
     * @tc.name     testStackGetInspectorByKey050_static
     * @tc.desc     testStackGetInspectorByKey050_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey050_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack4 component obj is: " + JSON.stringify(obj));
      console.log("cd stack4 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      console.info('cd stack4GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey060_static
     * @tc.name     testStackGetInspectorByKey060_static
     * @tc.desc     testStackGetInspectorByKey060_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey060_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack5 component obj is: " + JSON.stringify(obj));
      console.log("cd stack5 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      console.info('cd stack5GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey070_static
     * @tc.name     testStackGetInspectorByKey070_static
     * @tc.desc     testStackGetInspectorByKey070_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey070_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack6');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack6 component obj is: " + JSON.stringify(obj));
      console.log("cd stack6 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      console.info('cd stack6GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey080_static
     * @tc.name     testStackGetInspectorByKey080_static
     * @tc.desc     testStackGetInspectorByKey080_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey080_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack7 component obj is: " + JSON.stringify(obj));
      console.log("cd stack7 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      console.info('cd stack7GetInspectorByKey END');
      done();
    });

    
    



    /**
     * @tc.number   testStackGetInspectorByKey090_static
     * @tc.name     testStackGetInspectorByKey090_static
     * @tc.desc     testStackGetInspectorByKey090_static
     * @tc.level    Level.LEVEL0
     */
    it('testStackGetInspectorByKey090_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let strJson = inspector.getInspectorByKey('stack8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("cd stack8 component obj is: " + JSON.stringify(obj));
      console.log("cd stack8 alignContent" + JSON.stringify(obj.getElement('$attrs').getString('alignContent')));
      expect(obj.getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      console.info('cd stack8GetInspectorByKey END');
      done();
    });
  })
}
