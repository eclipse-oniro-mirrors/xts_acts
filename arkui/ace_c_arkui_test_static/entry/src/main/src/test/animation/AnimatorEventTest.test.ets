'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level,beforeAll,beforeEach } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function animatorEventTest(){

  describe('AnimatorEventTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testKeyframeRegisterOnFinish_001
     * @tc.name     testKeyframeRegisterOnFinish_001
     * @tc.desc     testKeyframeRegisterOnFinish_001
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeRegisterOnFinish_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestKeyframeRegisterOnFinish';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('onClick')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('onClick');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testKeyframeRegisterOnEvent_002
     * @tc.name     testKeyframeRegisterOnEvent_002
     * @tc.desc     testKeyframeRegisterOnEvent_002
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeRegisterOnEvent_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestKeyframeRegisterOnEvent';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('onClick')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('onClick');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorRegisterOnFrame_003
     * @tc.name     testAnimatorRegisterOnFrame_003
     * @tc.desc     testAnimatorRegisterOnFrame_003
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorRegisterOnFrame_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestAnimatorRegisterOnFrame';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('create')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('showContent');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorRegisterOnFinish_004
     * @tc.name     testAnimatorRegisterOnFinish_004
     * @tc.desc     testAnimatorRegisterOnFinish_004
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorRegisterOnFinish_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestAnimatorRegisterOnFinish';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('play')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('finish')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('OnFinish');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorRegisterOnCancel_005
     * @tc.name     testAnimatorRegisterOnCancel_005
     * @tc.desc     testAnimatorRegisterOnCancel_005
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorRegisterOnCancel_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestAnimatorRegisterOnCancel';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('play')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('cancel')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('OnCancel');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorRegisterOnRepeat_006
     * @tc.name     testAnimatorRegisterOnRepeat_006
     * @tc.desc     testAnimatorRegisterOnRepeat_006
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorRegisterOnRepeat_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestAnimatorRegisterOnRepeat';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button:Component = await driver.findComponent(ON.id('repeat')) as Component;
      await button.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('OnRepeat');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });
  })
}