/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index'
import events_emitter from '@ohos.events.emitter';
import Utils from "../../../ets/MainAbility/common/Utils";
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { $r } from '@ohos.arkui.component';
import { ArrowPosition, Resource } from '@ohos.arkui.component';

export default function SelectTest() {
  describe('SelectTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Select/Select',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Select state success " + JSON.stringify(pages));
        if (!("Select" == pages.name)) {
          console.info("get Select state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // let result = await router.pushUrl(options);
          // console.info("push Select page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Select page error: " + err);
      }
    });

    
    

/**
     * @tc.number   ArkUX_Select_Visual_0030
     * @tc.name     ArkUX_Select_Visual_0030
     * @tc.desc     ArkUX_Select_Visual_0030
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Select_Visual_0030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_0030 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0030');
          console.info('ArkUX_Select_Visual_0030 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_0030 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("300.000000");
          expect(optionHeight).assertEqual("300.000000");
          console.info('ArkUX_Select_Visual_0030 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0030 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });




/**
     * @tc.number   ArkUX_Select_Visual_0040
     * @tc.name     ArkUX_Select_Visual_0040
     * @tc.desc     ArkUX_Select_Visual_0040
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Select_Visual_0040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_0040 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0040');
          console.info('ArkUX_Select_Visual_0040 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_0040 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("600.000000");
          expect(optionHeight).assertEqual("600.000000");
          console.info('ArkUX_Select_Visual_0040 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0040 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });




/**
     * @tc.number   ArkUX_Select_Visual_0050
     * @tc.name     ArkUX_Select_Visual_0050
     * @tc.desc     ArkUX_Select_Visual_0050
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Select_Visual_0050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_0050 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0050');
          console.info('ArkUX_Select_Visual_0050 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_0050 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("900.000000");
          expect(optionHeight).assertEqual("900.000000");
          console.info('ArkUX_Select_Visual_0050 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0050 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });




/**
     * @tc.number   ArkUX_Select_Visual_0060
     * @tc.name     ArkUX_Select_Visual_0060
     * @tc.desc     ArkUX_Select_Visual_0060
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Select_Visual_0060', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_0060 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0060');
          console.info('ArkUX_Select_Visual_0060 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_0060 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("1200.000000");
          expect(optionHeight).assertEqual("1200.000000");
          console.info('ArkUX_Select_Visual_0060 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0060 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });




/**
     * @tc.number   ArkUX_Select_Visual_0070
     * @tc.name     ArkUX_Select_Visual_0070
     * @tc.desc     ArkUX_Select_Visual_0070
     * @tc.level    Level.LEVEL1
     */
it('ArkUX_Select_Visual_0070', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Select_Visual_0070 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Select_Visual_0070');
          console.info('ArkUX_Select_Visual_0070 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUX_Select_Visual_0070 obj is: " + JSON.stringify(obj));
          let optionWidth = obj.getElement('$attrs').getString('optionWidth');
          let optionHeight = obj.getElement('$attrs').getString('optionHeight');
          expect(optionWidth).assertEqual("1500.000000");
          expect(optionHeight).assertEqual("1500.000000");
          console.info('ArkUX_Select_Visual_0070 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Select_Visual_0070 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500);
    });

  })
}