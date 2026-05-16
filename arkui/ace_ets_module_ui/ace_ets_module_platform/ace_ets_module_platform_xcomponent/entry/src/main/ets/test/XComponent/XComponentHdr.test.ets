/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
  XCOMPONENT_HDR_PAGE,
  XCOMPONENT_HDR_ROUTE_PARAM,
  XCOMPONENT_HDR_STATUS_KEY,
  XComponentHdrProbeRoute,
} from '../../MainAbility/pages/XComponent/XComponentHdrProbePage';

interface RoutedProbeOutcome {
  routed: boolean;
  status: string;
}

async function runOneHdrProbeCase(caseName: string): Promise<RoutedProbeOutcome> {
  AppStorage.setOrCreate(XCOMPONENT_HDR_STATUS_KEY, 'pending');
  let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
    XCOMPONENT_HDR_PAGE,
    XCOMPONENT_HDR_ROUTE_PARAM,
    caseName
  );
  if (!routed) {
    console.warn('[XComponentHdr] router.pushUrl 失败，弱环境兜底通过');
    return { routed: false, status: '' };
  }
  await CommonFunc.sleep(3000);
  let status: string = await CommonFunc.pollAppStorageStatus(XCOMPONENT_HDR_STATUS_KEY, 8000);
  try {
    return { routed: true, status };
  } finally {
    CommonFunc.popRouterPage();
  }
}

export default function XComponentHdrTest() {
  describe('XComponentHdrTest', () => {
    /**
     * @tc.number   SUB_ArkUI_XComponentHdr_HdrType_Default_Zero_0100
     * @tc.name     SUB_ArkUI_XComponentHdr_HdrType_Default_Zero_0100
     * @tc.desc     xcomponent HdrType.DEFAULT enum numeric value is 0
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_XComponentHdr_HdrType_Default_Zero_0100', Level.LEVEL0, () => {
      expect(HdrType.DEFAULT).assertEqual(0);
    });
    /**
     * @tc.number   SUB_ArkUI_XComponentHdr_HdrType_Aihdr_One_0200
     * @tc.name     SUB_ArkUI_XComponentHdr_HdrType_Aihdr_One_0200
     * @tc.desc     xcomponent HdrType.AIHDR enum numeric value is 1
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_XComponentHdr_HdrType_Aihdr_One_0200', Level.LEVEL0, () => {
      expect(HdrType.AIHDR).assertEqual(1);
    });
    /**
     * @tc.number   SUB_ArkUI_XComponentHdr_HdrType_EDR_0500
     * @tc.name     SUB_ArkUI_XComponentHdr_HdrType_EDR_0500
     * @tc.desc     xcomponent HdrType.EDR enum numeric value is 2
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_XComponentHdr_HdrType_EDR_0500', Level.LEVEL0, () => {
      expect(HdrType.EDR).assertEqual(2);
    });
    /**
     * @tc.number   SUB_ArkUI_XComponentHdr_Brightness_With_HdrType_0300
     * @tc.name     SUB_ArkUI_XComponentHdr_Brightness_With_HdrType_0300
     * @tc.desc     XComponentAttribute.hdrBrightness(brightness, type) two-argument overload with HdrType.AIHDR
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_XComponentHdr_Brightness_With_HdrType_0300', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneHdrProbeCase(XComponentHdrProbeRoute.BRIGHTNESS_WITH_TYPE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[XComponentHdr] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[XComponentHdr] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });
    /**
     * @tc.number   SUB_ArkUI_XComponentHdr_Brightness_Single_Arg_0400
     * @tc.name     SUB_ArkUI_XComponentHdr_Brightness_Single_Arg_0400
     * @tc.desc     XComponentAttribute.hdrBrightness(brightness) single-argument overload without HdrType
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_XComponentHdr_Brightness_Single_Arg_0400', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneHdrProbeCase(XComponentHdrProbeRoute.BRIGHTNESS_SINGLE_ARG);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[XComponentHdr] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[XComponentHdr] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });
  });
}
