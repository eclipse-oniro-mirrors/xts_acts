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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from "@ohos.router";
import CommonFunc from "../../MainAbility/common/Common";

export default function TextTimerStartTimeTest() {
  describe('TextTimerStartTimeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTimerStartTimeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextTimer/TextTimerStartTime",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTimerStartTimeTest state pages:" + JSON.stringify(pages));
        if (!("TextTimerStartTime" == pages.name)) {
          console.info("get TextTimerStartTimeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextTimerStartTimeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextTimerStartTimeTest page error:" + err);
        expect().assertFail();
      }
      console.info("TextTimerStartTimeTest beforeEach end");
      done();
    });

    /**
     * @tc.name   textTimerStartTime_positive_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_POSITIVE_0100
     * @tc.desc   Test TextTimer startTime property with positive number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerStartTime_positive_0100', Level.LEVEL0, async () => {
      console.info('[textTimerStartTime_positive_0100] START');

      let strJson: string = getInspectorByKey('textTimer_startTime_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerStartTime_positive_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerStartTime_positive_0100] startTime is: " + obj.$attrs.startTime);

      expect(obj.$type).assertEqual('TextTimer');
      expect(obj.$attrs.startTime).assertEqual('30000');
      console.info('[textTimerStartTime_positive_0100] END');
    })

    /**
     * @tc.name   textTimerStartTime_zero_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_ZERO_0100
     * @tc.desc   Test TextTimer startTime property with zero parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerStartTime_zero_0100', Level.LEVEL0, async () => {
      console.info('[textTimerStartTime_zero_0100] START');

      let strJson: string = getInspectorByKey('textTimer_startTime_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerStartTime_zero_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerStartTime_zero_0100] startTime is: " + obj.$attrs.startTime);

      expect(obj.$type).assertEqual('TextTimer');
      expect(obj.$attrs.startTime).assertEqual('0');
      console.info('[textTimerStartTime_zero_0100] END');
    })

    /**
     * @tc.name   textTimerStartTime_negative_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_NEGATIVE_0100
     * @tc.desc   Test TextTimer startTime property with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerStartTime_negative_0100', Level.LEVEL0, async () => {
      console.info('[textTimerStartTime_negative_0100] START');

      let strJson: string = getInspectorByKey('textTimer_startTime_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerStartTime_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerStartTime_negative_0100] startTime is: " + obj.$attrs.startTime);

      expect(obj.$type).assertEqual('TextTimer');
      expect(obj.$attrs.startTime).assertEqual('-10000');
      console.info('[textTimerStartTime_negative_0100] END');
    })

    /**
     * @tc.name   textTimerStartTime_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_NULL_0100
     * @tc.desc   Test TextTimer startTime property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerStartTime_null_0100', Level.LEVEL0, async () => {
      console.info('[textTimerStartTime_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('textTimer_startTime_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textTimer_startTime_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerStartTime_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerStartTime_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerStartTime_null_0100] default startTime is: " + objCompare.$attrs.startTime);
      console.info("[textTimerStartTime_null_0100] null startTime is: " + obj.$attrs.startTime);

      expect(obj.$attrs.startTime).assertEqual(objCompare.$attrs.startTime);
      console.info('[textTimerStartTime_null_0100] END');
    })

    /**
     * @tc.name   textTimerStartTime_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_STARTTIME_UNDEFINED_0100
     * @tc.desc   Test TextTimer startTime property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTimerStartTime_undefined_0100', Level.LEVEL0, async () => {
      console.info('[textTimerStartTime_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('textTimer_startTime_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('textTimer_startTime_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerStartTime_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerStartTime_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerStartTime_undefined_0100] default startTime is: " + objCompare.$attrs.startTime);
      console.info("[textTimerStartTime_undefined_0100] undefined startTime is: " + obj.$attrs.startTime);

      expect(obj.$attrs.startTime).assertEqual(objCompare.$attrs.startTime);
      console.info('[textTimerStartTime_undefined_0100] END');
    })

  })
}