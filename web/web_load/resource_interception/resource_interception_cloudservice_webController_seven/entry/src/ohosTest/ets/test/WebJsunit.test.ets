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

const EVENT_ID_SET_EMIT_KEY = 201850;
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_027
     *tc.name imageAccessFalse
     *tc.desic Sets Web can not automatically load image resources
     */
    it('imageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitImageAccessFalse", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("imageAccessFalse",  "null", 201860, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'imageAccessFalse' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_028
     *tc.name imageAccessTrue
     *tc.desic Sets Web can  automatically load image resources
     */
    it('imageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitImageAccessTrue", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("imageAccessTrue", '"load complete"', 201870, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'imageAccessTrue' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_029
     *tc.name onlineImageAccessFalse
     *tc.desic Sets not to allow image resources to be loaded from the network
     */
    it('onlineImageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnlineImageAccessFalse", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("onlineImageAccessFalse",  "null", 201880, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'onlineImageAccessFalse' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_030
     *tc.name onlineImageAccessTrue
     *tc.desic Sets  allow image resources to be loaded from the network
     */
    it('onlineImageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitOnlineImageAccessTrue", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("onlineImageAccessTrue", '"load image complete"', 201890, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'onlineImageAccessTrue' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_033
     *tc.name cacheModeOnly
     *tc.desic load cache and not online
     */
    it('cacheModeOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeOnly", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("cacheModeOnly",  "cacheError", 201900, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'cacheModeOnly' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_034
     *tc.name cacheModeDefault
     *tc.desic load cache when they are available and not expired, otherwise load online
     */
    it('cacheModeDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitCacheModeDefault", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("cacheModeDefault", '"index"', 201910, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'cacheModeDefault' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_035
     *tc.name mixedModeNone
     *tc.desic Sets Don't allow unsecure sources from a secure origin
     */
    it('mixedModeNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeNone", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("mixedModeNone", true, 201920, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'mixedModeNone' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_036
     *tc.name mixedModeAll
     *tc.desic Sets Allows  all HTTP and HTTPS content can be loaded
     */
    it('mixedModeAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitMixedModeAll", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("mixedModeAll", 3, 201930, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "webcomponent");
      if (await Utils.waitForExist(() => isReturn, 'mixedModeAll' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}