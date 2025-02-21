/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio'
import request from "@ohos.request";
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadJSUnit() {
  describe('requestUploadJSUnit', function () {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function (done) {
      try {
        let pathDir = globalThis.abilityContext.cacheDir;
        let filePath = pathDir + `/test.txt`;
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024 *1024, 'h');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate');
        done();
      } catch (err) {
        console.info('====>beforeAll: text.txt file generate failed' + err);
        done();
      }
    })

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    /**
     * sleep function.
     */
    function sleep(date, time){
      while(Date.now() - date <= time);
    }

    let uploadTask;
    let RequestData = {
      name: 'name',
      value: '123'
    }

    let File = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }

    let uploadConfig = {
      url: 'http://127.0.0.1',
      header: {
        headers: 'http'
      },
      method: 'POST',
      files: [File],
      data: [RequestData]
    }; 
    
    /**
     * @tc.number    SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001 is starting-----------------------");
      try {
        request.uploadFile(globalThis.abilityContext, uploadConfig, (err, uploadTask)=>{
          console.info("====>SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001 uploadFile: " + uploadTask);
          try{
            expect(true).assertEqual(uploadTask != undefined);
          }catch(e){
            console.info("====>SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001 except error: " + e);
          }
        });
      } catch (err) {
        console.error("====>SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001 error: " + err);
      };
      let t = setTimeout(()=>{
        console.info("-----------------------SUB_REQUEST_uploadFile_STAGE_API_CALLBACK_0001 end-----------------------");
        clearTimeout(t);
        done();
      }, 10000);
    });

    /**
     * @tc.number    SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001
     * @tc.desc      Starts a upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 is starting-----------------------");
      try{
        request.uploadFile(globalThis.abilityContext, uploadConfig).then(uploadTask => {
          console.info("====>SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 uploadFile: " + uploadTask);
          try{
            expect(true).assertEqual(uploadTask != undefined);
          }catch(e){
            console.info("====>SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 except error: " + e);
          }
        }).catch(err => {
          console.error("====>SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 error: " + err);
          expect().assertFail();
        })
      }catch(err){
        console.error("====>SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 catch error: " + err);
      }
      let t = setTimeout(()=>{
        console.info("-----------------------SUB_REQUEST_uploadFile_STAGE_API_PROMISE_0001 end-----------------------");
        clearTimeout(t);
        done();
      }, 10000);
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_DELETE_0001
     * @tc.nme    SUB_REQUEST_UPLOAD_API_DELETE_0001
     * @tc.desc      Delete the upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_UPLOAD_API_DELETE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0001 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig, (err, uploadTask) => {
        try{
          console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 uploadTask: " + uploadTask);
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.delete((err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_UPLOAD_API_DELETE_0001 Failed to delete the uploadTask task.');
                expect().assertFail();
                done();
              }
              expect(typeof data == "boolean").assertTrue();
              console.info('====>SUB_REQUEST_UPLOAD_API_DELETE_0001 uploadTask task delete success.');
              done();
              console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0001 end-----------------------");
            }catch(err){
              console.error('====>SUB_REQUEST_UPLOAD_API_DELETE_0001 delete error' + err);
              done();
            }
          });
        } catch (error) {
          console.error('====>SUB_REQUEST_UPLOAD_API_DELETE_0001 delete catch error' + error);
          done();
        }        
      })      
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_DELETE_0002
     * @tc.name    SUB_REQUEST_UPLOAD_API_DELETE_0002
     * @tc.desc      Delete the upload task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_UPLOAD_API_DELETE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0002 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig, (err, uploadTask) => {
        console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0002 uploadTask: " + uploadTask);
        try{
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.delete().then(data => {
            console.info('====>SUB_REQUEST_UPLOAD_API_DELETE_0002 delete data:' + JSON.stringify(data));
            expect(data).assertEqual(true);
            done();
          }).catch((err) => {
            console.info('====>SUB_REQUEST_UPLOAD_API_DELETE_0002 Failed to delete the uploadTask task.');
            expect().assertFail();
            done();
          })
        }catch(err){
          console.error('====>SUB_REQUEST_UPLOAD_API_DELETE_0002 delete catch err');
          done();
        }     
      })
    });
  })
}
