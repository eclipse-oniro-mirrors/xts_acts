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
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitFileAccessTrue";
const driver = Driver.create();

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async  (done: Function) =>{
      await driver.waitForComponent(ON.id("webcomponent"), 10000);
      done()
    });
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_037
     *tc.name fileAccessTrue
     *tc.desic Sets  enable local file system access in Web
     */
    it('fileAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitFileAccessTrue", 160700);
      Utils.registerContainEvent("fileAccessTrue", "index", 160710, done);
      await Utils.waitAndClickComponent(driver, 'webcomponent');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_056
     *tc.name onInactive
     *tc.desic Let the Web inactive.
     */
    it('onInactive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnInactive", 160700);
      Utils.registerEvent("onInactive", true, 160720, done);
      await Utils.waitAndClickComponent(driver, 'webcomponent');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_057
     *tc.name onActive
     *tc.desic Let the Web active
     */
    it('onActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnActive", 160700);
      Utils.registerContainEvent("onActive", "index.html", 160730, done);
      await Utils.waitAndClickComponent(driver, 'webcomponent');
    })

  })
}
