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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { UtilsTest } from '../Util.test'
import inspector from '@ohos.arkui.inspector';

export default function customComponentOnDrawBehindTest() {
  describe('CustomComponentOnDrawBehindTest', (): void  => {

    let PAGE_TAG = 'CustomComponentOnDrawBehindTest';

    beforeAll(async (): Promise<void> => {
      console.info("[ui] beforeAll start");
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api20.static", "EntryAbility")
      console.info("[ui] beforeAll end");
    });

    
    /**
     * @tc.number   testCustomComponentOnDrawBehind001
     * @tc.name     testCustomComponentOnDrawBehind001
     * @tc.desc     testCustomComponentOnDrawBehind001
     * @tc.level    Level.LEVEL0
     */
    it('testCustomComponentOnDrawBehind001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ui] pushPage start");
      await Utils.pushPage(`customcomponent/${PAGE_TAG}`, false);//1.1代码： await Utils.pushPage(`customcomponent/${PAGE_TAG}`, done);
      console.info("[ui] pushPage end");
      let strJson:string = inspector.getInspectorByKey('OnDrawTest');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

  })
}
