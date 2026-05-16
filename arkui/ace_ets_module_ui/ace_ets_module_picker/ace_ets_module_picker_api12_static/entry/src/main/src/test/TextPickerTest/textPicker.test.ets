'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function textPickerDefaultPickerItemHeightJsunit() {
  describe('textPickerDefaultPickerItemHeightTest', () => {
    beforeAll(() => {
      console.info("textPicker beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("textPicker beforeAll end");
    });

    beforeEach(async () => {
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextPicker/textPicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textPicker state success " + JSON.stringify(pages));
        if (!("textPicker" == pages.name)) {
          console.info("get textPicker state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await Utils.sleep(2500);
          // console.info("push gradientHeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textPicker page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textPickerDefaultPickerItemHeight after each called");
    });

    
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0001
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0001
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0001
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0001', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0001 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0001] component width strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0001] width value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
    //   let number2:string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('width').slice(0,-2);
    //   let numberValue = Number((parseFloat(number2) - 112.00).toFixed(2));
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0001] width value numberValue:" + numberValue);
    //   expect(Math.abs(numberValue) <= 0.01).assertTrue();
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0002
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0002
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0002
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0002', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0002 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   await CommonFunc.sleep(1000);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0002] component height strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   console.log("======================================  " + JSON.stringify(obj))
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   const uiContext = AppStorage.get<UIContext>("uiContext")
    //   let numberValue = uiContext!.vp2px(Number.parseFloat(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'))) - Number.parseFloat(JSON.parseJsonElement(strJson).getElement('$attrs').getString('defaultPickerItemHeight')) * 5
    //   expect(Math.abs(numberValue) <= 1).assertTrue();
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0002] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0003
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0003
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0003
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0003', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0003 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0003] component fontSize strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(obj.getElement('$attrs').tryGetElement('fontSize')).assertEqual(undefined);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0003] fontSize value :" + JSON.parseJsonElement(strJson)
    //     .getElement('$attrs').tryGetElement('fontSize'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0004
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0004
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0004
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0004', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0004 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0004] component opacity strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity')).assertEqual(1);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0004] opacity value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getInteger('opacity'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0005
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0005
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0005
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0005', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0005 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0005] component align strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center");
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0005] align value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0006
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0006
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0006
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0006', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0006 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0006] component fontColor strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('fontColor')).assertEqual(undefined);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0006] fontColor value :" + JSON.parseJsonElement(strJson)
    //     .getElement('$attrs').tryGetElement('fontColor'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0007
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0007
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0007
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0007', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0007 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0007] component lineHeight strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('lineHeight')).assertEqual(undefined);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0007] lineHeight value :" + JSON.parseJsonElement(strJson)
    //     .getElement('$attrs').tryGetElement('lineHeight'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0009
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0009
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0009
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0009', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_009 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0009] component padding strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("0.00vp");
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0009] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));
    //   done()
    // });
    //
    //
    // /*
    //  * @tc.number   testtextPickerDefaultPickerItemHeight_static_0010
    //  * @tc.name     testtextPickerDefaultPickerItemHeight_static_0010
    //  * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0010
    //  * @tc.level    Level.LEVEL1
    //  */
    // it('testtextPickerDefaultPickerItemHeight_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0010 START');
    //   await CommonFunc.sleep(2000);
    //   let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0010] component textAlign strJson:" + strJson);
    //   let obj= JSON.parseJsonElement(strJson);
    //   expect(obj.getString('$type')).assertEqual('TextPicker');
    //   expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('textAlign')).assertEqual(undefined);
    //   console.info("[testtextPickerDefaultPickerItemHeight_static_0010] textAlign value :" + JSON.parseJsonElement(strJson)
    //     .getElement('$attrs').tryGetElement('textAlign'));
    //   done()
    // });

    
    /**
     * @tc.number   testtextPickerDefaultPickerItemHeight_static_0011
     * @tc.name     testtextPickerDefaultPickerItemHeight_static_0011
     * @tc.desc     testtextPickerDefaultPickerItemHeight_static_0011
     * @tc.level    Level.LEVEL1
     */
    it('testtextPickerDefaultPickerItemHeight_static_0011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('textPickerDefaultPickerItemHeight testtextPickerDefaultPickerItemHeight_static_0011 START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('defaultPickerItemHeightText');
      console.info("[testtextPickerDefaultPickerItemHeight_static_0011] component defaultPickerItemHeight strJson:" + strJson);
      let obj= JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('TextPicker');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual("80.00px");
      console.info("[testtextPickerDefaultPickerItemHeight_static_0011] defaultPickerItemHeight value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs').getString('defaultPickerItemHeight'));
      done()
    });
  })
}
