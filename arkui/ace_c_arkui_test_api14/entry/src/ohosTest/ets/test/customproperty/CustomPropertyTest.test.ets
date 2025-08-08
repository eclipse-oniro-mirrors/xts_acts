/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
// import nativeFunc from 'libnativefunc.so'

export default function customPropertyTest(){

  describe('CustomPropertyTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetCustomProperty001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetCustomProperty';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetParentInPageTree002', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetParentInPageTree';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetActiveChildrenInfo003', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetActiveChildrenInfo';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetCurrentPageRootNode004', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetCurrentPageRootNode';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsCreatedByNDK005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestIsCreatedByNDK';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetNodeType006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestGetNodeType';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomPropertyDestroy007', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestCustomPropertyDestroy';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCustomPropertyGetStringValue008', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestCustomPropertyGetStringValue';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActiveChildrenInfoDestroy009', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestActiveChildrenInfoDestroy';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActiveChildrenInfoGetNodeByIndex010', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestActiveChildrenInfoGetNodeByIndex';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0200
     * @tc.name       : testRemoveCustomProperty002
     * @tc.desc       : testing Custom Property
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testActiveChildrenInfoGetCount011', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TestActiveChildrenInfoGetNodeByIndex';
      await Utils.pushPage(`customproperty/${PAGE_TAG}`, done);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button = await driver.findComponent(ON.id('onClick'));
      await button.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('onClick').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}