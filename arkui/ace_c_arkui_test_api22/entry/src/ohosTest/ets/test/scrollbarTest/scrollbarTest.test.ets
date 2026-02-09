/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativerender.so'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';

export default function scrollBarTest(){

  describe('scrollBarTest', () => {
    let PAGE_TAG = 'scrollbarTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`scrollbarTest/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   scrollBarTest_001
     * @tc.number SUB_ARKUI_CAPI_scrollBarTest_001
     * @tc.desc   Test RegisterCommonEvent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scrollBarTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[scrollBarTest_001] START'); 
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textArea');
      console.info('[scrollBarTest_001] START1'); 
      let obj: ESObject = JSON.parse(strJson);
      console.info('[scrollBarTest_001] scrollBarColor: ' + JSON.stringify(obj.$attrs.scrollBarColor));
      expect(obj.$attrs.scrollBarColor +'').assertEqual('#FFFFFF00');
      console.info("[scrollBarTest_001] END");
      done();
    });
  })
}