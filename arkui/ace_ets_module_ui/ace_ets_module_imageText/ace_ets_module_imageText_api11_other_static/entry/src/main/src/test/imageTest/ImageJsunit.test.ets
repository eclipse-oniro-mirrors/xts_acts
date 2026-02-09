'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function imageJsunit() {

  describe('imageTest', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/Image',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Image state pages:" + JSON.stringify(pages));
        if (!("Image" == pages.name)) {
          console.info("get Image pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Image page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push image page error " + JSON.stringify(err));
      }
      await sleep(1);

    });

    afterEach(async () => {
      await sleep(1);
      console.info("Image after each called");
    });

    
    
/**
     * @tc.number   testGetImageAttr_static_010
     * @tc.name     testGetImageAttr_static_010
     * @tc.desc     testGetImageAttr_static_010
     * @tc.level    Level.LEVEL1
     */
it('testGetImageAttr_static_010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetImageAttr1 START');
      let strJson = inspector.getInspectorByKey('image1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image1 matchTextDirection" + JSON.stringify(obj.getElement('$attrs').getString("matchTextDirection")));
      console.log("image1 objectFit" + JSON.stringify(obj.getElement('$attrs').getString("objectFit")));
      console.log("image1 fitOriginalSize" + JSON.stringify(obj.getElement('$attrs').getString('fitOriginalSize')));
      console.log("image1 fillColor" + JSON.stringify(obj.getElement('$attrs').getString('fillColor')));
      console.log("image1 autoResize" + JSON.stringify(obj.getElement('$attrs').getString('autoResize')));
      console.log("image1 syncLoad" + JSON.stringify(obj.getElement('$attrs').getString("syncLoad")));
      console.log("image1 objectRepeat" + JSON.stringify(obj.getElement('$attrs').getString("objectRepeat")));
      console.log("image1 interpolation" + JSON.stringify(obj.getElement('$attrs').getString("interpolation")));
      console.log("image1 renderMode" + JSON.stringify(obj.getElement('$attrs').getString("renderMode")));
      console.log("image1 sourceSize" + JSON.stringify(obj.getElement('$attrs').getString("sourceSize")));
      console.log("image1 alt" + JSON.stringify(obj.getElement('$attrs').getString("alt")));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Cover');
      expect(obj.getElement('$attrs').getString("syncLoad")).assertEqual('false');
      expect(obj.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.NoRepeat');
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.None');
      expect(obj.getElement('$attrs').getString("renderMode")).assertEqual('ImageRenderMode.Original');
      expect(obj.getElement('$attrs').getString("sourceSize")).assertEqual("[200.00 x 100.00]");
      expect(obj.getElement('$attrs').getString("alt")).assertEqual('/resources/rawfile/person.png');
      console.info('testGetImageAttr1 END');
      done();
    });

    
    
/**
     * @tc.number   testGetImageAttr_static_020
     * @tc.name     testGetImageAttr_static_020
     * @tc.desc     testGetImageAttr_static_020
     * @tc.level    Level.LEVEL1
     */
it('testGetImageAttr_static_020', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetImageAttr2 START');
      let strJson = inspector.getInspectorByKey('image2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image2 objectFit" + JSON.stringify(obj.getElement('$attrs').getString("objectFit")));
      console.log("image2 objectRepeat" + JSON.stringify(obj.getElement('$attrs').getString("objectRepeat")));
      console.log("image2 interpolation" + JSON.stringify(obj.getElement('$attrs').getString("interpolation")));
      console.log("image2 renderMode" + JSON.stringify(obj.getElement('$attrs').getString("renderMode")));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.Contain');
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.High');
      expect(obj.getElement('$attrs').getString("renderMode")).assertEqual('ImageRenderMode.Template');
      console.info('testGetImageAttr2 END');
      done();
    });
    
    
/**
     * @tc.number   testGetImageAttr_static_030
     * @tc.name     testGetImageAttr_static_030
     * @tc.desc     testGetImageAttr_static_030
     * @tc.level    Level.LEVEL1
     */
it('testGetImageAttr_static_030', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetImageAttr3 START');
      let strJson = inspector.getInspectorByKey('image3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image3 objectFit" + JSON.stringify(obj.getElement('$attrs').getString("objectFit")));
      console.log("image3 objectRepeat" + JSON.stringify(obj.getElement('$attrs').getString("objectRepeat")));
      console.log("image3 interpolation" + JSON.stringify(obj.getElement('$attrs').getString("interpolation")));
      expect(obj.getElement('$attrs').getString("objectRepeat")).assertEqual('ImageRepeat.Y');
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.Low');
      console.info('testGetImageAttr3 END');
      done();
    });

    
    
/**
     * @tc.number   testGetImageAttr_static_040
     * @tc.name     testGetImageAttr_static_040
     * @tc.desc     testGetImageAttr_static_040
     * @tc.level    Level.LEVEL1
     */
it('testGetImageAttr_static_040', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetImageAttr4 START');
      let strJson = inspector.getInspectorByKey('image4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image4 objectFit" + JSON.stringify(obj.getElement('$attrs').getString("objectFit")));
      console.log("image4 objectRepeat" + JSON.stringify(obj.getElement('$attrs').getString("objectRepeat")));
      console.log("image4 interpolation" + JSON.stringify(obj.getElement('$attrs').getString("interpolation")));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.None');
      expect(obj.getElement('$attrs').getString("interpolation")).assertEqual('ImageInterpolation.Medium');
      console.info('testGetImageAttr4 END');
      done();
    });

    
    
/**
     * @tc.number   testGetImageAttr_static_050
     * @tc.name     testGetImageAttr_static_050
     * @tc.desc     testGetImageAttr_static_050
     * @tc.level    Level.LEVEL1
     */
it('testGetImageAttr_static_050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('testGetImageAttr5 START');
      let strJson = inspector.getInspectorByKey('image5');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      console.log("image5 objectFit" + JSON.stringify(obj.getElement('$attrs').getString("objectFit")));
      expect(obj.getElement('$attrs').getString("objectFit")).assertEqual('ImageFit.ScaleDown');
      console.info('testGetImageAttr5 END');
      done();
    });
  })
}
