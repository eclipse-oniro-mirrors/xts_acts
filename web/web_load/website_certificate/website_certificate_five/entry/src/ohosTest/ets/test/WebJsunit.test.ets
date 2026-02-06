/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 202400;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_087                                                                                                                                                               
     *tc.name saveHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic save credentials
     */
    it('saveHttpAuthCredentials', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSaveHttpAuthCredentials", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("saveHttpAuthCredentials", true, 202410, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'saveHttpAuthCredentials' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_088                                                                                                                                                                
     *tc.name getHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('getHttpAuthCredentials', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetHttpAuthCredentials", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("getHttpAuthCredentials", "Stromgol", 202420, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'getHttpAuthCredentials' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_API_089                                                                                                                                                                
     *tc.name deleteHttpAuthCredentials                                                                                                                                                                                                              
     *tc.desic delete credentials
     */
    it('deleteHttpAuthCredentials', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDeleteHttpAuthCredentials", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("deleteHttpAuthCredentials", false, 202430, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'deleteHttpAuthCredentials' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}