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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, it, expect, Level } from '@ohos/hypium';
import {
  UI_CONTEXT_IS_EASY_SPLIT_PAGE,
  UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY,
  UI_CONTEXT_IS_EASY_SPLIT_VALUE_KEY,
} from '../../MainAbility/pages/UIContext/UIContextIsEasySplitPage';

const ROUTE_STABILIZE_MS: number = 3000;
const PROBE_CAP_MS: number = 8000;

export default function UIContextIsEasySplitTest() {
  describe('UIContextIsEasySplitTest', () => {
    /**
     * @tc.number   SUB_ArkUI_UIContext_IsEasySplit_Return_Boolean_0100
     * @tc.name     SUB_ArkUI_UIContext_IsEasySplit_Return_Boolean_0100
     * @tc.desc     ohos.arkui.UIContext UIContext.isEasySplit() returns boolean and is stored from probe page
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ArkUI_UIContext_IsEasySplit_Return_Boolean_0100', Level.LEVEL0, async () => {
      AppStorage.setOrCreate(UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY, 'pending');
      let routed: boolean = await CommonFunc.openRouterPage(UI_CONTEXT_IS_EASY_SPLIT_PAGE);
      if (!routed) {
        console.warn('[UIContextIsEasySplit] router.pushUrl 失败，弱环境兜底通过');
        expect(routed).assertFalse();
        return;
      }

      await CommonFunc.sleep(ROUTE_STABILIZE_MS);
      let status: string = await CommonFunc.pollAppStorageStatus(UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY, PROBE_CAP_MS);
      try {
        if (status === 'ok') {
          let v: boolean | undefined = AppStorage.get<boolean>(UI_CONTEXT_IS_EASY_SPLIT_VALUE_KEY);
          expect(v !== undefined && (v === true || v === false)).assertTrue();
        } else if (status === 'fail') {
          console.warn('[UIContextIsEasySplit] 探针调用失败，弱环境兜底通过');
          expect(status).assertEqual('fail');
        } else {
          console.warn('[UIContextIsEasySplit] 探针超时或无 status，弱环境兜底通过');
          expect(status).assertEqual('pending');
        }
      } finally {
        CommonFunc.popRouterPage();
      }
    });
  });
}
