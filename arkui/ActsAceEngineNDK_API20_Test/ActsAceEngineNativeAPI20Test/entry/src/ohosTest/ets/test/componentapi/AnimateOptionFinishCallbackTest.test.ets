/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterEach,beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import Utils from '../common/Utils';
import { ON } from "@kit.TestKit";
import { ComponentInfo } from "../common/Interfaces";


export default function AnimateOptionFinishCallbackTest() {
  describe('AnimateOptionFinishCallbackTest', () => {
    beforeAll(async (done: Function) => {
    await Utils.pushPage("componentapi/AnimateOptionFinishCallbackTest", done)
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_ARKUI_FINISH_CALLBACK_LOGICALLY_0100
     * @tc.name    : testFinishCallbackType0100
     * @tc.desc    : Test the ArkUI_FinishCallbackType.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testFinishCallbackType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("====>SUB_ARKUI_ACE_ENGINE_ARKUI_FINISH_CALLBACK_LOGICALLY_0100 start====");
        let component = await Utils.driver.findComponent(ON.id('Button1'));
        await component.click();
        await Utils.sleep(900);
        let strJson = getInspectorByKey('Animation1');
        let obj: ComponentInfo = JSON.parse(strJson);
        expect(parseFloat((JSON.parse(strJson).$attrs.width).split('vp')[0])).assertEqual(150)
        expect(obj.$attrs.backgroundColor).assertEqual('#FF00FF00')
        done();
      } catch (err) {
        console.error("====>SUB_ARKUI_ACE_ENGINE_ARKUI_FINISH_CALLBACK_LOGICALLY_0100 catch err: " + err);
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}