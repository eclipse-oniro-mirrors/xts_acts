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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect, beforeAll} from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import Utils from './Utils.ets';
let emitKey = "emitGetCertificate";
export default function webTwoJsunit() {
  describe('overviewTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: 'MainAbility/pages/webTwo',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webTwo state success " + JSON.stringify(pages));
        if (!("webTwo" == pages.name)) {
          console.info("get webTwo state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webTwo page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webTwo page error: " + err);
      }
      done()
    });
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })
    afterEach(async function (done) {
      console.info("web afterEach start:"+emitKey);
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
      done();
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_001                                                                                                                                                                     
     *tc.name GetCertificate                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('GetCertificate',0,async function(done){
      emitKey="emitonDownloadFailed";
      Utils.registerEvent("GetCertificate","getCertificate success: len = 0",4,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_002                                                                                                                                                                     
     *tc.name onDownloadFailed                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('onDownloadFailed',0,async function(done){
      emitKey="emitsetDownloadDelegate";
      Utils.registerEvent("onDownloadFailed",true,6,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_003                                                                                                                                                                   
     *tc.name setDownloadDelegate                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('setDownloadDelegate',0,async function(done){
      emitKey="emitresumeDownload";
      Utils.registerEvent("setDownloadDelegate",true,8,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_004                                                                                                                                                                 
     *tc.name resumeDownload                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('resumeDownload',0,async function(done){
      emitKey="emitRegisterJavaScriptProxy";
      Utils.registerEvent("resumeDownload",true,12,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_FOUR_API_005                                                                                                                                                             
     *tc.name RegisterJavaScriptProxy                                                                                                                                                                                                                 
     *tc.desic Sets allow the Web access overview mode
     */
    it('RegisterJavaScriptProxy',0,async function(done){
      emitKey="emitRegisterJavaScriptProxy";
      Utils.registerEvent("RegisterJavaScriptProxy",'\"okok\"',14,done);
      sendEventByKey('webcomponenttwo',10,'');
    })
  })
}