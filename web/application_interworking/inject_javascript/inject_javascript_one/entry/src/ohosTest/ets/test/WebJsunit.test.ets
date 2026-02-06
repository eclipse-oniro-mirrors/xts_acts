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
import { beforeAll,afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {
      await driver.waitForComponent(ON.id("webcomponent"), 10000);
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('web beforeEach start');
      done();
    })

    /**
     * @tc.name   registerJavaScriptProxy
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_058
     * @tc.desc   registerJavaScriptProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxy", 172240)
      Utils.registerEvent("registerJavaScriptProxy", "backToEts", 172250, done);
      await Utils.waitAndClickComponent(driver, 'webcomponent');
    })
    /**
     * @tc.name   deleteJavaScriptRegister
     * @tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_059
     * @tc.desc   deleteJavaScriptRegister
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deleteJavaScriptRegister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDeleteJavaScriptRegister", 172240)
      Utils.registerEvent("deleteJavaScriptRegister", true, 172260, done);
      await Utils.waitAndClickComponent(driver, 'webcomponent');
    })
  })
}
