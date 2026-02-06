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

import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      done();
    })
    /**
     * @tc.name   testSetPrintBackgroundOne
     * @tc.number SUB_ACE_BASIC_ETS_API_SETPRINTBACKGROUND_0100
     * @tc.desc   Support printing background colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPrintBackgroundOne',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitSetPrintBackgroundOne", 300530)
      Utils.registerEvent("testSetPrintBackgroundOne",false,300540,done);
      sendEventByKey('WebInitTestButton',10,'');
    })

    /**
     * @tc.name   emitSetPrintBackgroundTwo
     * @tc.number SUB_ACE_BASIC_ETS_API_SETPRINTBACKGROUND_0200
     * @tc.desc   Support printing background colors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSetPrintBackgroundTwo',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      Utils.emitEvent("emitSetPrintBackgroundTwo", 300530)
      Utils.registerEvent("emitSetPrintBackgroundTwo",true,20251025,done);
      sendEventByKey('WebInitTestButton',10,'');
    })

  })
}
