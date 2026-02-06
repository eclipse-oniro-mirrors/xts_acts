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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const waitUiReadyMs = 1000;

export default function loadingProgressJsunit() {
  describe('loadingProgressJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("loadingProgressJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Progress/loadingprogress',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get loadingProgressJsunit state pages:" + JSON.stringify(pages));
        if (!("loadingprogress" == pages.name)) {
          console.info("get loadingProgressJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push loadingProgressJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push loadingProgressJsunit page error:" + err);
        expect().assertFail();
      }

    });


    
/**
     * @tc.number   loadingProgressJsunit_static_0100
     * @tc.name     loadingProgressJsunit_static_0100
     * @tc.desc     loadingProgressJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('loadingProgressJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('loadingProgressJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the gauge component and test attribute
      let strJson = inspector.getInspectorByKey('loadingProgress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('loadingProgressJsunit_static_0100 component obj is:' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF0000FF');
      done();
    });

    
/**
     * @tc.number   loadingProgressJsunit_static_0200
     * @tc.name     loadingProgressJsunit_static_0200
     * @tc.desc     loadingProgressJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('loadingProgressJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('loadingProgressJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the color attribute normal value of loadingProgress dynamically
      AppStorage.get<MessageManager<Color>>("messageManager")!.notify({ name: 'color', value: Color.Green })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('loadingProgress');
      let obj = JSON.parseJsonElement(strJson);
      console.info('loadingProgressJsunit_static_0200 component obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FF008000');
      done();
    });

    
/**
     * @tc.number   loadingProgressJsunit_static_0300
     * @tc.name     loadingProgressJsunit_static_0300
     * @tc.desc     loadingProgressJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('loadingProgressJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('loadingProgressJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the values attribute illegal value of loadingProgress dynamically
      AppStorage.get<MessageManager<String>>("messageManager")!.notify({ name: 'color', value: '-20' })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('loadingProgress');
      let obj = JSON.parseJsonElement(strJson);
      //let resourceColor = getContext().resourceManager.getColorSync($r('sys.color.ohos_id_color_progress').id).toString(16).toUpperCase()
      console.info('loadingProgressJsunit_static_0300  component obj is: ' + JSON.stringify(obj));
      //expect(obj.getElement('$attrs').getString('color')).assertEqual('#' + resourceColor);
      done();
    });

  })
}