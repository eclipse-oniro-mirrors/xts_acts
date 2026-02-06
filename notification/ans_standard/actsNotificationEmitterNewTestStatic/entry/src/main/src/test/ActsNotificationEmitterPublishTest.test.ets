/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'Notification'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const TEST_SUITE_NAME = 'ActsEmitterPublishTest'

export default function ActsNotificationEmitterPublishTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("ActsNotificationEmitterPublishTest", (): void => {
    hilog.info(domain, TAG, '%{public}s', 'describe start');

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_Static_0500
     * @tc.number Sub_Notification_Emitter_Publish_Emit_Static_0500
     * @tc.desc   emitter.on 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0500'
      let eventId01: emitter.InnerEvent = {
        eventId: 1
      };
      let num : int = 0
      let callback01:Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback01 success');
        num++;
        expect(false).assertTrue();
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
        await Utils.msSleep(1000);
        expect(num == 0).assertTrue()
        done();
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_Static_0600
     * @tc.number Sub_Notification_Emitter_Publish_Emit_Static_0600
     * @tc.desc   emitter.once 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0600'
      let eventId02: emitter.InnerEvent = {
        eventId: 2
      };
      let num : int = 0
      let callback02: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback02 success');
        num++;
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
        await Utils.msSleep(1000);
        expect(num == 0).assertTrue()
        done();
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_Static_0700
     * @tc.number Sub_Notification_Emitter_Publish_Emit_Static_0700
     * @tc.desc   emitter.on 1   emitter.off 2   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_0700'
      let eventId03: string = '3';
      let num : int = 0
      let callback03 = (): void => {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' eventId03 on success');
        num++;
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.onEventData(eventId03, callback03);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off('2');
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try{
        emitter.emit(eventId03);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
        await Utils.msSleep(1000);
        expect(num == 1).assertTrue()
        done();
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   Sub_Notification_Emitter_Publish_Emit_Static_0800
     * @tc.number Sub_Notification_Emitter_Publish_Emit_Static_0800
     * @tc.desc   emitter.once 1   emitter.off 1   emitter.emit 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Publish_Emit_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Publish_Emit_Static_0800'
      let eventId04: string = '4';
      let num : int = 0
      let myDate: Record<String, RecordData> = {
        "id": "event4",
      }
      let data: emitter.EventData = { data: myDate }
      let callback04: Callback<emitter.EventData> = (eventData: emitter.EventData): void=> {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' callback04 success');
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on1 success is %{public}s '+JSON.stringify(eventData));
        let eventData_0: Record<String, RecordData> = eventData.data as Record<String, RecordData>
        let testId: String = eventData_0["id"] as String
        expect(testId).assertEqual("event4");
        num++;
      }
      try{
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.onceEventData(eventId04, callback04);
      }catch(err){
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback begin');
        emitter.off('2');
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'off callback success');
      } catch (err) {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ',
          JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      try {
        emitter.emit(eventId04,data);
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' emit event success');
        await Utils.msSleep(1000);
        expect(num == 1).assertTrue()
        done();
      } catch (err) {
        hilog.info(0x001, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ',
          JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })
  })
  hilog.info(domain, TAG, '%{public}s', 'ActsNotificationEmitterPublishTest end');
}