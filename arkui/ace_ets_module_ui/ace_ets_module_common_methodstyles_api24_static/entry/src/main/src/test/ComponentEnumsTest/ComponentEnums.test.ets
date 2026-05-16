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

import { describe, it, expect, Level } from '../../../../hypium/index';
import { EventQueryType, FocusWrapMode, SystemProperties } from '@ohos.arkui.component';

export default function ComponentEnumsTest(): void {
  describe('ComponentEnumsTest', () => {
    /**
     * @tc.number SUB_ArkUI_Enums_EventQueryType_OnClick_3800
     * @tc.name SUB_ArkUI_Enums_EventQueryType_OnClick_3800
     * @tc.desc EventQueryType ON_CLICK value 0 in enums.d.ets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_EventQueryType_OnClick_3800', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_EventQueryType_OnClick_3800 begin');
      expect(EventQueryType.ON_CLICK).assertEqual(0);
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_EventQueryType_OnClick_3800 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_FocusWrapMode_Default_3900
     * @tc.name SUB_ArkUI_Enums_FocusWrapMode_Default_3900
     * @tc.desc FocusWrapMode DEFAULT value 0 in enums.d.ets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_FocusWrapMode_Default_3900', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_FocusWrapMode_Default_3900 begin');
      expect(FocusWrapMode.DEFAULT).assertEqual(0);
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_FocusWrapMode_Default_3900 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_FocusWrapMode_WrapWithArrow_4000
     * @tc.name SUB_ArkUI_Enums_FocusWrapMode_WrapWithArrow_4000
     * @tc.desc FocusWrapMode WRAP_WITH_ARROW value 1 in enums.d.ets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_FocusWrapMode_WrapWithArrow_4000', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_FocusWrapMode_WrapWithArrow_4000 begin');
      expect(FocusWrapMode.WRAP_WITH_ARROW).assertEqual(1);
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_FocusWrapMode_WrapWithArrow_4000 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_SystemProperties_BreakPoint_4100
     * @tc.name SUB_ArkUI_Enums_SystemProperties_BreakPoint_4100
     * @tc.desc SystemProperties BREAK_POINT string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_SystemProperties_BreakPoint_4100', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_BreakPoint_4100 begin');
      expect(SystemProperties.BREAK_POINT).assertEqual('system.arkui.breakpoint');
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_BreakPoint_4100 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_SystemProperties_WindowAvoidArea_4200
     * @tc.name SUB_ArkUI_Enums_SystemProperties_WindowAvoidArea_4200
     * @tc.desc SystemProperties WINDOW_AVOID_AREA string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_SystemProperties_WindowAvoidArea_4200', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowAvoidArea_4200 begin');
      expect(SystemProperties.WINDOW_AVOID_AREA).assertEqual('system.window.avoidarea');
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowAvoidArea_4200 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_SystemProperties_WindowAvoidAreaPx_4300
     * @tc.name SUB_ArkUI_Enums_SystemProperties_WindowAvoidAreaPx_4300
     * @tc.desc SystemProperties WINDOW_AVOID_AREA_PX string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_SystemProperties_WindowAvoidAreaPx_4300', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowAvoidAreaPx_4300 begin');
      expect(SystemProperties.WINDOW_AVOID_AREA_PX).assertEqual('system.window.avoidarea.px');
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowAvoidAreaPx_4300 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_SystemProperties_WindowSize_4400
     * @tc.name SUB_ArkUI_Enums_SystemProperties_WindowSize_4400
     * @tc.desc SystemProperties WINDOW_SIZE string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_SystemProperties_WindowSize_4400', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowSize_4400 begin');
      expect(SystemProperties.WINDOW_SIZE).assertEqual('system.window.size');
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowSize_4400 end');
      done();
    });

    /**
     * @tc.number SUB_ArkUI_Enums_SystemProperties_WindowSizePx_4500
     * @tc.name SUB_ArkUI_Enums_SystemProperties_WindowSizePx_4500
     * @tc.desc SystemProperties WINDOW_SIZE_PX string constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ArkUI_Enums_SystemProperties_WindowSizePx_4500', Level.LEVEL1, (done: () => void) => {
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowSizePx_4500 begin');
      expect(SystemProperties.WINDOW_SIZE_PX).assertEqual('system.window.size.px');
      console.info('ComponentEnumsTest: SUB_ArkUI_Enums_SystemProperties_WindowSizePx_4500 end');
      done();
    });
  });
}
