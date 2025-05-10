/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { childProcessManager } from '@kit.AbilityKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
let mpEnable: string;
const PARAM_INVALID = 401;
export default function ndkTest() {
  describe('ChildProcessTest', () => {
    beforeAll(() => {
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0100
     * @tc.name   : To verify that the input parameter startMode of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0100`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('./ets/process/AProcess.ts', undefined).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err:BusinessError)=>{
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0200
     * @tc.name   : To verify that the input parameter startMode of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0200`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess('./ets/process/AProcess.ts', undefined, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }

    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0300
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0300', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0300`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(undefined, childProcessManager.StartMode.SELF_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err:BusinessError)=>{
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0400
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0400`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(undefined, childProcessManager.StartMode.SELF_FORK, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }

    });


    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0500
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0500', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0500`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(undefined, childProcessManager.StartMode.APP_SPAWN_FORK)
            .then((pid)=>{
              console.log(`${tag} startChildProcess success, pid: ${pid}`);
              try{expect().assertFail();}catch(e){}
              done();
            }).catch((err:BusinessError)=>{
              console.log(`${tag} startChildProcess error, err: ${err?.code}`);
              try{expect().assertFail();}catch(e){}
              done();
            });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0600
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0600`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(undefined, childProcessManager.StartMode.APP_SPAWN_FORK, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0700
     * @tc.name   : To verify that the input parameter startMode of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0700`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('./ets/process/AProcess.ts', null).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err:BusinessError)=>{
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0800
     * @tc.name   : To verify that the input parameter startMode of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0800', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0800`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess('./ets/process/AProcess.ts', null, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }

    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_0900
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_0900`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(null, childProcessManager.StartMode.SELF_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err:BusinessError)=>{
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_1000
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1000', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1000`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(null, childProcessManager.StartMode.SELF_FORK, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }

    });


    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_1100
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1100`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(null, childProcessManager.StartMode.APP_SPAWN_FORK)
            .then((pid)=>{
              console.log(`${tag} startChildProcess success, pid: ${pid}`);
              try{expect().assertFail();}catch(e){}
              done();
            }).catch((err:BusinessError)=>{
              console.log(`${tag} startChildProcess error, err: ${err?.code}`);
              try{expect().assertFail();}catch(e){}
              done();
            });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_startChildProcess_1200
     * @tc.name   : To verify that the input parameter srcEntry of startChildProcess is undefined(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1200`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(null, childProcessManager.StartMode.APP_SPAWN_FORK, ()=>{
            try{expect().assertFail();}catch(e){}
            done();
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          expect(err?.code).assertEqual(PARAM_INVALID)
          done();
        }
      }else if(mpEnable == 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        done();
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    });
  })
}