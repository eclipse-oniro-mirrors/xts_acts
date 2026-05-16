'use static';
/**
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
import { ImageFrameInfo } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ImageAnimatorAdvancedTest() {

  describe('ImageAnimatorAdvancedTest', () => {

    beforeAll(async () => {
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
    });

    const routerPush = async (target: string) => {
      let options: router.RouterOptions = {
        url: `MainAbility/pages/ImageAnimator/imageAnimatorAdvanced/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        if (!(target== pages.name)) {
          console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info(`push ${target} page result:` + JSON.stringify(result));
        }

      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    beforeEach(async (): Promise<void> => {
      console.info("before each called");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("after each called");
    });

    
    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0120
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0120
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0120
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0120', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0120] START');
      await routerPush('imageAnimator01')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator01');
      console.log('strJson1=======' + strJson1)
      let obj1 = JSON.parseJsonElement(strJson1);
      console.log("obj1.getElement('$attrs').getString('images')" + JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray())
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[0].getString('height')).assertEqual('100.00px');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0130
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0130
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0130
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0130', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0130] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator01');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[1].getString('height')).assertEqual('100.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0140
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0140
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0140
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0140', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0140] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator01');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[2].getString('height')).assertEqual('50.00%');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0150
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0150
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0150
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0150', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0150] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator01');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[3].getString('height')).assertEqual('0.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0160
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0160
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0160
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0160', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0160] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator01');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[4].getString('height')).assertEqual('90.00vp');
      done();
    });




    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0170
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0170
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0170
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0170', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0170] START');
      await routerPush('imageAnimator02')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[1].getString('left')).assertEqual('30.00px');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0180
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0180
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0180
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0180', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0180] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[2].getString('left')).assertEqual('30.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0190
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0190
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0190
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0190', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0190] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[0].getString('left')).assertEqual('0.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0200
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0200
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0200
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[3].getString('top')).assertEqual('30.00px');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0210
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0210
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0210
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0210', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0210] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[4].getString('top')).assertEqual('30.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0220
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0220
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0220
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0220', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0220] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator02');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[0].getString('top')).assertEqual('0.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0230
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0230
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0230
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0230', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0230] START');
      await routerPush('imageAnimator03')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator03');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[0].getString("width")).assertEqual('100.00px');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0240
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0240
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0240
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0240', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0240] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator03');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[1].getString("width")).assertEqual('100.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0250
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0250
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0250
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0250', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0250] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator03');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[2].getString("width")).assertEqual('50.00%');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0260
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0260
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0260
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0260', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0260] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator03');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[3].getString("width")).assertEqual('0.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0270
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0270
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0270
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0270', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0270] START');
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator03');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      expect(images[4].getString("width")).assertEqual('90.00vp');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0280
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0280
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0280
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0280', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0280] START');
      await routerPush('imageAnimator04')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator04');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertEqual('H264_AAC.mp4');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0290
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0290
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0290
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0290', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0290] START');
      await routerPush('imageAnimator05')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator05');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertContain('.gif');
      expect(images[1].getString('src')).assertContain('.mp4');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0300
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0300
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0300
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0300] START');
      await routerPush('imageAnimator06')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator06');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertEqual('resource://RAWFILE/yyy.png');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0310
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0310
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0310
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0310', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0310] START');
      await routerPush('imageAnimator07')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator07');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertContain('.jpg');
      expect(images[1].getString('src')).assertContain('.png');
      expect(images[2].getString('src')).assertContain('.bmp');
      expect(images[3].getString('src')).assertContain('.svg');
      expect(images[4].getString('src')).assertContain('.gif');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0330
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0330
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0330
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0330', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0330] START');
      await routerPush('imageAnimator09')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator09');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertEqual('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAGXRF' +
        'WHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyVpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77' +
        'u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9' +
        'IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDA2IDc5LjE2NDc1MywgMjAyMS8wMi8xNS0xMTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbn' +
        'M6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdX' +
        'Q9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmF' +
        'kb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZX' +
        'NvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKE1hY2ludG9zaCkiIHhtcE1NOkl' +
        'uc3RhbmNlSUQ9InhtcC5paWQ6ODQxMEIzN0QyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiIHhtcE1NOkRvY3VtZW50SUQ9Inh' +
        'tcC5kaWQ6ODQxMEIzN0UyRjQ1MTFFRUJFNUNFRTAwRjBCQTg0NkYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFu' +
        'Y2VJRD0ieG1wLmlpZDo4NDEwQjM3QjJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZ' +
        'Do4NDEwQjM3QzJGNDUxMUVFQkU1Q0VFMDBGMEJBODQ2RiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6e' +
        'G1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjnaUHsAAARqSURBVHjazFlNbFVFFP7u7Xul4ceYtkANBCUYFkQCttUFC8WkpIK' +
        'EgMqqtZgILmRTMLIwwZgYWWCsbGRTSUi1KyT8pAoGE4kLN20KpmICIWk1EmgpBFtLsK/t9Tsz0+a919uZeT/Fd5KZc++8me98M2' +
        '/mnDPvBfg4ghKjEJjnCNtZ72Cp5fNq6gSKLxO010/dy3Kez10z9qe5KJVNEtiMKRylfgGPX7oR4hD15XSSYUaXCAdJ8Kf/iSCUX' +
        'bEvPNIknWQrP/wcpSCaR2smyQj1nMEXKCURPsJrhuQUOlGKYniFZNtAvTbHryP9oM3fGOFFfglWLc6ugSmjLGMsZaZ9kmURy2Jk' +
        'e4iZk4l/5hizxJM4+Ynvq3MSnGAZBqpWAW+8DDz/lG6+egc4/Rtwd4Av1SxJ9RXpTZTSY5Y+wzGbgY01ms+V2xzTB9z704xJOIhG' +
        'qAtwOLrHx8o5CcrM7wLvbAHa6N6fqMjsMjYOHPoOOP4DX6qMUZkUUd9rBI6+xoUrzxwz8gg42AWcuMSXpWaV5yZ6XyDLrStJgi3c' +
        'tV+9Gf+xEPhyFxeOE2r/ng0r9Jh929i+M36MTFTwUiTW8SMbaqwMymUl/5ZxsR9zL1U+yUU57LfLlx8BhhjkljGIDn7oN6bqEy' +
        '7VA7NP42UktCLwoDTV+x/FtyVODRrtKQp/1N4ntLoMbobaGn+D65exqjDaUxS+4/CETu8T+BtMlmmDyTL/MT74ocv1XB30Nz' +
        'g5lal9ROFPpPnVnFeSDvebnvmNfAp/Sb4rCR1Jhv8A9p7xMxgGmdolgiv4MxEr3z0pzvYEHfV+Aj5M2btWL2T1r9EWERzBE1z' +
        'lzB2ScCYFSR1Jjl8Ezl0Hdm/QIS77cEjXzl917Gr7hZ5obPY2S03qUHqK/W71Z4VSa2S2OfP0QyRr/pcOdypGhTETkq/tWZa' +
        'bJrEIZqVewLgJnyvNuzszGkl4nX+TLKxYw5V83b6SF34Gtr5EJ72heCuZcK5gyiQLrwKfMcFYmLSERYa2C2eZPGwCGtbE99nD8i' +
        'lzgQ+6spKSQpy5yoAadRJhIygy/JDVAqMtIjiCJ7iCn78zNwlr9dPMWHZ5ZvtRpnaJ4Aq+2r95k2Tgb67HvEpzMRKMjcv9DZa' +
        'FmdpHFH6hezLK4fIkp1fisNK+97OokD1pEozeO/4G+4ZYPTLaUxR+oQlGZw4Jxslu8UNGe0qnZ4IR2hKM+4wye065jb1L/zg0oC' +
        'OJaHl3ieAKviPBCEMTqKwJhlyW9n6rb3mzrkHjOllov2iShSmt5V3ax2LQBUfw1CXMnWCMB/gousaTtc773r0+j3v3cwXcu4HfhWQ' +
        'HO71Vsr9gBPg6wcpNchpskSlZv8TGGppum2uM7xWD/EJWsjNu5BQmArvLKNoY4UV+oTnjTSX505/hFZpZ9vDpQIkRPKB4ZfnIY2x' +
        '8vyQIah7H4iNOgDa2vAL5FwDe6X0xpVvZFx7WzDzAZXZ8kQS38y6zgyRr6SdXs/3x/49j5D8BBgDvR27YO5AMoAAAAABJRU5ErkJ' +
        'ggg==');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0380
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0380
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0380
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0380', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0380] START');
      await routerPush('imageAnimator14')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator14');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertEqual('http://images.openharmony.cn/330-%E8%BF%90%E8%90%A5%E5%9B%BE/%E5%B0%81%E9%9D' +
        '%A2/%E5%8D%9A%E5%AE%A2/%E7%B3%BB%E5%88%97%E8%A7%A3%E8%AF%BB.png');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0390
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0390
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0390
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0390', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_INTERFACE_static_0390] START');
      await routerPush('imageAnimator15')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator15');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString('src')).assertEqual('images/test1.jpg');
      done();
    });


    
/**
     * @tc.number   SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_static_0010
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_UI_COMPONENT_MEDIA_IMAGEANIMATOR_LAYOUT_0010] START');
      await routerPush('imageAnimator16')
      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('imageAnimator16');
      let obj1 = JSON.parseJsonElement(strJson1);
      let images = JSON.parseJsonElement(obj1.getElement('$attrs').getString('images')).asArray()
      console.info("images is: " + JSON.stringify(images));
      expect(images[0].getString("width")).assertEqual('0.00vp');
      expect(images[0].getString('height')).assertEqual('0.00vp');
      done();
    });
  })
}
