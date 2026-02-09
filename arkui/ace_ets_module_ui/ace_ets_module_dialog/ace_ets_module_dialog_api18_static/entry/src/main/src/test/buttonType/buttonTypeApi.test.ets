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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let emitKey = 'emitUserAgent';

export default function buttonTypeTest() {
  describe('ActsbuttonTypeTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
    })

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/buttonType/buttonTypeApi',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages = DialogOptions.getState();
        console.info('get buttonType state success ' + JSON.stringify(pages));
        if (!('buttonTypeApi' == pages.name)) {
          console.info('get buttonType state success ' + JSON.stringify(pages.name));
          DialogOptions.pushUrl(options)
          console.info('push buttonTypeApi page success ');
        }
      } catch (err) {
        console.error('push buttonType page error ' + JSON.stringify(err));
      }
    });
    
    
/**
     * @tc.number   buttonType_static_0200
     * @tc.name     buttonType_static_0200
     * @tc.desc     buttonType_static_0200
     * @tc.level    Level.LEVEL2
     */
it('buttonType_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('buttonType_static_0200 start');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('key_ButtonType_002');
          console.info('[buttonType_static_0200]:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')));
          expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('buttonType_static_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
