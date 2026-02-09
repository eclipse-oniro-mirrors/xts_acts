'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function borderJsunit() {
  describe('borderTest_five_1', () => {

    beforeAll(() => {
      console.info("borderTest_five_1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("borderTest_five_1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/border',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get borderTest_five_1 state pages:" + JSON.stringify(pages));
        if (!("border" == pages.name)) {
          console.info("get borderTest_five_1 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push borderTest_five_1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push borderTest_five_1 page error:" + err);
      }
      console.info("borderTest_five_1 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("border after each called");
    });

    
    /**
     * @tc.number   testBorder_static_0100
     * @tc.name     testBorder_static_0100
     * @tc.desc     testBorder_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('testBorder_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBorder_static_0100 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('borderWidth');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBorder_static_0100 component strJson:" + strJson);
      console.info("testBorder_static_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual("5.00vp");
      console.info('testBorder_static_0100 END');
      done();
    });

    /**
     * @tc.number   testBorder_static_0200
     * @tc.name     testBorder_static_0200
     * @tc.desc     testBorder_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('testBorder_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBorder_static_0200 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('borderColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBorder_static_0200 component strJson:" + strJson);
      console.info("testBorder_static_0200 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('borderColor')).assertEqual("#FF317AF7");
      console.info('testBorder_static_0200 END');
      done();
    });

    /**
     * @tc.number   testBorder_static_0300
     * @tc.name     testBorder_static_0300
     * @tc.desc     testBorder_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('testBorder_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBorder_static_0300 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: emitter.EventData = {
          data: {
            "borderRadius": 70
          } as Record<String,RecordData>
        } as emitter.EventData
        let innerEvent: emitter.InnerEvent = {
          eventId: 3,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testBorder_static_0300] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err :Error) {
        console.log("[testBorder_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('borderRadius');
      console.info("testBorder_static_0300 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBorder_static_0300 component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderRadius'));
      expect(obj.getElement('$attrs').getString('borderRadius')).assertEqual("70.00vp");
      console.info('testBorder_static_0300 END');
      done();
    });
  })
}

