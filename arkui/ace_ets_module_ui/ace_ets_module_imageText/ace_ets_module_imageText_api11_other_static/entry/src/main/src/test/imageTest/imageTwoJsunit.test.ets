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
import { Color, ImageRenderMode, ImageInterpolation, FontStyle, CopyOptions, ResourceColor } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const waitUiReadyMs = 1000;

export default function imageTwoJsunit() {
  describe('imageTwoJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageTwoJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageTwo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageTwoJsunit state pages:" + JSON.stringify(pages));
        if (!("imageTwo" == pages.name)) {
          console.info("get imageTwoJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageTwoJsunit page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push imageTwoJsunit page error:" + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   imageTwoJsunit_static_0100
     * @tc.name     imageTwoJsunit_static_0100
     * @tc.desc     imageTwoJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0100 component obj is: ' + obj.getElement('$attrs').getString("renderMode") + "--" + obj.getElement('$attrs').getString("interpolation") +
        "--" + obj.getElement('$attrs').getString('fillColor') + "---" +
      obj.getElement('$attrs').getString('autoResize') + "---" + obj.getElement('$attrs').getString("syncLoad") + "----" + obj.getElement('$attrs').getString('copyOption') + "--" +
      obj.getElement('$attrs').getString('colorFilter') + "--" + obj.getElement('$attrs').getString('draggable'));
      expect(obj.getElement('$attrs').getString("renderMode")).assertEqual('ImageRenderMode.Original');
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.None');
      expect(obj.getElement('$attrs').getString('fillColor')).assertEqual('#FFFF0000');
      expect(obj.getElement('$attrs').getString('autoResize')).assertEqual('true');
      expect(obj.getElement('$attrs').getString("syncLoad")).assertEqual('false');
      expect(obj.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      expect(obj.getElement('$attrs').getString('colorFilter')).assertEqual('1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 ' +
        '0.000000 1.000000 0.000000 ');
      expect(obj.getElement('$attrs').getString('draggable')).assertEqual('false');
      done();
    });

    
/**
     * @tc.number   imageTwoJsunit_static_0200
     * @tc.name     imageTwoJsunit_static_0200
     * @tc.desc     imageTwoJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean>>("messageManager")!.notify({ name: 'renderMode', value: ImageRenderMode.Template })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0200 component obj is: ' + obj.getElement('$attrs').getString("renderMode"));
      expect(obj.getElement('$attrs').getString("renderMode")).assertEqual('ImageRenderMode.Template');
      done();
    });

    //异常参数undefined 注释
    
/**
     * @tc.number   imageTwoJsunit_static_0300
     * @tc.name     imageTwoJsunit_static_0300
     * @tc.desc     imageTwoJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image rendermode
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined>>("messageManager")!.notify({ name: 'renderMode', value: undefined })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0300 component obj is: ' + obj.getElement('$attrs').getString("renderMode"));
      expect(obj.getElement('$attrs').getString("renderMode")).assertEqual('ImageRenderMode.Original');
      done();
    });

    
/**
     * @tc.number   imageTwoJsunit_static_0400
     * @tc.name     imageTwoJsunit_static_0400
     * @tc.desc     imageTwoJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      console.log('ImageInterpolation==============开始传值')
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean>>("messageManager")!.notify({ name: 'interpolation', value: ImageInterpolation.Low })
      console.log('ImageInterpolation==============结束传值')
      await CommonFunc.sleep(300);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0300  component obj is: ' + obj.getElement('$attrs').getString("interpolation"));
      console.log('ImageInterpolation==============开始断言')
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.Low');

      console.log('ImageInterpolation==============开始传值')
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean>>("messageManager")!.notify({ name: 'interpolation', value: ImageInterpolation.Medium })
      console.log('ImageInterpolation==============结束传值')
      await CommonFunc.sleep(300);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageTwoJsunit_0400  component obj2 is: ' + obj2.getElement('$attrs').getString("interpolation"));
      console.log('ImageInterpolation==============开始断言')
      expect(obj2.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.Medium');

      console.log('ImageInterpolation==============开始传值')
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean>>("messageManager")!.notify({ name: 'interpolation', value: ImageInterpolation.High })
      console.log('ImageInterpolation==============结束传值')
      await CommonFunc.sleep(300);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageTwoJsunit_0400  component obj3 is: ' + obj3.getElement('$attrs').getString("interpolation"));
      console.log('ImageInterpolation==============开始断言')
      expect(obj3.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.High');
      done();
    });

    // 异常参数undefined
    
/**
     * @tc.number   imageTwoJsunit_static_0500
     * @tc.name     imageTwoJsunit_static_0500
     * @tc.desc     imageTwoJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageTwoJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // test the enum of interpolation
      AppStorage.get<MessageManager<ImageRenderMode | number | ImageInterpolation | Color | CopyOptions | boolean | undefined>>("messageManager")!.notify({ name: 'interpolation', value: undefined })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageTwoJsunit_0500  component obj is: ' + obj.getElement('$attrs').getString("interpolation"));
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.None');
      done();
    });

    
/**
     * @tc.number   imageTwoJsunit_static_0600
     * @tc.name     imageTwoJsunit_static_0600
     * @tc.desc     imageTwoJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('imageTwoJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_0600 START');
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<ResourceColor>>("messageManagerResourceColor")!.notify({ name: 'fillColor', value: "#FFEEAA" })
      await CommonFunc.sleep(200);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('imageOneJsunit_0600 component obj is: ' + obj.getElement('$attrs').getString('fillColor'));
      expect(obj.getElement('$attrs').getString('fillColor')).assertEqual('#FFFFEEAA');

      AppStorage.get<MessageManager<ResourceColor>>("messageManagerResourceColor")!.notify({ name: 'fillColor', value: "rgb(238, 130, 238)" })
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('imageTwoJsunit_0600  component obj2 is: ' + obj2.getElement('$attrs').getString('fillColor'));
      expect(obj2.getElement('$attrs').getString('fillColor')).assertEqual('#FFEE82EE');

      AppStorage.get<MessageManager<ResourceColor>>("messageManagerResourceColor")!.notify({ name: 'fillColor', value: Color.Green })
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('imageTwoJsunit_0600  component obj3 is: ' + obj3.getElement('$attrs').getString('fillColor'));
      expect(obj3.getElement('$attrs').getString('fillColor')).assertEqual('#FF008000');
      done();
    });
  })
}