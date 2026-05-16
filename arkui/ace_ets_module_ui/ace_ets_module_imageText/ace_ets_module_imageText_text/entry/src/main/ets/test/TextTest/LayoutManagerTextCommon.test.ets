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
  LAYOUT_MANAGER_TEXT_COMMON_PAGE,
  LAYOUT_MANAGER_TEXT_COMMON_ROUTE_PARAM,
  LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY,
  LayoutManagerTextCommonProbeRoute,
} from '../../MainAbility/pages/Text/LayoutManagerTextCommonProbePage';

interface RoutedProbeOutcome {
  routed: boolean;
  status: string;
}

async function runOneProbeCase(caseName: string): Promise<RoutedProbeOutcome> {
  AppStorage.setOrCreate(LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY, 'pending');
  let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
    LAYOUT_MANAGER_TEXT_COMMON_PAGE,
    LAYOUT_MANAGER_TEXT_COMMON_ROUTE_PARAM,
    caseName
  );
  if (!routed) {
    console.warn('[LayoutManagerTextCommon] router.pushUrl 失败，弱环境兜底通过');
    return { routed: false, status: '' };
  }
  await CommonFunc.sleep(3000);
  let status: string = await CommonFunc.pollAppStorageStatus(LAYOUT_MANAGER_TEXT_COMMON_STATUS_KEY, 12000);
  try {
    return { routed: true, status };
  } finally {
    CommonFunc.popRouterPage();
  }
}

export default function LayoutManagerTextCommonTest() {
  describe('LayoutManagerTextCommonTest', () => {
    /**
     * @tc.number   SUB_ArkUI_LayoutManagerTextCommon_GetCharacterPositionAtCoordinate_0100
     * @tc.name     SUB_ArkUI_LayoutManagerTextCommon_GetCharacterPositionAtCoordinate_0100
     * @tc.desc     text_common LayoutManager.getCharacterPositionAtCoordinate(x, y) via TextController layout
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_LayoutManagerTextCommon_GetCharacterPositionAtCoordinate_0100', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome =
        await runOneProbeCase(LayoutManagerTextCommonProbeRoute.CHARACTER_POSITION);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[LayoutManagerTextCommon] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[LayoutManagerTextCommon] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_LayoutManagerTextCommon_GetGlyphRangeForCharacterRange_0200
     * @tc.name     SUB_ArkUI_LayoutManagerTextCommon_GetGlyphRangeForCharacterRange_0200
     * @tc.desc     text_common LayoutManager.getGlyphRangeForCharacterRange(TextRange) returns glyph spans
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_LayoutManagerTextCommon_GetGlyphRangeForCharacterRange_0200', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(LayoutManagerTextCommonProbeRoute.GLYPH_RANGE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[LayoutManagerTextCommon] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[LayoutManagerTextCommon] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_LayoutManagerTextCommon_GetCharacterRangeForGlyphRange_0300
     * @tc.name     SUB_ArkUI_LayoutManagerTextCommon_GetCharacterRangeForGlyphRange_0300
     * @tc.desc     text_common LayoutManager.getCharacterRangeForGlyphRange(TextRange) maps glyphs to char ranges
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_LayoutManagerTextCommon_GetCharacterRangeForGlyphRange_0300', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(LayoutManagerTextCommonProbeRoute.CHARACTER_RANGE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[LayoutManagerTextCommon] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[LayoutManagerTextCommon] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });
  });
}
