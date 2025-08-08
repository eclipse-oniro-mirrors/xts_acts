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
import { afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitImageAccessFalse";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_027
     *tc.name imageAccessFalse
     *tc.desic Sets Web can not automatically load image resources
     */
    it('imageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitImageAccessTrue";
      Utils.registerEvent("imageAccessFalse", "null", 148, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_028
     *tc.name imageAccessTrue
     *tc.desic Sets Web can  automatically load image resources
     */
    it('imageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnlineImageAccessFalse";
      Utils.registerContainEvent("imageAccessTrue", "load complete", 150, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_029
     *tc.name onlineImageAccessFalse
     *tc.desic Sets not to allow image resources to be loaded from the network
     */
    it('onlineImageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnlineImageAccessTrue";
      Utils.registerEvent("onlineImageAccessFalse", "null", 156, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_030
     *tc.name onlineImageAccessTrue
     *tc.desic Sets  allow image resources to be loaded from the network
     */
    it('onlineImageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitCacheModeOnly";
      Utils.registerContainEvent("onlineImageAccessTrue", "load image complete", 158, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_033
     *tc.name cacheModeOnly
     *tc.desic load cache and not online
     */
    it('cacheModeOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitCacheModeDefault";
      Utils.registerEvent("cacheModeOnly", "cacheError", 182, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_034
     *tc.name cacheModeDefault
     *tc.desic load cache when they are available and not expired, otherwise load online
     */
    it('cacheModeDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitMixedModeNone";
      Utils.registerContainEvent("cacheModeDefault", "index", 184, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_035
     *tc.name mixedModeNone
     *tc.desic Sets Don't allow unsecure sources from a secure origin
     */
    it('mixedModeNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitMixedModeAll";
      Utils.registerContainEvent("mixedModeNone", "insecure", 186, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_036
     *tc.name mixedModeAll
     *tc.desic Sets Allows  all HTTP and HTTPS content can be loaded
     */
    it('mixedModeAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitFileAccessTrue";
      Utils.registerEvent("mixedModeAll", 3, 188, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
