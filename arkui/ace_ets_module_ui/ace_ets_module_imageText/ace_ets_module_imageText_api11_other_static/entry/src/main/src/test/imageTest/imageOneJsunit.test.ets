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
import { ImageFit, ImageRepeat } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function imageOneJsunit() {
  describe('imageOneJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("imageOneJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/imageOne',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get imageOneJsunit state pages:" + JSON.stringify(pages));
        if (!("imageOne" == pages.name)) {
          console.info("get imageOneJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push imageOneJsunit page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push imageOneJsunit page error:" + err);
        expect().assertFail();
      }

    });


    
/**
     * @tc.number   imageOneJsunit_static_0100
     * @tc.name     imageOneJsunit_static_0100
     * @tc.desc     imageOneJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the image component and test attribute
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0100 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test3.png');

      let strJson2 = inspector.getInspectorByKey('objectFit');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_static_0100 component obj2 is: ' + obj2.getElement('$attrs').getString("objectFit"));
      expect(obj2.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.None');

      let strJson3 = inspector.getInspectorByKey('repeat');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_static_0100 component obj3 is: ' + obj3.getElement('$attrs').getString("objectRepeat"));
      expect(obj.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.NoRepeat');
      done();
    });

    
/**
     * @tc.number   imageOneJsunit_static_0200
     * @tc.name     imageOneJsunit_static_0200
     * @tc.desc     imageOneJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the image format
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'imageNamePng', value: 'test2.svg' })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0200 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test2.svg');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'imageNamePng', value: 'test.gif' })
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('image1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_static_0200 component obj2 is: ' + obj2.getElement('$attrs').getString('src'));
      expect(obj2.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test.gif');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'imageNamePng', value: 'bm.bmp' })
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('image1');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_static_0100 component obj3 is: ' + obj3.getElement('$attrs').getString('src'));
      expect(obj3.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/bm.bmp');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'imageNamePng', value: 'bm.jpg' })
      await CommonFunc.sleep(1000);
      let strJson4 = inspector.getInspectorByKey('image1');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('textimageOneJsunit_static_0100 component obj4 is: ' + obj4.getElement('$attrs').getString('src'));
      expect(obj4.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/bm.jpg');
      done();
    });


    
/**
     * @tc.number   imageOneJsunit_static_0300
     * @tc.name     imageOneJsunit_static_0300
     * @tc.desc     imageOneJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the image of not exit
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'imageNamePng', value: 'aaa.png' })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0300 component obj is: ' + obj.getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/aaa.png');
      done();
    });

    
/**
     * @tc.number   imageOneJsunit_static_0400
     * @tc.name     imageOneJsunit_static_0400
     * @tc.desc     imageOneJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // test the enum of objectFit
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.Cover })
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('objectFit');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0400 component obj is: ' + obj.getElement('$attrs').getString("objectFit"));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Cover');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.Auto })
      await CommonFunc.sleep(500);
      let strJson2 = inspector.getInspectorByKey('objectFit');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('textimageOneJsunit_static_0400 component obj2 is: ' + obj2.getElement('$attrs').getString("objectFit"));
      expect(obj2.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Auto');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.Fill })
      await CommonFunc.sleep(500);
      let strJson3 = inspector.getInspectorByKey('objectFit');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_static_0400 component obj3 is: ' + obj3.getElement('$attrs').getString("objectFit"));
      expect(obj3.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Fill');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.ScaleDown })
      await CommonFunc.sleep(500);
      let strJson4 = inspector.getInspectorByKey('objectFit');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info('textimageOneJsunit_static_0400 component obj4 is: ' + obj4.getElement('$attrs').getString("objectFit"));
      expect(obj4.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.ScaleDown');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.None })
      await CommonFunc.sleep(500);
      let strJson5 = inspector.getInspectorByKey('objectFit');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info('textimageOneJsunit_static_0400 component obj5 is: ' + obj5.getElement('$attrs').getString("objectFit"));
      expect(obj5.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.None');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.Contain })
      await CommonFunc.sleep(500);
      let strJson6 = inspector.getInspectorByKey('objectFit');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info('textimageOneJsunit_static_0400 component obj6 is: ' + obj6.getElement('$attrs').getString("objectFit"));
      expect(obj6.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Contain');
      done();
    });

    
/**
     * @tc.number   imageOneJsunit_static_0500
     * @tc.name     imageOneJsunit_static_0500
     * @tc.desc     imageOneJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // test the illegal enum of objectFit
      //AppStorage.get<MessageManager<string | ImageFit | ImageRepeat | number>>("messageManager")!.notify({ name: 'objectFit', value: 9 })
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat | number>>("messageManager")!.notify({ name: 'objectFit', value: ImageFit.None })
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0500 component obj is: ' + obj.getElement('$attrs').getString("objectFit"));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Cover');
      done();
    });

    
/**
     * @tc.number   imageOneJsunit_static_0600
     * @tc.name     imageOneJsunit_static_0600
     * @tc.desc     imageOneJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('imageOneJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('imageOneJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // test the enum of ImageRepeat
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectRepeat', value: ImageRepeat.X })
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('repeat');
      let obj = JSON.parseJsonElement(strJson);
      console.info('textimageOneJsunit_static_0600 component obj is: ' + obj.getElement('$attrs').getString("objectRepeat"));
      expect(obj.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.X');

      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectRepeat', value: ImageRepeat.Y })
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('repeat');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('textimageOneJsunit_static_0600 component obj1 is: ' + obj1.getElement('$attrs').getString("objectRepeat"));
      expect(obj1.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.Y');
      console.log('objectRepeat==============开始传值')
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectRepeat', value: ImageRepeat.XY })
      console.log('objectRepeat==============结束传值')
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('repeat');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.log('objectRepeat==============开始断言')
      console.info('textimageOneJsunit_static_0600 component obj2 is: ' + obj2.getElement('$attrs').getString("objectRepeat"));
      expect(obj2.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.XY');
      AppStorage.get<MessageManager<string | ImageFit | ImageRepeat>>("messageManager")!.notify({ name: 'objectRepeat', value: ImageRepeat.NoRepeat })

      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('repeat');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('textimageOneJsunit_static_0600 component obj3 is: ' + obj3.getElement('$attrs').getString("objectRepeat"));
      expect(obj3.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.NoRepeat');
      done();
    });

    //异常参数undefined 注释掉
    // 异常值
    /**
     * @tc.number   imageOneJsunit_static_0700
     * @tc.name     imageOneJsunit_static_0700
     * @tc.desc     imageOneJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
//it('imageOneJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   console.info('imageOneJsunit_static_0700 START');
    //   await CommonFunc.sleep(1000);
    //   // test the illegal enum of ImageRepeat
    //   AppStorage.get<MessageManager<string | ImageFit | ImageRepeat | undefined>>("messageManager")!.notify({ name: 'objectRepeat', value: undefined })
    //   await CommonFunc.sleep(3000);
    //   let strJson = inspector.getInspectorByKey('repeat');
    //   let obj = JSON.parseJsonElement(strJson);
    //   console.info('textimageOneJsunit_static_0700 component obj is: ' + obj.getElement('$attrs').getString("objectRepeat"));
    //   expect(obj.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.NoRepeat');
    //   done();
    // });
  })
}
