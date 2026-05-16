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

import { describe, beforeAll, it, expect, Level, beforeAll, afterEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let domain: int = 0x0000;
let tag: string = 'testTag';
let mpEnable = '';
const PARAM_INVALID = 401;

export default function StartChildProcessTestStatic() {
  describe("ChildProcessTestStatic", (): void => {

    beforeAll(async() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_static_0100
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_static_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_static_0100`;
      console.log(`${tag}, it begin`);
      if(mpEnable === 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            expect(pid > 0).assertTrue();
            done();
          }).catch((err: Error) => {
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else if(mpEnable === 'false'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err: Error) => {
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            expect(err?.code).assertEqual(16000061)
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_static_0200
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_static_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_static_0200`;
      console.log(`${tag}, it begin`);
      if(mpEnable === 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK, (err, data)=>{
            if(err?.code){
              console.log(`${tag} startChildProcess error, err: ${err?.code}`);
              try{expect().assertFail();}catch(e){}
              done();
            }else{
              let pid = data as int
              console.log(`${tag} startChildProcess success, pid: ${pid}`);
              expect(pid > 0).assertTrue();
              done();
            }
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else if(mpEnable === 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.SELF_FORK, (err, data)=>{
            if(err?.code){
              expect(err?.code).assertEqual(16000061)
              done();
            }else{
              try{expect().assertFail();}catch(e){}
              done();
            }
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_static_0300
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_static_0300
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_static_0300`;
      console.log(`${tag}, it begin`);
      if(mpEnable === 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err: Error) => {
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            expect(err?.code).assertEqual(16000050)
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else if(mpEnable === 'false'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK).then((pid)=>{
            console.log(`${tag} startChildProcess success, pid: ${pid}`);
            try{expect().assertFail();}catch(e){}
            done();
          }).catch((err: Error) => {
            console.log(`${tag} startChildProcess error, err: ${err?.code}`);
            expect(err?.code).assertEqual(16000061)
            done();
          });
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_startChildProcess_static_0400
     * @tc.number SUB_Ability_AbilityBase_startChildProcess_static_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityBase_startChildProcess_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_startChildProcess_static_0400`;
      console.log(`${tag}, it begin`);
      if(mpEnable === 'true'){
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK, (err, data)=>{
            if(err?.code){
              console.log(`${tag} startChildProcess error, err: ${err?.code}`);
              expect(err?.code).assertEqual(16000050)
              done();
            }else{
              try{expect().assertFail();}catch(e){}
              done();
            }
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else if(mpEnable === 'false'){
        console.error(`${tag} startChildProcess error, current device not support.`);
        try {
          childProcessManager.startChildProcess('', childProcessManager.StartMode.APP_SPAWN_FORK, (err, data)=>{
            if(err?.code){
              expect(err?.code).assertEqual(16000061)
              done();
            }else{
              try{expect().assertFail();}catch(e){}
              done();
            }
          })
        } catch (err) {
          console.error(`${tag} startChildProcess error, errorCode: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        }
      }else{
        console.error(`${tag} startChildProcess error, current device not set param value.`);
        expect().assertFail();
        done();
      }
    })
  });
}