/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
import router from '@system.router';
let emitKey = "emitOnWindowNew01";
export default function webViewOnWindowNewJsunit() {
  describe('ActsAceWebViewOnWindowNewJsunitTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/onWindowNew"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onWindowNew state success " + JSON.stringify(pages));
        if (!("onWindowNew" == pages.name)) {
          console.info("get onWindowNew state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push onWindowNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onWindowNew page error: " + err);
      }
      await Utils.sleep(2000);
      done()
    })
    beforeEach(async function (done) {
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach start:"+emitKey);
      try {
            let backData = {
                data: {
                    "ACTION": emitKey
                }
            }
            let backEvent = {
                eventId:10,
                priority:events_emitter.EventPriority.LOW
            }
            console.info("start send emitKey");
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(2000);
      console.info("ActsAceWebViewOnWindowNewJsunitTest afterEach end");
      done();
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0100
    *tc.name testOnWindowNew01
    *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
    *         allowWindowOpenMethod to true,javaScriptAccess to true
    */
    it('testOnWindowNew01',0,async function(done){
      emitKey="emitOnWindowNew02";
      Utils.registerEvent("testOnWindowNew01", 1, 7100, done);
      sendEventByKey('onWindowNew',10, '');
    })
     /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0200
     *tc.name testOnWindowNew02
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
     *         allowWindowOpenMethod to false,javaScriptAccess to true
     */
     it('testOnWindowNew02',0,async function(done){
      emitKey="emitOnWindowNew03";
      Utils.registerEvent("testOnWindowNew02", 0, 7102, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0300
     *tc.name testOnWindowNew03
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to true,
     *         allowWindowOpenMethod to false,javaScriptAccess to false
     */
    it('testOnWindowNew03',0,async function(done){
      emitKey="emitOnWindowNew04";
      Utils.registerEvent("testOnWindowNew03", 0, 7104, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_ONWINDOWNEW_0400
     *tc.name testOnWindowNew04
     *tc.desc test api OnWindowNew by execute window.open function,at the same time,set MutliWindowAccess to false,
     *         allowWindowOpenMethod to false,javaScriptAccess to true
     */
    it('testOnWindowNew04',0,async function(done){
      emitKey="emitOnPageVisibleLoadUrl";
      Utils.registerEvent("testOnWindowNew04", 0, 7106, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0100
    *tc.name testOnPageVisibleLoadUrl
    *tc.desc test api onPageVisible by load new url
    */
    it('testOnPageVisibleLoadUrl',0,async function(done){
      emitKey="emitOnPageVisibleRefresh";
      let url = 'resource://rawfile/index.html';
      Utils.registerEvent("testOnPageVisibleLoadUrl", url, 7108, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_ONPAGEVISBALE_0200
    *tc.name testOnPageVisibleRefresh
    *tc.desc test api onPageVisible by refresh
    */
    it('testOnPageVisibleRefresh',0,async function(done){
      emitKey="emitBlockNetWorkTrue";
      let url = 'resource://rawfile/index.html';
      Utils.registerEvent("testOnPageVisibleRefresh", url, 7110, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_BLOCKNETWORK_0100
    *tc.name testBlockNetWorkTrue
    *tc.desc test api blockNetWork set to true by load online website
    */
    it('testBlockNetWorkTrue',0,async function(done){
      emitKey="emitBlockNetWorkFalse";
      let url = "http://www.weibo.com/";
      Utils.registerEvent("testBlockNetWorkTrue", url, 7112, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_BLOCKNETWORK_0200
    *tc.name testBlockNetWorkFalse
    *tc.desc test api blockNetWork set to false by load online website
    */
   it('testBlockNetWorkFalse',0,async function(done){
     emitKey="emitGetOriginsPromiseLoadLocalHtml01";
     let title = "weibo.com";
      Utils.registerEvent("testBlockNetWorkFalse", title, 7114, done);
      sendEventByKey('onWindowNew', 10, '');
    })
    /*
    *tc.number SUB_ACE_BASIC_ETS_API_GETORIGINSPROMISE_0100
    *tc.name testGetOriginsPromiseLoadLocalHtml01
    *tc.desc test api GetOrigins promise mode by load loacal html
    */
     it('testGetOriginsPromiseLoadLocalHtml01', 0, async function(done){
      emitKey = 'emitGetOriginsPromiseLoadLocalHtml01';
      Utils.registerLargerEvent("testGetOriginsPromiseLoadLocalHtml01", 7166, done);
      sendEventByKey('onWindowNew', 10, '');
    })
  })
}