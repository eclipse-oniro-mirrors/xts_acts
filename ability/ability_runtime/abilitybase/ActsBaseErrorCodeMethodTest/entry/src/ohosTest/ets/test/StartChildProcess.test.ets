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
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0100
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0200
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0300
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0400
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0500
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0600
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0700
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0800
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0800
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_0900
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_0900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1000
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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


    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1100
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1200
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1300
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1300
     * @tc.desc   Test startChildProcess with path as empty string (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1300', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1300`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1400
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1400
     * @tc.desc   Test startChildProcess with path as empty string and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1400', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1400`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK, ()=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1500
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1500
     * @tc.desc   Test startChildProcess with path as empty string, mode as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1500', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1500`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('', null).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1600
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1600
     * @tc.desc   Test startChildProcess with path as empty string, mode as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1600', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1600`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('', undefined).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1700
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1700
     * @tc.desc   Test startChildProcess with path as null, mode as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1700', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1700`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(null, null).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1800
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1800
     * @tc.desc   Test startChildProcess with path as null, mode as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1800', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1800`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(null, undefined).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_1900
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_1900
     * @tc.desc   Test startChildProcess with path as undefined, mode as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_1900', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_1900`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess(undefined, null).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_2000
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_2000
     * @tc.desc   Test startChildProcess with all parameters as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_2000', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_2000`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(null, null, ()=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_2100
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_2100
     * @tc.desc   Test startChildProcess with path as empty string, mode as null, callback as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_2100', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_2100`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess('', null, ()=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_2300
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_2300
     * @tc.desc   Test startChildProcess with path as empty string, mode as APP_SPAWN_FORK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_2300', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_2300`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          await childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK).then((pid)=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_2400
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_2400
     * @tc.desc   Test startChildProcess with path as empty string, mode as APP_SPAWN_FORK with callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_2400', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_2400`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK, ()=>{
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_2200
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_2200
     * @tc.desc   Test startChildProcess with all parameters as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_2200', Level.LEVEL1, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_2200`;
      console.log(`${tag}, it begin`);
      if(mpEnable == 'true'){
        try {
          childProcessManager.startChildProcess(undefined, undefined, ()=>{
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