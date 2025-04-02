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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import uiEffect from "@ohos.graphics.uiEffect"

export default function graphicUiEffectInterfaceTest() {
  describe('graphicUiEffectInterfaceTest', ()=> {
    console.log('describe graphicUiEffectInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICUIEFFECT_JS_API_001
     * @tc.name      : testCreateFilter
     * @tc.desc      : Filter instances are created to add multiple filter effects to the component.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateFilter', 1, async (done:Function)=> {
      let msg = " =====testCreateFilter==== "
      try {
        let filter : uiEffect.Filter = uiEffect.createFilter()
        console.log(msg + " Succeed in uiEffect.createFilter ")
        expect(true).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in uiEffect.createFilter " + JSON.stringify(err))
        console.log(msg + " Faild in uiEffect.createFilter " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}