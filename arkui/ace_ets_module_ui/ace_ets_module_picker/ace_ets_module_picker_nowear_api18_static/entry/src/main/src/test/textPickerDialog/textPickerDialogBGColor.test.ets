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

export default function TextPickerDialogBGColorTest() {
  describe('TextPickerDialogBGColorTest', () => {
    beforeAll(() => {
      console.info("TextPickerDialogBGColorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api18.static", "EntryAbility")
    });

    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/textPickerDialogBgColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("textPickerDialogBgColor" == pages.name)) {
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogBGColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_001
     * @tc.name     TextPickerDialogBGColorTest_static_001
     * @tc.desc     TextPickerDialogBGColorTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_002
     * @tc.name     TextPickerDialogBGColorTest_static_002
     * @tc.desc     TextPickerDialogBGColorTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_003
     * @tc.name     TextPickerDialogBGColorTest_static_003
     * @tc.desc     TextPickerDialogBGColorTest_static_003
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_004
     * @tc.name     TextPickerDialogBGColorTest_static_004
     * @tc.desc     TextPickerDialogBGColorTest_static_004
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_005
     * @tc.name     TextPickerDialogBGColorTest_static_005
     * @tc.desc     TextPickerDialogBGColorTest_static_005
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_006
     * @tc.name     TextPickerDialogBGColorTest_static_006
     * @tc.desc     TextPickerDialogBGColorTest_static_006
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_007
     * @tc.name     TextPickerDialogBGColorTest_static_007
     * @tc.desc     TextPickerDialogBGColorTest_static_007
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_008
     * @tc.name     TextPickerDialogBGColorTest_static_008
     * @tc.desc     TextPickerDialogBGColorTest_static_008
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundColor).assertEqual('#FFFFFFFF');
      } else {
        expect(backgroundColor).assertEqual('#00FFFFFF');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
    
    
/**
     * @tc.number   TextPickerDialogBGColorTest_static_009
     * @tc.name     TextPickerDialogBGColorTest_static_009
     * @tc.desc     TextPickerDialogBGColorTest_static_009
     * @tc.level    Level.LEVEL0
     */
it('TextPickerDialogBGColorTest_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = tree.getArray('$children')[1];
      let column = dialog.getArray('$children')[0];
      let backgroundColor: string = column.getElement('$attrs').getString('backgroundColor');
      expect(backgroundColor).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await (btn1?.click() as Promise<void>);
      done();
    })
  })
}