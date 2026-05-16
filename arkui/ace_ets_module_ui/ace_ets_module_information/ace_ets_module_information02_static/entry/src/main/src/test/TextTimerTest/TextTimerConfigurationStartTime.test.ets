'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function TextTimerConfigurationStartTimeTest() {
  describe('TextTimerConfigurationStartTimeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextTimerConfigurationStartTimeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextTimerConfigurationStartTimeTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextTimerConfigurationStartTimeTest state pages:" + JSON.stringify(pages));
        if (!("TextTimerConfigurationStartTime" == pages.name)) {
          console.info("get  TextTimerConfigurationStartTimeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/TextTimer/TextTimerConfigurationStartTime',
          })
        }
      } catch (err) {
        console.error("push TextTimerConfigurationStartTime page error:" + err);
        expect().assertFail();
      }
      console.info("TextTimerConfigurationStartTime beforeEach end");
    });

    /**
     * @tc.name   textTimerConfigStartTime_positive_0100
     * @tc.number SUB_ARKUI_TEXTTIMERCONFIGURATION_STARTTIME_POSITIVE_0100
     * @tc.desc   Test TextTimerConfiguration startTime property with positive number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerConfigStartTime_positive_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textTimerConfigStartTime_positive_0100] START');

      let strJson = inspector.getInspectorByKey('textTimer_config_startTime_positive');

      console.info("[textTimerConfigStartTime_positive_0100] startTime is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextTimer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('30000');
      console.info('[textTimerConfigStartTime_positive_0100] END');
      done();
    })

    /**
     * @tc.name   textTimerConfigStartTime_zero_0100
     * @tc.number SUB_ARKUI_TEXTTIMERCONFIGURATION_STARTTIME_ZERO_0100
     * @tc.desc   Test TextTimerConfiguration startTime property with zero parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerConfigStartTime_zero_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textTimerConfigStartTime_zero_0100] START');

      let strJson = inspector.getInspectorByKey('textTimer_config_startTime_zero');

      console.info("[textTimerConfigStartTime_zero_0100] startTime is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextTimer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('0');
      console.info('[textTimerConfigStartTime_zero_0100] END');
      done();
    })

    /**
     * @tc.name   textTimerConfigStartTime_negative_0100
     * @tc.number SUB_ARKUI_TEXTTIMERCONFIGURATION_STARTTIME_NEGATIVE_0100
     * @tc.desc   Test TextTimerConfiguration startTime property with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerConfigStartTime_negative_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textTimerConfigStartTime_negative_0100] START');

      let strJson = inspector.getInspectorByKey('textTimer_config_startTime_negative');

      console.info("[textTimerConfigStartTime_negative_0100] startTime is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TextTimer');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('-10000');
      console.info('[textTimerConfigStartTime_negative_0100] END');
      done();
    })

    /**
     * @tc.name   textTimerConfigStartTime_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMERCONFIGURATION_STARTTIME_UNDEFINED_0100
     * @tc.desc   Test TextTimerConfiguration startTime property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerConfigStartTime_undefined_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[textTimerConfigStartTime_undefined_0100] START');

      let strJsonCompare = inspector.getInspectorByKey('textTimer_config_startTime_default');
      let strJson = inspector.getInspectorByKey('textTimer_config_startTime_undefined');

      console.info("[textTimerConfigStartTime_undefined_0100] default startTime is: " + JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('startTime'));
      console.info("[textTimerConfigStartTime_undefined_0100] undefined startTime is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual(JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('startTime'));
      console.info('[textTimerConfigStartTime_undefined_0100] END');
      done();
    })

  })
}