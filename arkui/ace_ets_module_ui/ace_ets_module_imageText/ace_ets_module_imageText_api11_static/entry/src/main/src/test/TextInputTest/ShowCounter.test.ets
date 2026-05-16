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
import { describe, beforeEach, it, expect, Level,beforeAll } from "../../../../hypium/index"
import router from '@ohos.router';
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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function showCounterTest() {
  describe('showCounterTest', () => {
    beforeAll(() => {
      console.info("showCounterTest beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("showCounterTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/ShowCounter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get showCounterTest state pages:" + JSON.stringify(pages));
        if (!("ShowCounter" == pages.name)) {
          console.info("get showCounterTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showCounterTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showCounterTest page error:" + err);
      }
      console.info("showCounterTest beforeEach end");
    });


    
    /**
     * @tc.number   showCounterTest_static_0010
     * @tc.name     showCounterTest_static_0010
     * @tc.desc     showCounterTest_static_0010
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0010', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_static_0010] START');
      let strJson = inspector.getInspectorByKey('showCounter_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_static_0010] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":true,"options":{"thresholdPercentage":40,"highlightBorder":true}}');
      console.info('[showCounterTest_static_0010] END');
      done();
    });

    
    /**
     * @tc.number   showCounterTest_static_0020
     * @tc.name     showCounterTest_static_0020
     * @tc.desc     showCounterTest_static_0020
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0020', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_static_0020] START');
      let strJson = inspector.getInspectorByKey('showCounter_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_static_0020] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":false,"options":{"thresholdPercentage":0,"highlightBorder":true}}');
      console.info('[showCounterTest_static_0020] END');
      done();
    });

    
    /**
     * @tc.number   showCounterTest_static_0030
     * @tc.name     showCounterTest_static_0030
     * @tc.desc     showCounterTest_static_0030
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0030', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_static_0030] START');
      let strJson = inspector.getInspectorByKey('showCounter_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_static_0030] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":false,"options":{"thresholdPercentage":-1,"highlightBorder":true}}');
      console.info('[showCounterTest_static_0030] END');
      done();
    });

    
    /**
     * @tc.number   showCounterTest_static_0040
     * @tc.name     showCounterTest_static_0040
     * @tc.desc     showCounterTest_static_0040
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0040', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_static_0040] START');
      let strJson = inspector.getInspectorByKey('showCounter_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_static_0040] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":false,"options":{"thresholdPercentage":-1,"highlightBorder":true}}');
      console.info('[showCounterTest_static_0040] END');
      done();
    });

    
    /**
     * @tc.number   showCounterTest_static_0050
     * @tc.name     showCounterTest_static_0050
     * @tc.desc     showCounterTest_static_0050
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0050', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_static_0050] START');
      let strJson = inspector.getInspectorByKey('highlightBorder_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_static_0050] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":false,"options":{"thresholdPercentage":0,"highlightBorder":false}}');
      console.info('[showCounterTest_static_0050] END');
      done();
    });

    
    /**
     * @tc.number   showCounterTest_static_0060
     * @tc.name     showCounterTest_static_0060
     * @tc.desc     showCounterTest_static_0060
     * @tc.level    Level.LEVEL0
     */
    it('showCounterTest_static_0060', Level.LEVEL0, async (done: ()=>void) => {
      console.info('[showCounterTest_0060] START');
      let strJson = inspector.getInspectorByKey('highlightBorder_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[showCounterTest_0060] showCounter is: " + JSON.stringify(obj.getElement('$attrs').getElement('showCounter')));
      expect(JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('showCounter'))).assertEqual('{"value":true,"options":{"thresholdPercentage":-1,"highlightBorder":true}}');
      console.info('[showCounterTest_0060] END');
      done();
    });
  })
}

