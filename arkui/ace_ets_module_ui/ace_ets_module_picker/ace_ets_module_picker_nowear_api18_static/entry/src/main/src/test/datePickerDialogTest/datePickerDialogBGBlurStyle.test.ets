'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function DatePickerDialogBGBlurStyleTest() {
  describe('DatePickerDialogBGBlurStyleTest', () => {
    beforeAll(() => {
      console.info("DatePickerDialogBGBlurStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('DatePickerDialogBGBlurStyle beforeEach start');
      let options: router.RouterOptions = {
        url:'MainAbility/pages/datePickerDialog/datePickerDialogBGBlurStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!('datePickerDialogBGBlurStyle' == pages.name)) {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push DatePickerDialogBGBlurStyle page error: ' + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('DatePickerDialogBGBlurStyle after each called');
    });

    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_001
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_001
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThinID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_002
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_002
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RegularID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_003
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_003
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThickID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_004
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_004
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THIN_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_005
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_005
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_REGULAR_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_006
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_006
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THICK_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_007
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_007
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_ULTRA_THICK_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_008
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_008
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('NONE_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_009
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_009
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THIN_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0010
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0010
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0010
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THIN_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0011
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0011
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0011
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_REGULAR_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0012
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0012
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0012
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THICK_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0013
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0013
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0013
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THICK_ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0014
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0014
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0014
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0015
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0015
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0015
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0016
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0016
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0016
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('100ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   DatePickerDialogBGBlurStyleTest_static_0017
     * @tc.name     DatePickerDialogBGBlurStyleTest_static_0017
     * @tc.desc     DatePickerDialogBGBlurStyleTest_static_0017
     * @tc.level    Level.LEVEL0
     */
it('DatePickerDialogBGBlurStyleTest_static_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundBlurStyle: string = column.getElement('$attrs').getElement('backgroundBlurStyle').getString('value');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
  })
}