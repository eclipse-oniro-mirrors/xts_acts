/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import sendableContextManager from '@ohos.app.ability.sendableContextManager';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import { worker, MessageEvents } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { SendableContextObject, ApplicationContextObject, AbilityStageObject, ContextObject, UIAbilityContextObject } from '../common/SendableContextObject'
import contextConstant from '@ohos.app.ability.contextConstant';
let sendableContext: sendableContextManager.SendableContext

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let testUIAbilityContext:common.UIAbilityContext;
let testAbilityStageContext:common.AbilityStageContext;
let testApplicationContext:common.ApplicationContext;

function sleep(s: number): Promise<void> {
  return new Promise((resolve, reject) => {
    setTimeout(resolve, s);
  })
}
@Concurrent
function returnUIAbilityContext(object: UIAbilityContextObject): common.UIAbilityContext {
  hilog.info(0x0000, 'testTag',  object.contextName + ' taskpool1 print: %{public}s ', JSON.stringify(object.sendableContext.cacheDir));
  return object.sendableContext;
}
@Concurrent
function returnApplicationContext(object: ApplicationContextObject): common.ApplicationContext {
  hilog.info(0x0000, 'testTag', object.contextName + ' taskpool1 print: %{public}s ', JSON.stringify(object.sendableContext.cacheDir));
  return object.sendableContext;
}
@Concurrent
function returnAbilityStageContext(object: AbilityStageObject): common.AbilityStageContext {
  hilog.info(0x0000, 'testTag', object.contextName + ' taskpool1 print: %{public}s ', JSON.stringify(object.sendableContext.cacheDir));
  return object.sendableContext;
}
@Concurrent
function returnContext(object: ContextObject): common.Context {
  hilog.info(0x0000, 'testTag', object.contextName + ' taskpool1 print: %{public}s ', JSON.stringify(object.sendableContext.cacheDir));
  return object.sendableContext;
}
@Concurrent
function returnUIAbilityContext2(object: common.UIAbilityContext):string{
  hilog.info(0x0000, 'testTag', 'returnUIAbilityContext2 taskpool2 print: %{public}s ', JSON.stringify(object.cacheDir));
  return object.cacheDir;
}
@Concurrent
function returnApplicationContext2(object: common.ApplicationContext): string {
  hilog.info(0x0000, 'testTag','returnApplicationContext2 taskpool2 print: %{public}s ', JSON.stringify(object.cacheDir));
  return object.cacheDir;
}
@Concurrent
function returnAbilityStageContext2(object: common.AbilityStageContext): string {
  hilog.info(0x0000, 'testTag', 'returnAbilityStageContext2 taskpool2 print: %{public}s ', JSON.stringify(object.cacheDir));
  return object.cacheDir;
}
@Concurrent
function returnContext2(object: common.Context): string {
  hilog.info(0x0000, 'testTag', 'returnContext2 taskpool2 print: %{public}s ', JSON.stringify(object.cacheDir));
  return object.cacheDir;
}
export default function sendableContextTest() {
  describe('SendableContextStageWorker', () => {
    beforeAll(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll SendableContextTest beforeAll called');
      await sleep(1);
      testUIAbilityContext = AppStorage.get('TestAbilityContext') as common.UIAbilityContext;
      testAbilityStageContext = AppStorage.get('TestAbilityStageContext') as common.AbilityStageContext;
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll AbilityStage get result ' + JSON.stringify(testAbilityStageContext));
      testApplicationContext = application.getApplicationContext();
      hilog.info(0x0000, 'testTag', '%{public}s', 'beforeAll application get result ' + JSON.stringify(testApplicationContext));
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest beforeEach called');
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest afterEach called');
    })

    afterAll(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'SendableContextTest afterAll called');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1100
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1100
     * @tc.desc   UIAbilityContext is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1100', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1100:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1100 begin');
      let transUIAbilityContext:common.UIAbilityContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testUIAbilityContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1100');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transUIAbilityContext = event.data.value;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
        Worker1.terminate();
      }
      Worker1.postMessageWithSharedSendable(transContext);
      hilog.info(0x0000, 'testTag', TAG + 'start wait for woker1 done ' + isWoker1Done);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      hilog.info(0x0000, 'testTag', TAG + 'wait for woker1 done ' + isWoker1Done);
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      hilog.info(0x0000, 'testTag', TAG + '  create Worker2 success');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transUIAbilityContext == undefined){
        hilog.info(0x0000, 'testTag', TAG + 'transUIAbilityContext == undefined');
        expect().assertFail();
        done();
        return;
      }else{
        hilog.info(0x0000, 'testTag', TAG + 'transUIAbilityContext success');
        let transContext2: UIAbilityContextObject = new UIAbilityContextObject(transUIAbilityContext as common.UIAbilityContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1100');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1200
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1200
     * @tc.desc   ApplicationContext is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1200', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1200:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1200 begin');
      let transApplicaitonContext:common.ApplicationContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testApplicationContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1200');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message ApplicationContext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transApplicaitonContext = event.data.value  as common.ApplicationContext;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el4/base/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transApplicaitonContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ApplicationContextObject = new ApplicationContextObject(transApplicaitonContext as common.ApplicationContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1200');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1300
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1300
     * @tc.desc   AbilityStageContext is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1300', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1300:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1100 begin');
      let transAbilityStageContext:common.AbilityStageContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testAbilityStageContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1300');
      if(sendableContext == undefined || transContext == undefined){
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'sendableContext == undefined || transContext == undefined');
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + '[WorkerTrans1] fail');
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transAbilityStageContext = event.data.value as common.AbilityStageContext;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + '[WorkerTrans2] fail');
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transAbilityStageContext == undefined){
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'transAbilityStageContext == undefined');
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: AbilityStageObject = new AbilityStageObject(transAbilityStageContext as common.AbilityStageContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1300');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1400
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1400
     * @tc.desc   Context(createModuleContext) is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1400', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1400:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1400 begin');
      let transModuleContext:common.Context|undefined = undefined;
      let moduleContext : common.Context|undefined = undefined;
      await application.createModuleContext(testUIAbilityContext, 'entry_test').then((data)=>{
        moduleContext = data;
      });
      let isWoker1Done:Boolean = false;
      if(moduleContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(moduleContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1400');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transModuleContext = event.data.value as common.Context;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el2/base/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ContextObject = new ContextObject(transModuleContext as common.Context, 'SUB_Ability_AbilityRuntime_Worker_Stage_1400');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1500
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1500
     * @tc.desc   Context(from uiability) is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1500', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1500:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1500 begin');
      let transToContext:common.Context|undefined = undefined;
      let asContext : common.Context = AppStorage.get('TestAbilityContext') as common.Context;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(asContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1500');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transToContext = event.data.value as common.Context;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transToContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ContextObject = new ContextObject(transToContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1500');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1700
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1700
     * @tc.desc   Context(transAreaModeContext) is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1700', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1700:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1700 begin');
      let transAreaModeContext:common.Context|undefined = undefined;
      let areaMode: contextConstant.AreaMode = contextConstant.AreaMode.EL4;
      let areaModeContext : common.Context = testUIAbilityContext.createAreaModeContext(areaMode);
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(areaModeContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1700');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transAreaModeContext = event.data.value as common.Context;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el4/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transAreaModeContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ContextObject = new ContextObject(transAreaModeContext as common.Context, 'SUB_Ability_AbilityRuntime_Worker_Stage_1700');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1800
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1800
     * @tc.desc   Context(createDisplayContext) is converted to sendableContext to pass the destruction and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1800', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1800:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1800 begin');
      let transDisplayContext:common.Context|undefined = undefined;
      let displayContext : common.Context = testUIAbilityContext.createDisplayContext(0);
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(displayContext);
      let transContext: SendableContextObject = new SendableContextObject(sendableContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1800');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transDisplayContext = event.data.value as common.Context;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transDisplayContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ContextObject = new ContextObject(transDisplayContext as common.Context, 'SUB_Ability_AbilityRuntime_Worker_Stage_1800');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_1900
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_1900
     * @tc.desc   UIAbilityContext is passed to destroy and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_1900', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_1900:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_1900 begin');
      let transUIAbilityContext:common.UIAbilityContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testUIAbilityContext);
      let contextAfter: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(sendableContext);
      let transContext: UIAbilityContextObject = new UIAbilityContextObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_1900');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans3.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transUIAbilityContext = event.data.value;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
        Worker1.terminate();
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext start');
      Worker1.postMessageWithSharedSendable(transContext);
      hilog.info(0x0000, 'testTag', TAG + 'start wait for woker1 done ' + isWoker1Done);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      hilog.info(0x0000, 'testTag', TAG + 'wait for woker1 done ' + isWoker1Done);
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      hilog.info(0x0000, 'testTag', TAG + '  create Worker2 success');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transUIAbilityContext == undefined){
        hilog.info(0x0000, 'testTag', TAG + 'transUIAbilityContext == undefined');
        expect().assertFail();
        done();
        return;
      }else{
        hilog.info(0x0000, 'testTag', TAG + 'transUIAbilityContext success');
        let transContext2: UIAbilityContextObject = new UIAbilityContextObject(transUIAbilityContext as common.UIAbilityContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_1100');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_2000
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_2000
     * @tc.desc   ApplicationContext is passed to destroy and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_2000', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_2000:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_2000 begin');
      let transApplicaitonContext:common.ApplicationContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let transContext: ApplicationContextObject = new ApplicationContextObject(testApplicationContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_2000');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message ApplicationContext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans3.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transApplicaitonContext = event.data.value  as common.ApplicationContext;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el4/base/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transApplicaitonContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ApplicationContextObject = new ApplicationContextObject(transApplicaitonContext as common.ApplicationContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_2000');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_2700
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_2700
     * @tc.desc   AbilityStageContext is passed to destroy and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_2700', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_2700:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_2700 begin');
      let transAbilityStageContext:common.AbilityStageContext|undefined = undefined;
      let isWoker1Done:Boolean = false;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testAbilityStageContext);
      let contextAfter: common.AbilityStageContext = sendableContextManager.convertToAbilityStageContext(sendableContext);
      let transContext: AbilityStageObject = new AbilityStageObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_2700');
      if(transContext == undefined){
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'sendableContext == undefined || transContext == undefined');
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message testAbilityStageContext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans3.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + '[WorkerTrans1] fail');
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transAbilityStageContext = event.data.value as common.AbilityStageContext;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message testAbilityStageContext start');
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          hilog.info(0x0000, 'testTag', '%{public}s', TAG + '[WorkerTrans2] fail');
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el3/base/haps/entry_test/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transAbilityStageContext == undefined){
        hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'transAbilityStageContext == undefined');
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: AbilityStageObject = new AbilityStageObject(transAbilityStageContext as common.AbilityStageContext, 'SUB_Ability_AbilityRuntime_Worker_Stage_2700');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_2100
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_2100
     * @tc.desc   Context is passed to destroy and use between different worker threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_2100', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_2100:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_2100 begin');
      let transModuleContext:common.Context|undefined = undefined;
      let moduleContext : common.Context|undefined = undefined;
      await application.createModuleContext(testUIAbilityContext, 'entry_test').then((data)=>{
        moduleContext = data;
      });
      let isWoker1Done:Boolean = false;
      if(moduleContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(moduleContext);
      let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);
      let transContext: ContextObject = new ContextObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_2100');
      if(sendableContext == undefined || transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      let Worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans3.ets');
      Worker1.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        if(key == '[WorkerTrans1] fail'){
          try{expect().assertFail();}catch{};
          done();
          return;
        }
        transModuleContext = event.data.value as common.Context;
        isWoker1Done = true;
        hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans1 Ability onmessage get success ' + isWoker1Done);
      }
      Worker1.postMessageWithSharedSendable(transContext);
      await sleep(1000);
      while(!isWoker1Done){
        await sleep(1000); //等待worker1将Context传回主线程
      }
      Worker1.terminate();
      let Worker2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/WorkerTrans2.ets');
      Worker2.onmessage = (event: MessageEvents): void => {
        let key: string = event.data.key;
        let value: string = event.data.value;
        if(key == '[WorkerTrans2] fail'){
          try{expect().assertFail();}catch{};
          Worker2.terminate();
          done();
          return;
        }
        try{
          expect(event.data.value).assertEqual('/data/storage/el2/base/cache');
        }catch{
          hilog.info(0x0000, 'testTag', TAG + 'WorkerTrans2: fail');
        }
        Worker2.terminate();
        done();
        hilog.info(0x0000, 'testTag', TAG + 'Ability onmessage key: %{public}s, value: %{public}s', key, value);
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        let transContext2: ContextObject = new ContextObject(transModuleContext as common.Context, 'SUB_Ability_AbilityRuntime_Worker_Stage_2100');
        Worker2.postMessageWithSharedSendable(transContext2);
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_3500
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_3500
     * @tc.desc   UIAbilityContext is passed to destroy and use between different taskpool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_3500', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_3500:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_3500 begin');
      let transModuleContext:common.UIAbilityContext|undefined = undefined;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testUIAbilityContext);
      let contextAfter: common.UIAbilityContext = sendableContextManager.convertToUIAbilityContext(sendableContext);
      let transContext: UIAbilityContextObject = new UIAbilityContextObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_2100');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      try {
        let task1: taskpool.Task = new taskpool.Task(returnUIAbilityContext, transContext);
        await taskpool.execute(task1).then((value: Object) => {
          hilog.info(0x0000, 'testTag', TAG + 'taskpool result: %{public}s ', JSON.stringify(value));
          transModuleContext = value as common.UIAbilityContext;
        });
        await sleep(1000);
        taskpool.cancel(task1);
      } catch (error) {
        hilog.error(0x0000, 'testTag', TAG + 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        await taskpool.execute(returnUIAbilityContext2, transModuleContext).then((value: Object) => {
          hilog.info(0x0000, 'testTag', TAG + 'taskpool2 result: %{public}s ', JSON.stringify(value));
          try{expect(value as string).assertEqual('/data/storage/el3/base/haps/entry_test/cache');}catch{};
          done();
        });
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_3200
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_3200
     * @tc.desc   ApplicationContext is passed to destroy and use between different taskpool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_3200', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_3200:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_3200 begin');
      let transModuleContext:common.ApplicationContext|undefined = undefined;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testApplicationContext);
      let contextAfter: common.ApplicationContext = sendableContextManager.convertToApplicationContext(sendableContext);
      let transContext: ApplicationContextObject = new ApplicationContextObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_3200');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      try {
        let task1: taskpool.Task = new taskpool.Task(returnApplicationContext, transContext);
        await taskpool.execute(task1).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          transModuleContext = value as common.ApplicationContext;
        });
        await sleep(1000);
        taskpool.cancel(task1);
      } catch (error) {
        hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        await taskpool.execute(returnApplicationContext2, transModuleContext).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          try{expect(value as string).assertEqual('/data/storage/el4/base/cache');}catch{};
          done();
        });
      }
    })

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_3100
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_3100
     * @tc.desc   AbilityStageContext is passed to destroy and use between different taskpool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_3100', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_3100:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_3100 begin');
      let transModuleContext:common.AbilityStageContext|undefined = undefined;
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(testAbilityStageContext);
      let contextAfter: common.AbilityStageContext = sendableContextManager.convertToAbilityStageContext(sendableContext);
      let transContext: AbilityStageObject = new AbilityStageObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_3100');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      try {
        let task1: taskpool.Task = new taskpool.Task(returnAbilityStageContext, transContext);
        await taskpool.execute(task1).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          transModuleContext = value as common.AbilityStageContext;
        });
        await sleep(1000);
        taskpool.cancel(task1);
      } catch (error) {
        hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        await taskpool.execute(returnAbilityStageContext2, transModuleContext).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          try{expect(value as string).assertEqual('/data/storage/el3/base/haps/entry_test/cache');}catch{};
          done();
        });
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_Worker_Stage_3300
     * @tc.number SUB_Ability_AbilityRuntime_Worker_Stage_3300
     * @tc.desc   Context is passed to destroy and use between different taskpool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_Worker_Stage_3300', Level.LEVEL0, async (done:Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_Worker_Stage_3300:';
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_Ability_AbilityRuntime_Worker_Stage_3300 begin');
      let transModuleContext:common.Context|undefined = undefined;
      let moduleContext : common.Context|undefined = undefined;
      await application.createModuleContext(testUIAbilityContext, 'entry_test').then((data)=>{
        moduleContext = data;
      });
      if(moduleContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(moduleContext);
      let contextAfter: common.Context = sendableContextManager.convertToContext(sendableContext);
      let transContext: ContextObject = new ContextObject(contextAfter, 'SUB_Ability_AbilityRuntime_Worker_Stage_3300');
      if(transContext == undefined){
        expect().assertFail();
        done();
        return;
      }
      hilog.info(0x0000, 'testTag', '%{public}s', TAG + 'Ability post message uiabilitycontext');
      try {
        let task1: taskpool.Task = new taskpool.Task(returnContext, transContext);
        await taskpool.execute(task1).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          transModuleContext = value as common.Context;
        });
        await sleep(1000);
        taskpool.cancel(task1);
      } catch (error) {
        hilog.error(0x0000, 'testTag', 'Ability convertFromContext failed %{public}s', JSON.stringify(error));
      }
      if(transModuleContext == undefined){
        expect().assertFail();
        done();
        return;
      }else{
        await taskpool.execute(returnContext2, transModuleContext).then((value: Object) => {
          hilog.info(0x0000, 'testTag', 'taskpool result: %{public}s ', JSON.stringify(value));
          try{expect(value as string).assertEqual('/data/storage/el2/base/cache');}catch{};
          done();
        });
      }
    })

  })
}