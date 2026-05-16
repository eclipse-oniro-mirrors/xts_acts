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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import buffer from '@ohos.buffer';
import uiEffect from "@ohos.graphics.uiEffect"

export default function graphicUiEffectInterfaceTest() {
  describe('graphicUiEffectInterfaceTest', ()=> {
    console.log('describe graphicUiEffectInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.name   testCreateFilter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICUIEFFECT_JS_API_001
     * @tc.desc   Filter instances are created to add multiple filter effects to the component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =====testCreateFilter==== "
      try {
        let filter : uiEffect.Filter = uiEffect.createFilter()
        console.log(msg + " Succeed in uiEffect.createFilter ")
        done()
      } catch (err) {
        console.log(msg + " Faild in uiEffect.createFilter " + JSON.stringify(err))
        console.log(msg + " Faild in uiEffect.createFilter " + err)
        expect().assertFail()
        done()
      }
    })

    /**
     * @tc.name   testCreateFilterBlur_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICUIEFFECT_JS_API_002
     * @tc.desc   Filter instances are created to add multiple filter effects to the component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFilterBlur_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = " =====testCreateFilterBlur_0100==== "
      try {
        let filter : uiEffect.Filter = uiEffect.createFilter()
        console.log(msg + " Succeed in uiEffect.createFilter ")
        try {
          let filter1 = filter.blur(-10)
          console.info('www data success blur 111', JSON.stringify(filter1));
        } catch (err) {
          console.info('www data failed to blur 111', JSON.stringify(err));
          expect().assertFail()
        }
        try {
          let filter2 = filter.blur(0)
          console.info('www data success blur 222', JSON.stringify(filter2));
        } catch (err) {
          console.info('www data failed to blur 222', JSON.stringify(err));
          expect().assertFail()
        }
        try {
          let filter3 = filter.blur(1)
          console.info('www data success blur 333', JSON.stringify(filter3));
        } catch (err) {
          console.info('www data failed to blur 333', JSON.stringify(err));
          expect().assertFail()
        }
        try {
          let filter4 = filter.blur(null)
          console.info('www data success blur 444', JSON.stringify(filter4));
        } catch (err) {
          console.info('www data failed to blur 444', JSON.stringify(err));
          expect().assertFail()
        }
        try {
          let filter5 = filter.blur(undefined)
          console.info('www data success blur 555', JSON.stringify(filter5));
        } catch (err) {
          console.info('www data failed to blur 555', JSON.stringify(err));
          expect().assertFail()
        }
        done()
      } catch (err) {
        console.log(msg + " Failed in uiEffect.createFilter " + JSON.stringify(err))
        console.log(msg + " Failed in uiEffect.createFilter " + err)
        expect().assertFail()
        done()
      }
    })
    
  })
}