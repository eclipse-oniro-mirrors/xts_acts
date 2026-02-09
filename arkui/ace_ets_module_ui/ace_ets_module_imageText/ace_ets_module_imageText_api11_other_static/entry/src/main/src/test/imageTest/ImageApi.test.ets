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


export default function ImageApi() {
  describe('ImageApi', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ImageApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageApi',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageApi state pages:" + JSON.stringify(pages));
        if (!("ImageApi" == pages.name)) {
          console.info("get ImageApi pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ImageApi page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push ImageApi page error: " + err);
      }

    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ImageApi after each called");
    });

    
    
/**
     * @tc.number   ImageApi_static_001
     * @tc.name     ImageApi_static_001
     * @tc.desc     ImageApi_static_001
     * @tc.level    Level.LEVEL2
     */
it('ImageApi_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[ImageApi_001] START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('ImageApi_Image');
      await CommonFunc.sleep(1000);
      console.info("[ImageApi_001] obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement("$type").asString()).assertEqual('Image');
      console.info('[ImageApi_001] END');
      done();
    });
  })
}


