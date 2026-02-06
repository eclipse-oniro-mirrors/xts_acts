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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function columnSplitJsunit() {
  describe('columnSplitTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/columnSplit',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get columnSplit state pages:" + JSON.stringify(pages));
        if (!("columnSplit" == pages.name)) {
          console.info("get columnSplit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push columnSplit page error: " + err);
      }
    });


    
    /**
     * @tc.number   columnSplitTest_static_0001
     * @tc.name     columnSplitTest_static_0001
     * @tc.desc     columnSplitTest_static_0001
     * @tc.level    Level.LEVEL0
     */
it('columnSplitTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('columnSplitTest_0001 START');
      let strJsonNew = inspector.getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0001 component is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('divider')?.getString('startMargin'))
        .assertEqual('10.00px');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getElement('divider')?.getString('endMargin'))
        .assertEqual('10.00px');
      console.info('columnSplitTest_0001 END');
      done();
    });


    
    /**
     * @tc.number   columnSplitTest_static_0002
     * @tc.name     columnSplitTest_static_0002
     * @tc.desc     columnSplitTest_static_0002
     * @tc.level    Level.LEVEL0
     */
it('columnSplitTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('columnSplitTest_0002 START');
      let strJsonNew = inspector.getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0002 component is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('resizeable')).assertEqual("false");
      console.info('columnSplitTest_0002 END');
      done();
    });


    
    /**
     * @tc.number   columnSplitTest_static_0003
     * @tc.name     columnSplitTest_static_0003
     * @tc.desc     columnSplitTest_static_0003
     * @tc.level    Level.LEVEL0
     */
it('columnSplitTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('columnSplitTest_0003 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000)

      let strJsonNew = inspector.getInspectorByKey('columnSplit');
      console.info("columnSplitTest_0003 component is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getElement('$attrs')));

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('resizeable')).assertEqual("true");
      console.info('columnSplitTest_0003 END');
      done();
    });

  })
}