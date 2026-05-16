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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from '@ohos/hypium'
import mindsporendk from 'libmindsporendk.so'
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import Utils from '../common/Utils';
import { BusinessError } from '@ohos.base';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_ERROR = 1;

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
export default function MindSporeStatusTest() {
  describe('MindSporeStatusTest', () => {
    beforeAll(async (done: Function) => {
      let context = getContext()
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + "lenet_train.ms";
        let ml_face_model_file1 = dir + "ml_face_isface.input";
        context.resourceManager.getRawFileContent("lenet_train.ms", (error, model_buffer) => {
          if (error) {
            console.log(
              `[rawfile_copy_to_sandbox] lenet_train.ms is
            copy failed:${error.code}, message: ${error.message}.`);
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] lenet_train.ms is copy success");
          }
        });
        context.resourceManager.getRawFileContent("ml_face_isface.input", (error, model_buffer) => {
          let file1 = fs.openSync(ml_face_model_file1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file1.fd, model_buffer.buffer);
          fs.closeSync(file1);
        });
      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }
      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      await Utils.sleep(500)
    });

    beforeEach(async () => {
      let dir = getContext().filesDir + "/";

      let ml_face_model = dir + "lenet_train.ms";
      let ml_face_model_input = dir + "ml_face_isface.input";
      await fs.stat(ml_face_model).then(async (res) => {
        if (res) {
          console.info("MindSporeDemo lenet_train.ms file exists");
          console.info(`MindSporeDemo lenet_train.ms size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo lenet_train.ms file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
      await Utils.sleep(500)
      await fs.stat(ml_face_model_input).then(async (res) => {
        if (res) {
          console.info("MindSporeDemo ml_face_isface.input file exists");
          console.info(`MindSporeDemo ml_face_isface.input size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo ml_face_isface.input file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
    })
    /**
     * @tc.name   testOH_AI_STATUS_LITE_PARAM_INVALID0100
     * @tc.number SUB_AI_MINDSPORE_OH_AI_STATUS_LITE_PARAM_INVALID_0100
     * @tc.desc   testing OH_AI_STATUS_LITE_PARAM_INVALID interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_AI_STATUS_LITE_PARAM_INVALID0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_STATUS_LITE_PARAM_INVALID0100 start====");
          let result: number = mindsporendk.StatusTest_002();
          console.info(`====>testOH_AI_STATUS_LITE_PARAM_INVALID0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_STATUS_LITE_PARAM_INVALID0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /**
     * @tc.name   testOH_AI_STATUS_LITE_UNINITIALIZED_OBJ0100
     * @tc.number SUB_AI_MINDSPORE_OH_AI_STATUS_LITE_UNINITIALIZED_OBJ_0100
     * @tc.desc   testing OH_AI_STATUS_LITE_UNINITIALIZED_OBJ interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOH_AI_STATUS_LITE_UNINITIALIZED_OBJ0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOH_AI_STATUS_LITE_UNINITIALIZED_OBJ0100 start====");
          let result: number = mindsporendk.StatusTest_008();
          console.info(`====>testOH_AI_STATUS_LITE_UNINITIALIZED_OBJ0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOH_AI_STATUS_LITE_UNINITIALIZED_OBJ0100 err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}