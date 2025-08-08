/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { worker } from '@kit.ArkTS';
import { sendableContextManager, contextConstant } from '@kit.AbilityKit';
import { SendableObject } from '../model/sendableObject';

export default function createAreaModeContextEventHubTest() {

  describe('createAreaModeContextEventHubTest', () => {
    let ctx: Context | undefined = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as Context;
    let context: Context | undefined = undefined;
    let event3: string = 'com.example.eventhubinterthreadtest.event3';
    let event4: string = 'com.example.eventhubinterthreadtest.event4';
    let delay: number = 500;

    beforeAll(() => {
      let msg: string;
      try {
        context = ctx?.createAreaModeContext(contextConstant.AreaMode.EL1);
        msg = `createAreaModeContext success: ${JSON.stringify(context)}`;
      } catch (error) {
        msg = `createAreaModeContext failed. error:${JSON.stringify(error)}`;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', msg);
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3300
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3300
     * @tc.desc: Test createAreaModeContext.eventHub.eventHub communicate when main thread 
     *   subscribe event3(callback1) and worker trigger event3.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3300';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event3, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event3 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event3}`);
          context?.eventHub.off(event3);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event3, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3400
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3400
     * @tc.desc: Test createAreaModeContext.eventHub.eventHub communicate when main thread subscribe event3(callback1) 
     *   and event3(callback2) and worker trigger event3.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3400';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event3, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event3 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event3}`);
        });
        context.eventHub.on(event3, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event3 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event3}`);
          context?.eventHub.off(event3);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event3, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3500
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3500
     * @tc.desc: Test createAreaModeContext.eventHub.eventHub communicate when worker
     *   subscribe event3(callback1) and main thread trigger event3.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3500';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        let emitData1: string = 'Context_main_emit_event3';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event3_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData1} event3_callback1 triggered`);
          expect(data).assertEqual(emitData1);
          context?.eventHub.off('event3_callback1');
          done();
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event3, "on", "event3_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event3, emitData1);
        }, delay);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} end`);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3600
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3600
     * @tc.desc: Test createAreaModeContext.eventHub.eventHub communicate when worker
     *   subscribe event3(callback1) and event3(callback2) and main thread trigger event3.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3600';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        let emitData2: string = 'Context_main_emit_event4';
        let result_event4_cb1: boolean = false;
        let result_event4_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event4_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event3_callback1 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event4_callback1');
          result_event4_cb1 = true;
          if ( result_event4_cb2 ) {
            done();
          }
        });
        context.eventHub.on('event4_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event3_callback2 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event4_callback2');
          result_event4_cb2 = true;
          if ( result_event4_cb1 ) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event4, "on", "event4_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event4, "on", "event4_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event4, emitData2);
        }, delay);
      }
    })
  })
}