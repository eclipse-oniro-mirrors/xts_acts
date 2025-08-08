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
let emitKey = "emitGeolocationAccessFalse";

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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_021
     *tc.name geolocationAccessFalse
     *tc.desic Sets false not allow access to geographical locations
     */
    it('geolocationAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnGeolocationShow";
      Utils.registerContainEvent("geolocationAccessFalse", "位置服务被拒绝", 96, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_024
     *tc.name onGeolocationShow
     *tc.desic Triggered when requesting to show the geolocation permission
     */
    it('onGeolocationShow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDomStorageAccessFalse";
      Utils.registerContainEvent("onGeolocationShow", "onGeolocationShow", 99, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_025
     *tc.name domStorageAccessFalse
     *tc.desic Sets not to enable the DOM Storage API permission
     */
    it('domStorageAccessFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDomStorageAccessTrue";
      Utils.registerContainEvent("domStorageAccessFalse", "sorry", 144, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_026
     *tc.name domStorageAccessTrue
     *tc.desic Sets  enable the DOM Storage API permission
     */
    it('domStorageAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitDatabaseAccessTrue";
      Utils.registerContainEvent("domStorageAccessTrue", "domapi", 146, done);
      sendEventByKey('webcomponent', 10, '');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_031
     *tc.name databaseAccessTrue
     *tc.desic Sets allow the Web access the database
     */
    it('databaseAccessTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnPrompt";
      Utils.registerContainEvent("databaseAccessTrue", "openDatabase", 164, done);
      sendEventByKey('webcomponent', 10, '');
    })

  })
}
