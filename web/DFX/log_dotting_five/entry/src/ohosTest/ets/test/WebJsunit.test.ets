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

import { beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

//let emitKey = "emitClearMatches";

export default function webJsunit() {
  describe('ActsAceWebDevTest', () => {
    beforeAll(async (done: Function) => {
      await waitForComponent("webcomponent");
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
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_017                                                                                                                                                          
     *tc.name ClearMatches                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearMatches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearMatches", 119790)
      Utils.registerEvent("ClearMatches", "17100001", 119800, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_018                                                                                                                                                         
     *tc.name SearchNext                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('SearchNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSearchNext", 119790)
      Utils.registerEvent("SearchNext", "17100001", 119810, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_019                                                                                                                                                         
     *tc.name ClearSslCache                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ClearSslCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearSslCache", 119790)
      Utils.registerEvent("ClearSslCache", "17100001", 119820, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_020
    *tc.name ClearClientAuthenticationCache
    *tc.desic zoom the current page
    */
    it('ClearClientAuthenticationCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitClearClientAuthenticationCache", 119790)
      Utils.registerEvent("ClearClientAuthenticationCache", "17100001", 119830, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_021                                                                                                                                                      
     *tc.name Stop                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('Stop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitStop", 119790)
      Utils.registerEvent("Stop", "17100001", 119840, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_022                                                                                                                                                      
     *tc.name RequestFocus                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('RequestFocus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRequestFocus", 119790)
      Utils.registerEvent("RequestFocus", "17100001",119850, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_023                                                                                                                                                      
     *tc.name ZoomIn                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomIn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitZoomIn", 119790)
      Utils.registerEvent("ZoomIn", "17100001", 119860, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_024                                                                                                                                                      
     *tc.name ZoomOut                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('ZoomOut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitZoomOut", 119790)
      Utils.registerEvent("ZoomOut", "17100001", 119870, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_025                                                                                                                                                    
     *tc.name GetWebId                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetWebId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetWebId", 119790)
      Utils.registerEvent("GetWebId", "17100001", 119880, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_026                                                                                                                                                      
     *tc.name GetUserAgent                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetUserAgent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetUserAgent", 119790)
      Utils.registerEvent("GetUserAgent", "17100001", 119890, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_027                                                                                                                                                      
     *tc.name GetPageHeigth                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('GetPageHeigth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetPageHeigth", 119790)
      Utils.registerEvent("GetPageHeigth", "17100001", 119900, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_028                                                                                                                                                      
     *tc.name BackOrForward                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('BackOrForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitBackOrForward", 119790)
      Utils.registerEvent("BackOrForward", "17100001", 119910, done);
      sendEventByKey('webcomponent', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_030                                                                                                                                                                     
     *tc.name GetUrl                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitGetUrl", 119790)
      Utils.registerContainEvent("GetUrl", "17100001", 119920, done);
      sendEventByKey('webcomponent', 10, '');
    })
  })
}
