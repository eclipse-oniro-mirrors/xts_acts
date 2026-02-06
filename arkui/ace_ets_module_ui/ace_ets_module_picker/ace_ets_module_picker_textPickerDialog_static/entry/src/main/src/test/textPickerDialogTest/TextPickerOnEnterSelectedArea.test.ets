'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function textPickerOnEnterSelectedArea() {
  describe('textPickerOnEnterSelectedArea', () => {

    beforeAll(() => {
      console.info("textPickerOnEnterSelectedArea beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.textPickerDialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info('textPickerOnEnterSelectedArea beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPickerDialog/TextPickerOnEnterSelectedArea',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get textPickerOnEnterSelectedArea state pages:' + JSON.stringify(pages));
        if (!('TextPickerOnEnterSelectedArea' == pages.name)) {
          console.info('get textPickerOnEnterSelectedArea pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push textPickerOnEnterSelectedArea page error:' + err);
      }
      console.info('textPickerOnEnterSelectedArea beforeEach end');
    });

    /**
     * @tc.number   textPickerOnEnterSelectedArea_static_001
     * @tc.name     textPickerOnEnterSelectedArea_static_001
     * @tc.desc     Test OnEnterSelectedArea callback
     * @tc.size     MEDIUMTEST
     * @tc.level    Level.LEVEL0
     */
    it('textPickerOnEnterSelectedArea_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn = await driver.findComponent(ON.id('textPickerButton'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let okBtn = await (driver.findComponent(ON.text('CCCC')) as Promise<Component>);
      await okBtn.click();
      await Utils.sleep(1000);
      let cancelBtn = await (driver.findComponent(ON.text('确定')) as Promise<Component>);
      await cancelBtn.click();
      let strJson = inspector.getInspectorByKey('resultText');
      let obj = JSON.parseJsonElement(strJson);
      let content :string = obj.getElement('$attrs').getString('content');
      console.log('[textPickerOnEnterSelectedArea_static_001] content '+ content)
      expect(content).assertEqual('ok');
      done();
    });
  })
}