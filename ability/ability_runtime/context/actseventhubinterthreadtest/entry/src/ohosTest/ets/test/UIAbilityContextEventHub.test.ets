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
import { sendableContextManager } from '@kit.AbilityKit';
import { SendableObject } from '../model/sendableObject';

export default function UIAbilityContextEventHubTest() {

  describe('UIAbilityContextEventHubTest', () => {
    let context: Context | undefined = AppStorage.get<common.UIAbilityContext>('testAbilityContext');
    let event9: string = 'com.example.eventhubinterthreadtest.event9';
    let event10: string = 'com.example.eventhubinterthreadtest.event10';
    let event11: string = 'com.example.eventhubinterthreadtest.event11';
    let event12: string = 'com.example.eventhubinterthreadtest.event12';
    let delay: number = 500;

    beforeEach((done: Function) => {
      setTimeout(() => {
        done();
      }, 200);
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1900
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1900
     * @tc.desc   Test UIAbilityContext.eventHub communicate when main thread subscribe event9(callback1) and worker trigger event9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1900';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event9, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event9}`);
          context?.eventHub.off(event9);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event9, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2000
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2000
     * @tc.desc   Test UIAbilityContext.eventHub communicate when main thread subscribe event9(callback1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2000';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event9, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event9}`);
        });
        context.eventHub.on(event9, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event9}`);
          context?.eventHub.off(event9);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event9, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2100
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2100
     * @tc.desc   Test UIAbilityContext.eventHub communicate when main thread subscribe event9(callback1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2100';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event9, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event9}`);
        });
        context.eventHub.on(event9, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event9}`);
          context?.eventHub.off(event9);
        });
        context.eventHub.on(event10, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event10 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event10}`);
        });
        context.eventHub.on(event10, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event10 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event10}`);
          context?.eventHub.off(event10);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event9, "emit");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event10, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2200
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2200
     * @tc.desc   Test UIAbilityContext.eventHub communicate when worker subscribe event9(callback1) and main thread trigger event9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2200';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        let emitData1: string = 'Context_main_emit_event9';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event9_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData1} event9_callback1 triggered`);
          expect(data).assertEqual(emitData1);
          context?.eventHub.off('event9_callback1');
          done();
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event9, "on", "event9_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event9, emitData1);
        }, delay);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} end`);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2300
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2300
     * @tc.desc   Test UIAbilityContext.eventHub communicate when worker subscribe event9(callback1) and event9(callback2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2300';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        let emitData2: string = 'Context_main_emit_event10';
        let result_event10_cb1: boolean = false;
        let result_event10_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event10_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event9_callback1 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event10_callback1');
          result_event10_cb1 = true;
          if ( result_event10_cb2 ) {
            done();
          }
        });
        context.eventHub.on('event10_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event9_callback2 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event10_callback2');
          result_event10_cb2 = true;
          if ( result_event10_cb1 ) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event10, "on", "event10_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event10, "on", "event10_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event10, emitData2);
        }, delay);
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2400
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2400
     * @tc.desc   Test UIAbilityContext.eventHub communicate when worker subscribe event9(callback1) and event9(callback2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_2400';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        let emitData3: string = 'Context_main_emit_event11';
        let emitData4: string = 'Context_main_emit_event12';
        let result_event11_cb1: boolean = false;
        let result_event11_cb2: boolean = false;
        let result_event12_cb1: boolean = false;
        let result_event12_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event11_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData3} event11_callback1 triggered`);
          expect(data).assertEqual(emitData3);
          context?.eventHub.off('event11_callback1');
          result_event11_cb1 = true;
          if ( result_event12_cb1 && result_event12_cb2 && result_event11_cb2) {
            done();
          }
        });
        context.eventHub.on('event11_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData3} event11_callback2 triggered`);
          expect(data).assertEqual(emitData3);
          context?.eventHub.off('event11_callback2');
          result_event11_cb2 = true;
          if ( result_event12_cb1 && result_event12_cb2 && result_event11_cb1) {
            done();
          }
        });

        context.eventHub.on('event12_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData4} event12_callback1 triggered`);
          expect(data).assertEqual(emitData4);
          context?.eventHub.off('event12_callback1');
          result_event12_cb1 = true;
          if ( result_event12_cb2 && result_event11_cb1 && result_event11_cb2) {
            done();
          }
        });
        context.eventHub.on('event12_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData4} event12_callback2 triggered`);
          expect(data).assertEqual(emitData4);
          context?.eventHub.off('event12_callback1');
          result_event12_cb2 = true;
          if ( result_event12_cb1 && result_event11_cb1 && result_event11_cb2) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event11, "on", "event11_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event11, "on", "event11_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event12, "on", "event12_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event12, "on", "event12_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event11, emitData3);
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event11 triggered`);
          context?.eventHub.emit(event12, emitData4);
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event12 triggered`);
        }, delay);
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4800
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4800
     * @tc.desc   Test Context.eventHub communicate after convert between Context and SendableContext twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4800';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event4800', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event4800 callback1 called`);
          expect(data).assertEqual(`ctx2_emit_event4800`);
          context?.eventHub.off('event4800');
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let ctx: Context = sendableContextManager.convertToContext(sendableContext);
        sendableContext = sendableContextManager.convertFromContext(ctx);
        let ctx2: Context = sendableContextManager.convertToContext(sendableContext);

        sendableContextManager.setEventHubMultithreadingEnabled(ctx2, true);
        ctx2.eventHub.emit('event4800', `ctx2_emit_event4800`);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ctx2 emit event1`);
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_5100
     * @tc.number SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_5100
     * @tc.desc   Test Context.eventHub communicate after convert between Context and SendableContext twice.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_5100';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect().assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/UIAbilityWorker.ets');
        let contextName: string = 'UIAbilityContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event9100', (data1: string, data2: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event9100 callback1 called`);
          expect(data1).assertEqual(`data1`);
          expect(data2).assertEqual(`data2`);
          context?.eventHub.off('event9100');
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, 'event9100', "emit_multi_data");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
  })
}