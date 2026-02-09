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
import { afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../ets/MainAbility/common/Rect'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test.ets'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function gestureInterceptionEnhancementCallbackRecognizerTest() {
  describe('gestureInterceptionEnhancementCallbackRecognizerTest', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsEvents.api13.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("gestureInterceptionEnhancementCallbackRecognizerTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureInterceptionEnhancement/tabsInterceptionRecognizerTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get gestureInterceptionEnhancementCallbackRecognizerTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSpaceResourcePage" == pages.name)) {
          console.info("get gestureInterceptionEnhancementCallbackRecognizerTest pages.name:" +
          JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push gestureInterceptionEnhancementCallbackRecognizerTest page error:" + err);
      }
      console.info("gestureInterceptionEnhancementCallbackRecognizerTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1500);
    });

    
    /**
     * @tc.number   gestureInterceptionEnhancementCallbackRecognizerTest_static_0010
     * @tc.name     gestureInterceptionEnhancementCallbackRecognizerTest_static_0010
     * @tc.desc     gestureInterceptionEnhancementCallbackRecognizerTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('gestureInterceptionEnhancementCallbackRecognizerTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info(' gestureInterceptionEnhancementCallbackRecognizerTest_static_0010 START');
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let firstTabs = CommonFunc.getComponentRectOnScreen('firstTabsContentR');
        let top = firstTabs.top;
        let right = firstTabs.right;
        let left = firstTabs.left;
        let bottom = firstTabs.bottom;
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010 value is" + left + " --" +
          right + "--" + top + "--" + bottom);
        let height = bottom - top;
        let width = right - left;
        await CommonFunc.sleep(1000);
        // tabs nest scroll
        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);

        await driver.swipe(Math.round(left + width * 0.8) as Int, Math.round(top + height / 2) as Int,
          Math.round(left) as Int, Math.round(top + height / 2) as Int);
        await CommonFunc.sleep(2500);
        // check the callback data
        let strJson = inspector.getInspectorByKey('eventceshi');
        await CommonFunc.sleep(2500);
        let obj = JSON.parseJsonElement(strJson);
        console.info("[ gestureInterceptionEnhancementCallbackRecognizerTest_static_0010 ] content: " +
          strJson);
        let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('content'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getInteger('type'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getString('tag'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getBoolean('isBuildIn'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getBoolean('isEnabled'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getInteger('getState'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getString('getId'));
        console.info("gestureInterceptionEnhancementCallbackRecognizerTest_static_0010" + obj2.getBoolean('isValid'));
        expect(obj2.getString('tag')).assertEqual("");
        expect(obj2.getInteger('type') == 2).assertTrue();
        expect(obj2.getBoolean('isBuildIn')).assertTrue();
        expect(obj2.getBoolean('isEnabled')).assertTrue();
        expect(obj2.getInteger('getState') == 1)
        expect(obj2.getString('getId')).assertEqual("");
        expect(obj2.getBoolean('isValid')).assertTrue();
        let strJson2 = inspector.getInspectorByKey('eventArray');
        let objA = JSON.parseJsonElement(strJson2);
        console.info("[ gestureInterceptionEnhancementCallbackRecognizerTest_static_0010 ] contentA: " +
        JSON.stringify(objA.getElement('$attrs').getString('content')));
        let objAA = JSON.parseJsonElement(objA.getElement('$attrs').getString('content'));
        expect(objAA.asArray()[0].getString('tag')).assertEqual("");
        expect(objAA.asArray()[0].getInteger('type') == 2).assertTrue();
        expect(objAA.asArray()[0].getBoolean('isBuildIn')).assertTrue();
        expect(objAA.asArray()[0].getBoolean('isEnabled')).assertTrue();
        expect(objAA.asArray()[0].getInteger('getState') == 1).assertTrue();
        expect(objAA.asArray()[0].getString('getId')).assertEqual("");
        expect(objAA.asArray()[0].getBoolean('isValid')).assertTrue();
        expect(objAA.asArray()[1].getString('tag')).assertEqual("");
        expect(objAA.asArray()[1].getInteger('type') == 2).assertTrue();
        expect(objAA.asArray()[1].getBoolean('isBuildIn')).assertTrue();
        expect(objAA.asArray()[1].getBoolean('isEnabled')).assertTrue();
        expect(objAA.asArray()[1].getInteger('getState') == 1)
        expect(objAA.asArray()[1].getString('getId')).assertEqual("");
        expect(objAA.asArray()[1].getBoolean('isValid')).assertTrue();
        done();
      });

  })
}

