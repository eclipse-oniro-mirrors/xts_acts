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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
let emitKey = "emitOnLoadIntercept";
export default function stateJsunit() {
  describe('ActsAceStateTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("state beforeEach start");
      done();
    })
    
    afterEach(async function (done) {
      console.info("state afterEach start:"+emitKey);
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
     *tc.number SUB_ACE_BASIC_ETS_API_002
     *tc.name OnLoadIntercept                                                                                                                                                                                                                     *tc.desic Injects the JavaScript object into window and invoke the function in window
     */
    it('OnLoadIntercept',0,async function(done){
      emitKey="emitClear";
      Utils.registerEvent("OnLoadIntercept","https://www.baidu.com/",2,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Clear',0,async function(done){
      emitKey="emitKeys";
      Utils.registerEvent("Clear",true,6,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Keys',0,async function(done){
      emitKey="emitSize";
      let value =["PropA"]
      Utils.registerEvent("Keys",JSON.stringify(value),8,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Size',0,async function(done){
      emitKey="emitLocalStorageSize";
      Utils.registerEvent("Size",1,10,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('LocalStorageSize',0,async function(done){
      emitKey="emitLink";
      Utils.registerEvent("LocalStorageSize",1,12,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Link',0,async function(done){
      emitKey="emitLinkUndefined";
      Utils.registerEvent("Link",48,14,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('LinkUndefined',0,async function(done){
      emitKey="emitSetAndLinkCreate";
      Utils.registerEvent("LinkUndefined",undefined,16,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('SetAndLinkCreate',0,async function(done){
      emitKey="emitProp";
      Utils.registerEvent("SetAndLinkCreate",49,18,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Prop',0,async function(done){
      emitKey="emitPropUndefined";
      Utils.registerEvent("Prop",47,20,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('PropUndefined',0,async function(done){
      emitKey="emitSetAndLink";
      Utils.registerEvent("PropUndefined",undefined,22,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('SetAndLink',0,async function(done){
      emitKey="emitSetAndPropNull";
      Utils.registerEvent("SetAndLink",47,24,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('SetAndPropNull',0,async function(done){
      emitKey="emitSetAndProp";
      Utils.registerEvent("SetAndPropNull",49,26,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('SetAndProp',0,async function(done){
      emitKey="emitDelete";
      Utils.registerEvent("SetAndProp",47,28,done);
      sendEventByKey('webcomponent',10,'');
    })
    it('Delete',0,async function(done){
      emitKey="emitDelete";
      Utils.registerEvent("Delete",true,30,done);
      sendEventByKey('webcomponent',10,'');
    })

  })
}
