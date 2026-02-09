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
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function animationEventTest(){

  describe('AnimationEventTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });

    
    
/**
     * @tc.number   testAnimateOption001
     * @tc.name     testAnimateOption001
     * @tc.desc     testAnimateOption001
     * @tc.level    Level.LEVEL1
     */
    it('testAnimateOption001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimateToTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Button1')
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('Animation1');
      let obj = JSON.parseJsonElement(strJson);
      expect(parseFloat((JSON.parseJsonElement(inspector.getInspectorByKey('Animation1')).getElement('$attrs').getString('width')).split('vp')[0])).assertEqual(100)
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testKeyframeAnimateOption012
     * @tc.name     testKeyframeAnimateOption012
     * @tc.desc     testKeyframeAnimateOption012
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'KeyframeRegisterOnFinishTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Button2')
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('Animation2');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testKeyframeAnimateOption023
     * @tc.name     testKeyframeAnimateOption023
     * @tc.desc     testKeyframeAnimateOption023
     * @tc.level    Level.LEVEL1
     */
    it('testKeyframeAnimateOption023', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'KeyframeRegisterOnEventTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Button3')
      await Utils.sleep(1000)
      expect(JSON.parseJsonElement(inspector.getInspectorByKey('Animation3')).getElement('$attrs').getString('width')).assertEqual('100.00vp')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorOption047
     * @tc.name     testAnimatorOption047
     * @tc.desc     testAnimatorOption047
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption047', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimatorRegisterOnFrameTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Pause')
      await Utils.sleep(500)
      let strJson = inspector.getInspectorByKey('Animation4');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorOption050
     * @tc.name     testAnimatorOption050
     * @tc.desc     testAnimatorOption050
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption050', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimatorRegisterOnFinishTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Finish')
      await Utils.sleep(500)
      let strJson = inspector.getInspectorByKey('Animation5');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorOption053
     * @tc.name     testAnimatorOption053
     * @tc.desc     testAnimatorOption053
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption053', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimatorRegisterOnCancelTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Play')
      await Utils.sleep(500)
      await Utils.clickComponent('Cancel')
      await Utils.sleep(500)
      let strJson = inspector.getInspectorByKey('Animation6');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFF0000')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorOption056
     * @tc.name     testAnimatorOption056
     * @tc.desc     testAnimatorOption056
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption056', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimatorRegisterOnRepeatTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Play')
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('Animation7');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    
/**
     * @tc.number   testAnimatorOption062
     * @tc.name     testAnimatorOption062
     * @tc.desc     testAnimatorOption062
     * @tc.level    Level.LEVEL1
     */
    it('testAnimatorOption062', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'AnimatorReverseTest';
      Utils.pushPage(`animation/${PAGE_TAG}`, false);
      await Utils.clickComponent('Reverse')
      await Utils.clickComponent('Pause')
      expect(parseFloat((JSON.parseJsonElement(inspector.getInspectorByKey('Animation8')).getElement('$attrs').getString('width')).split('vp')[0]) > 150.0)
        .assertEqual(true)
      done();
    });

  })
}