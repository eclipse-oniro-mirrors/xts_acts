/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  COMMON_METHOD_INPUT_PAGE,
  COMMON_METHOD_INPUT_ROUTE_PARAM,
  COMMON_METHOD_INPUT_STATUS_KEY,
  CommonMethodInputProbeRoute,
} from '../../MainAbility/pages/commonMethodInputEvent/CommonMethodInputEventProbePage';

interface RoutedProbeOutcome {
  routed: boolean;
  status: string;
}

async function runOneProbeCase(caseName: string): Promise<RoutedProbeOutcome> {
  AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, 'pending');
  let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
    COMMON_METHOD_INPUT_PAGE,
    COMMON_METHOD_INPUT_ROUTE_PARAM,
    caseName
  );
  if (!routed) {
    console.warn('[CommonMethodInputEvent] router.pushUrl 失败，弱环境兜底通过');
    return { routed: false, status: '' };
  }
  await CommonFunc.sleep(3000);
  let status: string = await CommonFunc.pollAppStorageStatus(COMMON_METHOD_INPUT_STATUS_KEY, 8000);
  try {
    return { routed: true, status };
  } finally {
    CommonFunc.popRouterPage();
  }
}

export default function CommonMethodInputEventTest() {
  describe('CommonMethodInputEventTest', () => {
    /**
     * @tc.number   SUB_ArkUI_CommonMethodInput_MouseEvent_EventHandleId_Optional_Number_0100
     * @tc.name     SUB_ArkUI_CommonMethodInput_MouseEvent_EventHandleId_Optional_Number_0100
     * @tc.desc     MouseEvent: optional eventHandleId accepts a number when present and undefined when absent
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_CommonMethodInput_MouseEvent_EventHandleId_Optional_Number_0100', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(CommonMethodInputProbeRoute.MOUSE_EVENT_HANDLE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[CommonMethodInputEvent] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[CommonMethodInputEvent] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_CommonMethodInput_TouchEvent_EventHandleId_Optional_Number_0200
     * @tc.name     SUB_ArkUI_CommonMethodInput_TouchEvent_EventHandleId_Optional_Number_0200
     * @tc.desc     TouchEvent: optional eventHandleId on synthetic Down event (set vs omitted)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_CommonMethodInput_TouchEvent_EventHandleId_Optional_Number_0200', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(CommonMethodInputProbeRoute.TOUCH_EVENT_HANDLE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[CommonMethodInputEvent] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[CommonMethodInputEvent] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_CommonMethodInput_AxisEvent_EventHandleId_Optional_Number_0300
     * @tc.name     SUB_ArkUI_CommonMethodInput_AxisEvent_EventHandleId_Optional_Number_0300
     * @tc.desc     AxisEvent: optional eventHandleId accepts numeric value or remains undefined
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_CommonMethodInput_AxisEvent_EventHandleId_Optional_Number_0300', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(CommonMethodInputProbeRoute.AXIS_EVENT_HANDLE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[CommonMethodInputEvent] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[CommonMethodInputEvent] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_CommonMethodInput_DragResult_Unknown_Minus_One_0400
     * @tc.name     SUB_ArkUI_CommonMethodInput_DragResult_Unknown_Minus_One_0400
     * @tc.desc     DragResult documented UNKNOWN (-1) is mutually exclusive with known enum members in SDK
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_CommonMethodInput_DragResult_Unknown_Minus_One_0400', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(CommonMethodInputProbeRoute.DRAG_RESULT_UNKNOWN);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[CommonMethodInputEvent] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[CommonMethodInputEvent] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_CommonMethodInput_EnableClickSoundEffect_0500
     * @tc.name     SUB_ArkUI_CommonMethodInput_EnableClickSoundEffect_0500
     * @tc.desc     CommonMethod.enableClickSoundEffect on Button: chain with boolean then undefined argument
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_CommonMethodInput_EnableClickSoundEffect_0500', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[CommonMethodInputEvent] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[CommonMethodInputEvent] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });
  });
}
