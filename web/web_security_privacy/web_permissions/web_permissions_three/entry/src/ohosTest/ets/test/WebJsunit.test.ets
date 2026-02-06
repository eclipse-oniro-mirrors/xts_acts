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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {

      await driver.waitForComponent(ON.id("webcomponent"), 10000);
      console.log("waitForComponent webcomponent");
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_021
     *tc.name geolocationAccessFalse
     *tc.desic Sets false not allow access to geographical locations
     */
    it('geolocationAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGeolocationAccessFalse", 160950)
      Utils.registerContainEvent("geolocationAccessFalse", "位置服务被拒绝", 160960, done);
      let component = await driver.findComponent(ON.id("webcomponent"));
      await component.click();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_024
     *tc.name onGeolocationShow
     *tc.desic Triggered when requesting to show the geolocation permission
     */
    it('onGeolocationShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnGeolocationShow", 160950)
      Utils.registerContainEvent("onGeolocationShow", "onGeolocationShow", 160970, done);
      let component = await driver.findComponent(ON.id("webcomponent"));
      await component.click();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_025
     *tc.name domStorageAccessFalse
     *tc.desic Sets not to enable the DOM Storage API permission
     */
    it('domStorageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDomStorageAccessFalse", 160950)
      Utils.registerContainEvent("domStorageAccessFalse", "sorry", 160980, done);
      let component = await driver.findComponent(ON.id("webcomponent"));
      await component.click();
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_026
     *tc.name domStorageAccessTrue
     *tc.desic Sets  enable the DOM Storage API permission
     */
    it('domStorageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDomStorageAccessTrue", 160950)
      Utils.registerContainEvent("domStorageAccessTrue", "domapi", 160990, done);
      let component = await driver.findComponent(ON.id("webcomponent"));
      await component.click();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_031
     *tc.name databaseAccessTrue
     *tc.desic Sets allow the Web access the database
     */
    it('databaseAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitDatabaseAccessTrue", 160950)
      Utils.registerContainEvent("databaseAccessTrue", "openDatabase", 161000, done);
      let component = await driver.findComponent(ON.id("webcomponent"));
      await component.click();
    })

  })
}
