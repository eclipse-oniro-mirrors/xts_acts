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

import { describe, afterEach, it, expect, TestType, Size, Level } from '../../../hypium/index';
import formInfo  from '@ohos.app.form.formInfo';
import formProvider from '@ohos.app.form.formProvider';
import { BusinessError } from '@ohos.base';

export default function OverflowApiCoverTest() {
  describe('OverflowApiCoverTest', () => {

    /**
     * @tc.name   RequestOverflow_Cover_Static_0100
     * @tc.number RequestOverflow_Cover_Static_0100
     * @tc.desc   Function RequestOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("RequestOverflow_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'RequestOverflow_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow('1').then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          console.info(`err: code is ${error.code}, message ${error.message}`);
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   RequestOverflow_Cover_Static_0200
     * @tc.number RequestOverflow_Cover_Static_0200
     * @tc.desc   Function RequestOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("RequestOverflow_Cover_Static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'RequestOverflow_Cover_Static_0200';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect('1');
        expect().not().assertFail();
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   CancelOverflow_Cover_Static_0100
     * @tc.number CancelOverflow_Cover_Static_0100
     * @tc.desc   Function CancelOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("CancelOverflow_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'CancelOverflow_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow('1').then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          console.info(`err: code is ${error.code}, message ${error.message}`);
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   ActivateSceneAnimation_Cover_Static_0100
     * @tc.number ActivateSceneAnimation_Cover_Static_0100
     * @tc.desc   Function ActivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ActivateSceneAnimation_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'ActivateSceneAnimation_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.activateSceneAnimation('1').then(() => {
          console.info('activateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   DeactivateSceneAnimation_Cover_Static_0100
     * @tc.number DeactivateSceneAnimation_Cover_Static_0100
     * @tc.desc   Function DeactivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("DeactivateSceneAnimation_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'DeactivateSceneAnimation_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.deactivateSceneAnimation('1').then(() => {
          console.info('deactivateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   GetFormRect_Cover_Static_0100
     * @tc.number GetFormRect_Cover_Static_0100
     * @tc.desc   Function GetFormRect covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("GetFormRect_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'GetFormRect_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect('1');
        expect().not().assertFail();
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
  })
}