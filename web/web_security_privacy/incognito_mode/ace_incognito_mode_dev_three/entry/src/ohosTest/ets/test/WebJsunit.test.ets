/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "emitGetStoredGeolocation";

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
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: 100,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      done();
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_036                                                                                                                                                               
     *tc.name GetStoredGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSetHttpDnsSuccess";
      Utils.registerEvent("GetStoredGeolocation", "file:///", 120, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_037                                                                                                                                                           
     *tc.name SetHttpDnsSuccess                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('SetHttpDnsSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocation";
      Utils.registerEvent("SetHttpDnsSuccess", 1, 446, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_038                                                                                                                                                           
     *tc.name GetAccessibleGeolocation                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetAccessibleGeolocationPromise";
      Utils.registerEvent("GetAccessibleGeolocation", true, 451, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_056                                                                                                                                                
     *tc.name GetAccessibleGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetAccessibleGeolocationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetStoredGeolocationPromise";
      Utils.registerEvent("GetAccessibleGeolocationPromise", true, 517, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_060                                                                                                                                                              
     *tc.name GetStoredGeolocationPromise                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetStoredGeolocationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetStoredGeolocationPromise";
      Utils.registerEvent("GetStoredGeolocationPromise", "file:///", 521, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
