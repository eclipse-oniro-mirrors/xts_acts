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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RadioIndicatorType() {
  describe('RadioIndicatorType', () => {

    beforeAll(() => {
      console.info("RadioIndicatorType beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("RadioIndicatorType beforeAll end");
    });

    beforeEach(async () => {
      console.info("RadioIndicatorType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Radio/RadioIndicatorType',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get RadioIndicatorType state success " + JSON.stringify(pages));
        if (!("RadioIndicatorType" == pages.name)) {
          console.info("get RadioIndicatorType state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push RadioIndicatorType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RadioIndicatorType page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RadioIndicatorType after each called");
    });


    
    /**
     * @tc.number   RadioIndicatorType_static_001
     * @tc.name     RadioIndicatorType_static_001
     * @tc.desc     RadioIndicatorType_static_001
     * @tc.level    Level.LEVEL1
     */
    it('RadioIndicatorType_static_001', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('[RadioIndicatorType_static_001] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('RadioIndicatorType_Radio1');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RadioIndicatorType_static_001] obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getString('indicatorType')).assertEqual('TICK');

      console.info('[RadioIndicatorType_static_001] END');
      done();
    });



    
    /**
     * @tc.number   RadioIndicatorType_static_002
     * @tc.name     RadioIndicatorType_static_002
     * @tc.desc     RadioIndicatorType_static_002
     * @tc.level    Level.LEVEL1
     */
    it('RadioIndicatorType_static_002', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('[RadioIndicatorType_static_002] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('RadioIndicatorType_Radio2');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RadioIndicatorType_static_002] obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getString('indicatorType')).assertEqual('DOT');

      console.info('[RadioIndicatorType_static_002] END');
      done();
    });

    
    /**
     * @tc.number   RadioIndicatorType_static_003
     * @tc.name     RadioIndicatorType_static_003
     * @tc.desc     RadioIndicatorType_static_003
     * @tc.level    Level.LEVEL1
     */
    it('RadioIndicatorType_static_003', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('[RadioIndicatorType_static_003] START');
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('RadioIndicatorType_Radio3');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[RadioIndicatorType_static_003] obj1 is: " + JSON.stringifyJsonElement(obj1));
      expect(obj1.getElement('$attrs').getString('indicatorType')).assertEqual('CUSTOM');

      let strJson2 = inspector.getInspectorByKey('RadioIndicatorType_Text');
      let obj2 = JSON.parseJsonElement(strJson2);
      await CommonFunc.sleep(1000);
      console.info("[RadioIndicatorType_static_003] obj2 is: " + JSON.stringifyJsonElement(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('Custom');

      console.info('[RadioIndicatorType_static_003] END');
      done();
    });


  })
}


