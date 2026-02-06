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

import { describe, expect, it, afterEach, Level, beforeAll, beforeEach } from '../../../../hypium';
import Utils from '../common/Utils';
import { Driver, ON, MouseButton, Component, Point } from '@kit.TestKit';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function scrollCurrentOffsetTest() {

  describe('ScrollCurrentOffsetTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.openharmony.arkui_ani_test.static", "EntryAbility");
    });

    beforeEach(async () => {
      await Utils.sleep(100);
    });


    
    /**
     * @tc.number   testScrollCurrentOffset001
     * @tc.name     testScrollCurrentOffset001
     * @tc.desc     testScrollCurrentOffset001
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset002
     * @tc.name     testScrollCurrentOffset002
     * @tc.desc     testScrollCurrentOffset002
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset003
     * @tc.name     testScrollCurrentOffset003
     * @tc.desc     testScrollCurrentOffset003
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset004
     * @tc.name     testScrollCurrentOffset004
     * @tc.desc     testScrollCurrentOffset004
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset005
     * @tc.name     testScrollCurrentOffset005
     * @tc.desc     testScrollCurrentOffset005
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetEaseInOutTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset006
     * @tc.name     testScrollCurrentOffset006
     * @tc.desc     testScrollCurrentOffset006
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset007
     * @tc.name     testScrollCurrentOffset007
     * @tc.desc     testScrollCurrentOffset007
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetLinearOutSlowInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset008
     * @tc.name     testScrollCurrentOffset008
     * @tc.desc     testScrollCurrentOffset008
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetFastOutLinearInTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset009
     * @tc.name     testScrollCurrentOffset009
     * @tc.desc     testScrollCurrentOffset009
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetExtremeDecelerationTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset010
     * @tc.name     testScrollCurrentOffset010
     * @tc.desc     testScrollCurrentOffset010
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetSharpTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset011
     * @tc.name     testScrollCurrentOffset011
     * @tc.desc     testScrollCurrentOffset011
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetRhythmTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset012
     * @tc.name     testScrollCurrentOffset012
     * @tc.desc     testScrollCurrentOffset012
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetSmoothTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testScrollCurrentOffset013
     * @tc.name     testScrollCurrentOffset013
     * @tc.desc     testScrollCurrentOffset013
     * @tc.level    Level.LEVEL1
     */
    it('testScrollCurrentOffset013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'ScrollCurrentOffsetFrictionTest';
      await Utils.pushPage(`scroll/${PAGE_TAG}`);
      let strJson1 = inspector.getInspectorByKey('CurrentOffset');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });
  })
}
