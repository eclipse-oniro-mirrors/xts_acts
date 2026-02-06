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

import { describe, expect, it, Level,beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { Driver, ON, PointerMatrix,Component } from '@kit.TestKit';
import { Point } from '@ohos.UiTest';

export default function gestureGestureInterrupterTest() {

  describe('GestureGestureInterrupterTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });
    
    
/**
     * @tc.number   testGestureGestureInterrupter001
     * @tc.name     testGestureGestureInterrupter001
     * @tc.desc     testGestureGestureInterrupter001
     * @tc.level    Level.LEVEL1
     */
    it('testGestureGestureInterrupter001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button1')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button1');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureGestureInterrupter002
     * @tc.name     testGestureGestureInterrupter002
     * @tc.desc     testGestureGestureInterrupter002
     * @tc.level    Level.LEVEL1
     */
    it('testGestureGestureInterrupter002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button2')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button2');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureGestureInterrupter003
     * @tc.name     testGestureGestureInterrupter003
     * @tc.desc     testGestureGestureInterrupter003
     * @tc.level    Level.LEVEL1
     */
    it('testGestureGestureInterrupter003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button3')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button3');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureGestureInterrupter004
     * @tc.name     testGestureGestureInterrupter004
     * @tc.desc     testGestureGestureInterrupter004
     * @tc.level    Level.LEVEL1
     */
    it('testGestureGestureInterrupter004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button4')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button4');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

    
    
/**
     * @tc.number   testGestureGestureInterrupter005
     * @tc.name     testGestureGestureInterrupter005
     * @tc.desc     testGestureGestureInterrupter005
     * @tc.level    Level.LEVEL1
     */
    it('testGestureGestureInterrupter005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'GestureGestureInterrupterTest';
      await Utils.pushPage(`gesture/${PAGE_TAG}`);
      await Utils.clickComponent('button5')
      await Utils.sleep(600)
      let strJson1 = inspector.getInspectorByKey('button5');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    })

  })
}