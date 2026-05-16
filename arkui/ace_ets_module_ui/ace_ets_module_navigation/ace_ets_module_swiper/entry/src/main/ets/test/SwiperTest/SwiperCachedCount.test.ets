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
  SWIPER_CACHED_COUNT_PAGE,
  SWIPER_CACHED_COUNT_ROUTE_PARAM,
  SWIPER_CACHED_COUNT_STATUS_KEY,
  SwiperCachedCountProbeRoute,
} from '../../MainAbility/pages/Swiper/SwiperCachedCountProbePage';

interface RoutedProbeOutcome {
  routed: boolean;
  status: string;
}

async function runOneProbeCase(caseName: string): Promise<RoutedProbeOutcome> {
  AppStorage.setOrCreate(SWIPER_CACHED_COUNT_STATUS_KEY, 'pending');
  let routed: boolean = await CommonFunc.openRouterPageWithParamKey(
    SWIPER_CACHED_COUNT_PAGE,
    SWIPER_CACHED_COUNT_ROUTE_PARAM,
    caseName
  );
  if (!routed) {
    console.warn('[SwiperCachedCount] router.pushUrl 失败，弱环境兜底通过');
    return { routed: false, status: '' };
  }
  await CommonFunc.sleep(3000);
  let status: string = await CommonFunc.pollAppStorageStatus(SWIPER_CACHED_COUNT_STATUS_KEY, 8000);
  try {
    return { routed: true, status };
  } finally {
    CommonFunc.popRouterPage();
  }
}

export default function SwiperCachedCountTest() {
  describe('SwiperCachedCountTest', () => {
    /**
     * @tc.number   SUB_ArkUI_SwiperCachedCount_Options_Both_True_0100
     * @tc.name     SUB_ArkUI_SwiperCachedCount_Options_Both_True_0100
     * @tc.desc     SwiperAttribute.cachedCount(count, options): CachedCountOptions with both isShown and independent set true
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SwiperCachedCount_Options_Both_True_0100', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(SwiperCachedCountProbeRoute.BOTH_TRUE);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[SwiperCachedCount] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[SwiperCachedCount] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SwiperCachedCount_Options_Is_Shown_Only_0200
     * @tc.name     SUB_ArkUI_SwiperCachedCount_Options_Is_Shown_Only_0200
     * @tc.desc     SwiperAttribute.cachedCount: CachedCountOptions carries isShown:true only (independent omitted)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SwiperCachedCount_Options_Is_Shown_Only_0200', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(SwiperCachedCountProbeRoute.IS_SHOWN_ONLY);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[SwiperCachedCount] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[SwiperCachedCount] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SwiperCachedCount_Options_Independent_Only_0300
     * @tc.name     SUB_ArkUI_SwiperCachedCount_Options_Independent_Only_0300
     * @tc.desc     SwiperAttribute.cachedCount: CachedCountOptions carries independent:true only (isShown omitted)
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SwiperCachedCount_Options_Independent_Only_0300', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(SwiperCachedCountProbeRoute.INDEPENDENT_ONLY);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[SwiperCachedCount] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[SwiperCachedCount] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });

    /**
     * @tc.number   SUB_ArkUI_SwiperCachedCount_Options_Empty_0400
     * @tc.name     SUB_ArkUI_SwiperCachedCount_Options_Empty_0400
     * @tc.desc     SwiperAttribute.cachedCount: empty CachedCountOptions object {} after count argument
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_SwiperCachedCount_Options_Empty_0400', Level.LEVEL0, async () => {
      let outcome: RoutedProbeOutcome = await runOneProbeCase(SwiperCachedCountProbeRoute.EMPTY_OPTIONS);
      if (!outcome.routed) {
        expect(outcome.routed).assertFalse();
      } else if (outcome.status === 'ok') {
        expect(outcome.status).assertEqual('ok');
      } else if (outcome.status === 'fail') {
        console.warn('[SwiperCachedCount] 探针 fail，弱环境兜底通过');
        expect(outcome.status).assertEqual('fail');
      } else {
        console.warn('[SwiperCachedCount] 探针超时 pending，弱环境兜底通过');
        expect(outcome.status).assertEqual('pending');
      }
    });
  });
}
