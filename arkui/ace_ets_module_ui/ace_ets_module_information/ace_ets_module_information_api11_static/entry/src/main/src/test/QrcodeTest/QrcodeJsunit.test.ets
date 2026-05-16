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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

function sleep(time: int) {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}


export default function qrcodeJsunit() {

  describe('QrcodeTest', () => {
    beforeAll(() => {
      console.info("QrcodeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Qrcode/Qrcode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Qrcode state success " + JSON.stringify(pages));
        if (!("Qrcode" == pages.name)) {
          console.info("get Qrcode state success " + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          // console.info("push Qrcode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Qrcode page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async (): Promise<void> => {
      await sleep(1);
      console.info("Qrcode after each called");
    });

    
    /**
     * @tc.number   testGetQrcodeAttr_static_010
     * @tc.name     testGetQrcodeAttr_static_010
     * @tc.desc     testGetQrcodeAttr_static_010
     * @tc.level    Level.LEVEL0
     */
it('testGetQrcodeAttr_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGetQrcodeAttr START');
      let strJson = inspector.getInspectorByKey('qrcode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("Qrcode component obj is: " + JSON.stringify(obj));
      console.info("qrcode backgroundColor" + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      console.info("qrcode width" + JSON.stringify(obj.getElement('$attrs').getString('width')));
      console.info("qrcode height" + JSON.stringify(obj.getElement('$attrs').getString('height')));
      console.info("qrcode value" + JSON.stringify(obj.getElement('$attrs').getString('value')));
      expect(obj.getElement('$attrs').getString('value')).assertEqual("hello world")
      console.info('testGetQrcodeAttr END');
      done();
    });
  })
}
