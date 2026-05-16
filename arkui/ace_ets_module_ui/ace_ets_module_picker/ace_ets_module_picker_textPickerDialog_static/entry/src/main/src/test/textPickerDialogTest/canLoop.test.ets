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

export default function canLoopTest() {
  describe('canLoopTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('canLoopTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.picker.textPickerDialog.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('canLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/canLoop',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get canLoopTest state pages:' + JSON.stringify(pages));
        if (!('canLoop' == pages.name)) {
          console.info('get canLoopTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('push canLoopTest page error:' + err);
      }
      console.info('canLoopTest beforeEach end');
    });
    /**
     * @tc.number   canLoop_static_001
     * @tc.name     canLoop_static_001
     * @tc.desc     canLoop_static_001
     * @tc.level    Level.LEVEL0
     */
    it('canLoop_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('canLoop_static_001 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('loopTrue'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getString('canLoop')).assertEqual('true');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[canLoop_static_001] END');
      done();
    });



    /**
     * @tc.number   canLoop_static_002
     * @tc.name     canLoop_static_002
     * @tc.desc     canLoop_static_002
     * @tc.level    Level.LEVEL0
     */
    it('canLoop_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('canLoop_static_002 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('loopFalse'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getString('canLoop')).assertEqual('false');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[canLoop_static_002] END');
      done();
    });



    /**
     * @tc.number   canLoop_static_003
     * @tc.name     canLoop_static_003
     * @tc.desc     canLoop_static_003
     * @tc.level    Level.LEVEL0
     */
    it('canLoop_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('canLoop_static_003 START');
      let driver = Driver.create();
      let btn = await driver.findComponent(ON.id('loopUndefined'));
      btn?.click()
      await Utils.sleep(2000);

      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(1000);
      let textPicker1 = tree.getArray('$children')[1].getArray('$children')[0].getArray('$children')[0].getArray('$children')[0];
      expect(textPicker1.getElement('$attrs').getString('canLoop')).assertEqual('true');
      let btn1 = await driver.findComponent(ON.text('确定'));
      btn1?.click();
      await Utils.sleep(1000);
      console.info('[canLoop_static_003] END');
      done();
    });

  })
}

