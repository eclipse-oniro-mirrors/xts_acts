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
import { application, sendableContextManager } from '@kit.AbilityKit';
import { SendableObject } from '../model/sendableObject';
import { BusinessError } from '@kit.BasicServicesKit';

export default function createModuleContextEventHubTest() {

  describe('createModuleContextEventHubTest', () => {
    let ctx: Context | undefined = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as Context;
    let event1: string = 'com.example.eventhubinterthreadtest.event1';
    let event2: string = 'com.example.eventhubinterthreadtest.event2';
    let moduleName: string = 'entry_test';
    let context: Context | undefined = undefined;
    let delay: number = 500;

    beforeAll((done: Function) => {
      application.createModuleContext(ctx, moduleName).then((data) => {
        context = data;
        hilog.info(0x0000, 'testTag', '%{public}s', `createModuleContext success: ${JSON.stringify(data)}`);
        done();
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createModuleContext failed. error:${JSON.stringify(error)}`);
        done();
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2900
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2900
     * @tc.desc   Test createModuleContext.eventHub.eventHub communicate when main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2900';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);

      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
          context?.eventHub.off(event1);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3000
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3000
     * @tc.desc   Test createModuleContext.eventHub.eventHub communicate when main thread subscribe event1(callback1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3000';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
        });
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
          context?.eventHub.off(event1);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3100
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3100
     * @tc.desc   Test createModuleContext.eventHub.eventHub communicate when worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3100';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        let emitData1: string = 'Context_main_emit_event1';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event1_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData1} event1_callback1 triggered`);
          expect(data).assertEqual(emitData1);
          context?.eventHub.off('event1_callback1');
          done();
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "on", "event1_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event1, emitData1);
        }, delay);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} end`);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3200
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3200
     * @tc.desc   Test createModuleContext.eventHub.eventHub communicate when worker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_3200';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/Worker.ets');
        let contextName: string = 'Context';
        let emitData2: string = 'Context_main_emit_event2';
        let result_event2_cb1: boolean = false;
        let result_event2_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event2_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event1_callback1 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event2_callback1');
          result_event2_cb1 = true;
          if ( result_event2_cb2 ) {
            done();
          }
        });
        context.eventHub.on('event2_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event1_callback2 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event2_callback2');
          result_event2_cb2 = true;
          if ( result_event2_cb1 ) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event2, "on", "event2_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event2, "on", "event2_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event2, emitData2);
        }, delay);
      }
    })
  })
}