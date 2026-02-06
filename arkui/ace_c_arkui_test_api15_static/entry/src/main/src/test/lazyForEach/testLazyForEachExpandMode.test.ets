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

import { expect, describe, it, afterEach, Level, beforeAll } from '../../../../hypium';
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import Utils from '../common/Utils';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

export default function TestLazyForEachExpandMode(){

  describe('TestLazyForEachExpandMode', () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api15.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

    
    /**
     * @tc.number   testLazyForEachExpandMode001
     * @tc.name     testLazyForEachExpandMode001
     * @tc.desc     testLazyForEachExpandMode001
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode001';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id9')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let button2:Component = await driver.findComponent(ON.id('button_id10')) as Component;
      await button2.click();
      await Utils.sleep(1000)
      let strJson1 = inspector.getInspectorByKey('button_id9')
      let obj1 = JSON.parseJsonElement(strJson1);
      let strJson2 = inspector.getInspectorByKey('button_id10')
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj1.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });


    
    /**
     * @tc.number   testLazyForEachExpandMode003
     * @tc.name     testLazyForEachExpandMode003
     * @tc.desc     testLazyForEachExpandMode003
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode003';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id2')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id2')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testLazyForEachExpandMode004
     * @tc.name     testLazyForEachExpandMode004
     * @tc.desc     testLazyForEachExpandMode004
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode004';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id3')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id3')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testLazyForEachExpandMode005
     * @tc.name     testLazyForEachExpandMode005
     * @tc.desc     testLazyForEachExpandMode005
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode005';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id4')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id4')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testLazyForEachExpandMode006
     * @tc.name     testLazyForEachExpandMode006
     * @tc.desc     testLazyForEachExpandMode006
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode006';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id5')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id5')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testLazyForEachExpandMode008
     * @tc.name     testLazyForEachExpandMode008
     * @tc.desc     testLazyForEachExpandMode008
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode008';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id7')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id7')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

    
    /**
     * @tc.number   testLazyForEachExpandMode009
     * @tc.name     testLazyForEachExpandMode009
     * @tc.desc     testLazyForEachExpandMode009
     * @tc.level    Level.LEVEL1
     */
    it('testLazyForEachExpandMode009', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TestLazyForEachExpandMode009';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create()
      await Utils.sleep(1000)
      let button1:Component = await driver.findComponent(ON.id('button_id8')) as Component;
      await button1.click();
      await Utils.sleep(1000)
      let strJson = inspector.getInspectorByKey('button_id8')
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done();
    });

  })
}