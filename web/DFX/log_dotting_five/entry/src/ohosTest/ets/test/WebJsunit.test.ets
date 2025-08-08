/*
 * Copyright (c) 2022~2023 Huawei Device Co., Ltd.
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

let emitKey = "emitClearMatches";

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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_017                                                                                                                                                          
     *tc.name ClearMatches                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitSearchNext";
      Utils.registerEvent("ClearMatches", "17100001", 17, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_018                                                                                                                                                         
     *tc.name SearchNext                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('SearchNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearSslCache";
      Utils.registerEvent("SearchNext", "17100001", 18, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_019                                                                                                                                                         
     *tc.name ClearSslCache                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearSslCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitClearClientAuthenticationCache";
      Utils.registerEvent("ClearSslCache", "17100001", 19, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_020
    *tc.name ClearClientAuthenticationCache
    *tc.desic zoom the current page
    */
    it('ClearClientAuthenticationCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitStop";
      Utils.registerEvent("ClearClientAuthenticationCache", "17100001", 20, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_021                                                                                                                                                      
     *tc.name Stop                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('Stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitRequestFocus";
      Utils.registerEvent("Stop", "17100001", 21, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_022                                                                                                                                                      
     *tc.name RequestFocus                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('RequestFocus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomIn";
      Utils.registerEvent("RequestFocus", "17100001", 22, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_023                                                                                                                                                      
     *tc.name ZoomIn                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomIn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitZoomOut";
      Utils.registerEvent("ZoomIn", "17100001", 23, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_024                                                                                                                                                      
     *tc.name ZoomOut                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetWebId";
      Utils.registerEvent("ZoomOut", "17100001", 24, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_025                                                                                                                                                    
     *tc.name GetWebId                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetWebId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetUserAgent";
      Utils.registerEvent("GetWebId", "17100001", 25, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_026                                                                                                                                                      
     *tc.name GetUserAgent                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetPageHeigth";
      Utils.registerEvent("GetUserAgent", "17100001", 26, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_027                                                                                                                                                      
     *tc.name GetPageHeigth                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetPageHeigth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitBackOrForward";
      Utils.registerEvent("GetPageHeigth", "17100001", 27, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_028                                                                                                                                                      
     *tc.name BackOrForward                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('BackOrForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitGetUrl";
      Utils.registerEvent("BackOrForward", "17100001", 28, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_030                                                                                                                                                                     
     *tc.name GetUrl                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitOnce";
      Utils.registerContainEvent("GetUrl", "17100001", 30, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
