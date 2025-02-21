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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitHasImagePm";
import router from '@system.router';
export default function webViewHasImageJsunit() {
  describe('ActsAcewebViewHasImageJsunitTest', function () {
    beforeAll(async function (done) {
      let options = {
        uri: "MainAbility/pages/webViewHasImage"
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewHasImage state success " + JSON.stringify(pages));
        if (!("webViewHasImage" == pages.name)) {
          console.info("get webViewHasImage state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push webViewHasImage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewHasImage page error: " + err);
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
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0100
      * tc.name testHasImagePm
      * tc.desc There are offline images in the H5 page that are loaded using the img tag, and the interface
      * hasImage:Promise results in true
    */
    it('testHasImagePm',0,async function(done){
      emitKey="emitHasImagePmSvg";
      Utils.registerEvent("testHasImagePm",true,202,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0200
      * tc.name testHasImagePmSvg
      * tc.desc There is no image loaded using the img tag in the H5 page, only svg, and the interface
      * hasImage:Promise result is false
    */
    it('testHasImagePmSvg',0,async function(done){
      emitKey="emitHasImagePmOnline";
      Utils.registerEvent("testHasImageSvg",false,204,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0300
      * tc.name testHasImagePmOnline
      * tc.desc The H5 page has an online web page loaded using the img tag, and the interface
      * hasImage:Promise result is false
    */
    it('testHasImagePmOnline',0,async function(done){
      emitKey="emitHasImageCb";
      Utils.registerEvent("testHasImagePmOnline",false,206,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0400
      * tc.name testHasImageCb
      * tc.desc There are offline images in the H5 page that are loaded using the img tag, and the interface
      * hasImage:Callback results in true
    */
    it('testHasImageCb',0,async function(done){
      emitKey="emitHasImageCbSvg";
      Utils.registerEvent("testHasImageCb",true,208,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0500
     * tc.name testHasImageCbSvg
     * tc.desc There is no image loaded using the img tag in the H5 page, only svg, and the interface
     * hasImage:Callback result is false
   */
    it('testHasImageCbSvg',0,async function(done){
      emitKey="emitHasImageCbOnline";
      Utils.registerEvent("testHasImageCbSvg",false,210,done);
      sendEventByKey('webImagecomponent',10,'');
    })
    /*
     * tc.number SUB_ACE_BASIC_ETS_API_TESTHASIMAGE_0600
     * tc.name testHasImageCbOnline
     * tc.desc The H5 page has an online web page loaded using the img tag, and the interface
     * hasImage:Callback result is false
   */
    it('testHasImageCbOnline',0,async function(done){
      emitKey="emitHasImageCbOnline";
      Utils.registerEvent("testHasImageCbOnline",false,212,done);
      sendEventByKey('webImagecomponent',10,'');
    })
  })
}
