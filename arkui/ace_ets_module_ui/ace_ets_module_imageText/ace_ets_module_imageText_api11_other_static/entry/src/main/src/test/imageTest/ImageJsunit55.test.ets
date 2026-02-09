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


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function imageJsunit55() {
  describe('imageText55', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("image beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/image55',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get image state pages:" + JSON.stringify(pages));
        if (!("image" == pages.name)) {
          console.info("get image pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push image page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push image page error:" + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("image after each called");
    });

    
/**
     * @tc.number   imageTest_static_0100
     * @tc.name     imageTest_static_0100
     * @tc.desc     imageTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('imageTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTest_0100 START');
      await CommonFunc.sleep(4000);
      let strJson: string = inspector.getInspectorByKey('text');
      console.info("imageTest_0100 component strJson:" + strJson);
      console.info("imageTest_0100 JSON.parseJsonElement(strJson).getElement('$attrs').getString('content') is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('string_hello');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString("fontSize")).assertEqual('9.00fp');
      console.info('imageTest_0100 END');
      done();
    });

    
/**
     * @tc.number   imageTest_static_0200
     * @tc.name     imageTest_static_0200
     * @tc.desc     imageTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('imageTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTest_0200 START');
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('image');
      console.info("imageTest_0200 component strJson:" + strJson);
      console.info("imageTest_0200 JSON.parseJsonElement(strJson).getElement('$attrs').getString('src') is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('src'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test.png');
      console.info('imageTest_0200 END');
      done();
    });
  })
}