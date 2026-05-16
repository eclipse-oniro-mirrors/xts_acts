'use static';
/*
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


export default function TextTimerStartTimeTest() {
  describe('TextTimerStartTimeTest', () => {
    const SLEEP_TIME_1000 = 1000;
    beforeAll(async (): Promise<void> => {
      console.info("TextTimerStartTimeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.information02.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextTimerStartTimeTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextTimerStartTimeTest state pages:" + JSON.stringify(pages));
        if (!("TextTimerStartTime" == pages.name)) {
          console.info("get  TextTimerStartTimeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/TextTimer/TextTimerStartTime',
          })
        }
      } catch (err) {
        console.error("push TextTimerStartTimeTest page error:" + err);
      }
      console.info("TextTimerStartTimeTest foreEach end");
    });

    /**
 	 * @tc.name   textTimerStartTime_positive_static_0100
 	 * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_POSITIVE_STATIC_0100
 	 * @tc.desc   Test TextTimer startTime property with positive number parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('textTimerStartTime_positive_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[textTimerStartTime_positive_static_0100] START');
      let strJson = inspector.getInspectorByKey('textTimer_startTime_positive_static');
 	  console.info('[startTime] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('30000');
 	  console.info('[textTimerStartTime_positive_static_0100] END');
      done();
 	})
 	 
 	/**
 	 * @tc.name   textTimerStartTime_zero_static_0100
 	 * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_ZERO_STATIC_0100
 	 * @tc.desc   Test TextTimer startTime property with zero parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('textTimerStartTime_zero_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[textTimerStartTime_zero_static_0100] START');

 	  let strJson = inspector.getInspectorByKey('textTimer_startTime_zero_static');
 	  console.info('[startTime] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('0');
 	  console.info('[textTimerStartTime_zero_static_0100] END');
      done();
 	})
 	 
 	/**
 	 * @tc.name   textTimerStartTime_negative_static_0100
 	 * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_NEGATIVE_STATIC_0100
 	 * @tc.desc   Test TextTimer startTime property with negative number parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('textTimerStartTime_negative_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[textTimerStartTime_negative_static_0100] START');
 	  let strJson = inspector.getInspectorByKey('textTimer_startTime_negative_static');
 	  console.info('[startTime] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('startTime')).assertEqual('-10000');
 	  console.info('[textTimerStartTime_negative_static_0100] END');
      done();
 	})
 	 
 	 
 	/**
 	 * @tc.name   textTimerStartTime_undefined_static_0100
 	 * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_UNDEFINED_STATIC_0100
 	 * @tc.desc   Test TextTimer startTime property with undefined, should restore to default value
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('textTimerStartTime_undefined_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[textTimerStartTime_undefined_static_0100] START');
      let strJson1 = inspector.getInspectorByKey('textTimer_startTime_undefined_static');
 	  console.info('[startTime] undefined =' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('startTime'));
      let strJson2 = inspector.getInspectorByKey('textTimer_startTime_default_static');
 	  console.info('[startTime] default =' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('startTime'));
 	  expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('startTime'))
      .assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('startTime'));
 	  console.info('[textTimerStartTime_undefined_static_0100] END');
      done();
 	})
  })
}
