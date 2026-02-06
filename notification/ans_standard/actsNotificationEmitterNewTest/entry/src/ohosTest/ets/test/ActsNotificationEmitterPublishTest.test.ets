/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base';

const TAG = 'Notification';
const TEST_SUITE_NAME = 'ActsEmitterPublishTest'

export default function ActsNotificationEmitterPublishTest() {

  describe('ActsNotificationEmitterPublishTest', () => {

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_0500
     * @tc.number Sub_Notification_Emitter_Publish_Emit_0500
     * @tc.desc   emitter.on 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0500', Level.LEVEL2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0500'
      let eventId01: emitter.InnerEvent = {
        eventId: 1
      };
      let callback01:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback01 success');
        expect().assertFail();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(eventId01, callback01);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off(1);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(eventId01);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
        done();
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_0600
     * @tc.number Sub_Notification_Emitter_Publish_Emit_0600
     * @tc.desc   emitter.once 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0600', Level.LEVEL2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0600'
      let eventId02: emitter.InnerEvent = {
        eventId: 2
      };
      let callback02:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(eventId02, callback02);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off(2, callback02);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(eventId02);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
        done();
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_0700
     * @tc.number Sub_Notification_Emitter_Publish_Emit_0700
     * @tc.desc   emitter.on 1   emitter.off 2   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0700', Level.LEVEL2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0700'
      let eventId03: emitter.InnerEvent = {
        eventId: 3
      };
      let callback03 = (): void => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' eventId03 on success');
        expect(true).assertTrue();
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(eventId03, callback03);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off(2);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(eventId03);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_0800
     * @tc.number Sub_Notification_Emitter_Publish_Emit_0800
     * @tc.desc   emitter.once 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_0800', Level.LEVEL2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0800'
      let eventId04: emitter.InnerEvent = {
        eventId: 4
      };
      let callback04 = (): void => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback04 success');
        expect(true).assertTrue();
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(eventId04, callback04);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off(2);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(eventId04);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })
  })
}