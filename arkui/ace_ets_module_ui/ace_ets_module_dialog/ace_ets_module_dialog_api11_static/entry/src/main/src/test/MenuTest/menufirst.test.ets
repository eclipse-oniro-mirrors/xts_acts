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
import router from '@ohos.router';
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function menuTest() {
  describe('ActsMenuFirstTest', () => {
    beforeAll(() => {
      console.info("ActsMenuFirstTest beforeAll start")

      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")

      console.info("ActsMenuFirstTest  beforeAll end")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menufirst",
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get menufirst state pages: " + JSON.stringify(pages));
        if (!("menufirst" == pages.name)) {
          console.info("get menufirst state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menufirst success: " + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push menufirst page error " + JSON.stringify(err));
      }
      await sleep(2000)

    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_EnableArrow_static_0100
     * @tc.name     ArkUX_Stage_Menu_EnableArrow_static_0100
     * @tc.desc     ArkUX_Stage_Menu_EnableArrow_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_EnableArrow_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("menu"))
      console.info('ArkUX_Stage_Menu_EnableArrow_static_0100 enableArrow :' +
      JSON.stringify(obj.getElement('$attrs').tryGetElement('enableArrow')));
      expect(obj.getElement('$attrs').tryGetElement('enableArrow')).assertEqual(undefined)
      done()
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_ArrowOffset_static_0100
     * @tc.name     ArkUX_Stage_Menu_ArrowOffset_static_0100
     * @tc.desc     ArkUX_Stage_Menu_ArrowOffset_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_ArrowOffset_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey("menu"))
      console.info('ArkUX_Stage_Menu_ArrowOffset_static_0100 arrowOffset :' +
      JSON.stringify(obj.getElement('$attrs').tryGetElement('arrowOffset')));
      expect(obj.getElement('$attrs').tryGetElement('arrowOffset')).assertEqual(undefined)
      done()
    })
  })
}