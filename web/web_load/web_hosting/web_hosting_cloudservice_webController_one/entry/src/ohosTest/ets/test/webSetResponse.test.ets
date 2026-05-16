
/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

// @ts-nocheck
let emitKey = ""
const driver = Driver.create();
export default function ActsAceWebSetResponse() {
  describe('ActsAceWebSetResponse', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webSetResponse',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webSetResponse state success " + JSON.stringify(pages));
        if (!("webSetResponse" == pages.name)) {
          console.info("get webSetResponse state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webSetResponse state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webSetResponse page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      done();
    })


    /**
     * @tc.name   testWebSetResponseStatus
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0001
     * @tc.desc   test WebSetResponseStatus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetResponseStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetResponseStatus"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseStatus", true, 147010, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebSetResponseStatusText
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0002
     * @tc.desc   test WebSetResponseStatusText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetResponseStatusText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetResponseStatusText"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseStatusText", true, 147020, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })



    /**
     * @tc.name   testWebSetResponseMimeType
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0003
     * @tc.desc   test WebSetResponseMimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetResponseMimeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetResponseMimeType"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseMimeType", true, 147030, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebSetResponseEncoding
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0004
     * @tc.desc   test WebSetResponseEncoding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebSetResponseEncoding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebSetResponseEncoding"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseEncoding", true, 147040, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })



    /**
     * @tc.name   testWebSetResponseHeaderNameNull
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0005
     * @tc.desc   test testWebSetResponseHeaderNameNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetResponseHeaderNameNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderNameNull"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseHeaderNameNull", true, 147050, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebSetResponseHeaderValueNull
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0006
     * @tc.desc   test WebSetResponseHeaderValueNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetResponseHeaderValueNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderValueNull"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseHeaderValueNull", true, 147060, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })


    /**
     * @tc.name   testWebSetResponseHeaderOverwriteNull
     * @tc.number SUB_ACE_WEB_SET_RESPONSE_API_0008
     * @tc.desc   test WebSetResponseHeaderOverwriteNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebSetResponseHeaderOverwriteNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebSetResponseHeaderOverwriteNull"
      Utils.emitEvent(emitKey, 147001);
      let isReturn = false;
      Utils.registerBaseEvent("testWebSetResponseHeaderOverwriteNull", true, 147070, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent('webSetNetErrorCode',driver)
      await waitForExist(()=>isReturn, emitKey, true,1000);
      done();
    })
  })
}
