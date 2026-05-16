/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { SelectStatus } from '@ohos.arkui.component';

const SLEEP_TIME = 1000;
const LOG_TAG = '[CheckboxGroupTest]';

function clearCheckboxGroupStorage(): void {
  const keys: string[] = [
    'checkboxGroupCfgName',
    'checkboxGroupCfgStatus',
    'checkboxGroupCfgEnabled',
    'checkboxGroupTriggerChangeLast',
    'checkboxGroupOnChangeNames',
    'checkboxGroupOnChangeStatus',
    'checkboxGroupContentModifierApplied'
  ];
  for (let i = 0; i < keys.length; i++) {
    try {
      AppStorage.delete(keys[i]);
    } catch (_e) {
    }
  }
}

export default function CheckBoxGroupTest() {
  describe('CheckBoxGroupTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeAll start`);
      await UtilsTest.startAbility('com.arkui.ace.checkBoxGroup.api23.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info(`${LOG_TAG} beforeEach start`);
      clearCheckboxGroupStorage();
      const options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBoxGroup/CheckBoxGroup',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        routerInstance.replaceUrl(options);
        await Utils.sleep(800);
      } catch (err) {
        console.error(`${LOG_TAG} beforeEach replaceUrl error: ${err}`);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      clearCheckboxGroupStorage();
      await Utils.sleep(SLEEP_TIME);
      console.info(`${LOG_TAG} afterEach end`);
    });

    /**
     * @tc.number CheckboxGroupTest_001
     * @tc.name checkboxGroupConfigurationName
     * @tc.desc CheckBoxGroupConfiguration.name 经 contentModifier 展示并写入 AppStorage
     */
    it('checkboxGroupConfigurationName', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(`${LOG_TAG} checkboxGroupConfigurationName START`);
      try {
        await CommonFunc.sleep(300);
        const nameVal = AppStorage.get<string>('checkboxGroupCfgName');
        console.info(`${LOG_TAG} checkboxGroupCfgName=${nameVal}`);
        expect(nameVal !== undefined).assertTrue();

        const driver = Driver.create();
        const textNode = await driver.findComponent(ON.id('CheckboxgroupContentModifier01'));
        expect(!!textNode).assertEqual(true);

        console.info(`${LOG_TAG} checkboxGroupConfigurationName END`);
        done();
      } catch (error) {
        console.error(`${LOG_TAG} checkboxGroupConfigurationName error:` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CheckboxGroupTest_002
     * @tc.name checkboxGroupConfigurationStatus
     * @tc.desc CheckBoxGroupConfiguration.status（初始全未选应为 SelectStatus.None）
     */
    it('checkboxGroupConfigurationStatus', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(`${LOG_TAG} checkboxGroupConfigurationStatus START`);
      try {
        await CommonFunc.sleep(300);
        const st = AppStorage.get<number>('checkboxGroupCfgStatus');
        console.info(`${LOG_TAG} checkboxGroupCfgStatus=${st}`);
        expect(st !== undefined).assertTrue();
        expect(st as number).assertEqual(SelectStatus.None);

        const driver = Driver.create();
        const textNode = await driver.findComponent(ON.id('CheckboxgroupContentModifier02'));
        expect(!!textNode).assertEqual(true);

        console.info(`${LOG_TAG} checkboxGroupConfigurationStatus END`);
        done();
      } catch (error) {
        console.error(`${LOG_TAG} checkboxGroupConfigurationStatus error:` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CheckboxGroupTest_003
     * @tc.name checkboxGroupConfigurationTriggerChange
     * @tc.desc CheckBoxGroupConfiguration.triggerChange(isSelect) 点击自定义区域后写入最后参数
     */
    it('checkboxGroupConfigurationTriggerChange', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(`${LOG_TAG} checkboxGroupConfigurationTriggerChange START`);
      try {
        const driver = Driver.create();
        const shape = await driver.findComponent(ON.id('checkboxgroup_shape'));
        expect(!!shape).assertEqual(true);
        await (shape?.click() as Promise<void>);
        await Utils.sleep(400);

        const last = AppStorage.get<boolean>('checkboxGroupTriggerChangeLast');
        console.info(`${LOG_TAG} checkboxGroupTriggerChangeLast=${last}`);
        expect(last !== undefined).assertTrue();
        expect(last as boolean).assertEqual(true);

        console.info(`${LOG_TAG} checkboxGroupConfigurationTriggerChange END`);
        done();
      } catch (error) {
        console.error(`${LOG_TAG} checkboxGroupConfigurationTriggerChange error:` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number CheckboxGroupTest_004
     * @tc.name checkboxGroupContentModifier
     * @tc.desc CheckboxGroupAttribute.contentModifier 生效：自定义 Text 可找到且标记已应用
     */
    it('checkboxGroupContentModifier', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info(`${LOG_TAG} checkboxGroupContentModifier START`);
      try {
        await CommonFunc.sleep(300);
        const applied = AppStorage.get<boolean>('checkboxGroupContentModifierApplied');
        expect(applied).assertEqual(true);

        const driver = Driver.create();
        const t1 = await driver.findComponent(ON.id('CheckboxgroupContentModifier01'));
        const t2 = await driver.findComponent(ON.id('CheckboxgroupContentModifier02'));
        expect(!!t1).assertEqual(true);
        expect(!!t2).assertEqual(true);
        const group = await driver.findComponent(ON.id('checkboxGroup'));
        expect(!!group).assertEqual(true);
        console.info(`${LOG_TAG} checkboxGroupContentModifier END`);
        done();
      } catch (error) {
        console.error(`${LOG_TAG} checkboxGroupContentModifier error:` + error);
        expect().assertFail();
        done();
      }
    });
  });
}
