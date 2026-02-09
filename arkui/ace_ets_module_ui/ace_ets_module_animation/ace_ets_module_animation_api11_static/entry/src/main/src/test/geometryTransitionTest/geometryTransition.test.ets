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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import emitter from '@ohos.events.emitter';
import { UtilsTest } from '../../test/Util.test'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function geometryTransition() {
  describe('geometryTransition', () => {

    beforeAll(() => {
      console.info("geometryTransition beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("geometryTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/geometryTransition/geometryTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get geometryTransition state pages:" + JSON.stringify(pages));
        if (!("geometryTransition" == pages.name)) {
          console.info("get geometryTransition pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });


    
    /**
     * @tc.number   geometryTransition_static_0100
     * @tc.name     geometryTransition_static_0100
     * @tc.desc     geometryTransition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('geometryTransition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('geometryTransition_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('geometry_follow_1'));
      await CommonFunc.sleep(2000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('geometry_follow_2');
      await CommonFunc.sleep(2000);

      console.info("[geometryTransition_static_0100] component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[geometryTransition_static_0100] geometryTransition: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoResize') == "false").assertTrue();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('clip') == "true").assertTrue();
      console.info('[geometryTransition_static_0100] END');
      done();
    })
  })
}