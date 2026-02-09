'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, Level, describe,beforeAll } from '../../../../hypium';
import { Component, Driver, ON,  PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';
import router from '@ohos.router';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import inspector from '@ohos.arkui.inspector'
export default function enableDropDisallowedBadgeTest() {
  let PAGE_TAG = 'enableDropDisallowedBadge';

  describe('enableDropDisallowedBadgeTest', (): void  => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_nowear_xts_api20.static", "EntryAbility")
    });
    afterEach(async (): Promise<void> => {
      await Utils.sleep(100);
    })

   

  /**
     * @tc.number   enableDropDisallowedBadge001
     * @tc.name     enableDropDisallowedBadge001
     * @tc.desc     enableDropDisallowedBadge001
     * @tc.level    Level.LEVEL1
     */
    it('enableDropDisallowedBadge001', Level.LEVEL1, async (done: () => void): Promise<void> => {
    console.info('enableDropDisallowedBadge001 START');
    let PAGE_TAG = 'enableDropDisallowedBadge';
    await Utils.pushPage(`dropBadge/enableDropDisallowedBadge`)
    await Utils.sleep(2000)
    let strJson = inspector.getInspectorByKey('image');
    let obj = JSON.parseJsonElement(strJson);
    console.info("[enableDropDisallowedBadge001]:" + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
    expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#AA00AA00');  // 断言失败 expect #FF00FF00 equals #AA00AA00
    await Utils.sleep(1000)
    console.info('enableDropDisallowedBadge001 END');
    done();
  });
  })
}