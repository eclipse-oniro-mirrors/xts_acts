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

import { describe, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import formInfo  from '@ohos.app.form.formInfo';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import formProvider from '@ohos.app.form.formProvider';
import { BusinessError } from '@kit.BasicServicesKit';

const INTERVAL_TIME = 2500;

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');

export default function OverflowApiCoverTest() {
  describe('OverflowApiCoverTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /*
     * @tc.number  RequestOverflow_Cover_0100
     * @tc.name    RequestOverflow_Cover_0100
     * @tc.desc    Function RequestOverflow covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`RequestOverflow_Cover_0100`, 0, async (done:Function) => {
      let name: string = 'RequestOverflow_Cover_0100';
      console.info(`${name} start`);
      try {
        let rect: formInfo.Rect = {
            left: -30,
            top: -30,
            width: 200,
            height: 200
        };
        let overflowInfo: formInfo.OverflowInfo = {
          area: rect,
          duration: 3500,
          useDefaultAnimation: true
        };
        formProvider.requestOverflow("1", overflowInfo).then(() => {
          console.info('requestOverflow succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
 
    /*
     * @tc.number  CancelOverflow_Cover_0100
     * @tc.name    CancelOverflow_Cover_0100
     * @tc.desc    Function CancelOverflow covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`CancelOverflow_Cover_0100`, 0, async (done:Function) => {
      let name: string = 'CancelOverflow_Cover_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow("1").then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
 
    /*
     * @tc.number  ActivateSceneAnimation_Cover_0100
     * @tc.name    ActivateSceneAnimation_Cover_0100
     * @tc.desc    Function ActivateSceneAnimation covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`ActivateSceneAnimation_Cover_0100`, 0, async (done:Function) => {
      let name: string = 'ActivateSceneAnimation_Cover_0100';
      console.info(`${name} start`);
      try {
        formProvider.activateSceneAnimation("1").then(() => {
          console.info('activateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
 
    /*
     * @tc.number  DeactivateSceneAnimation_Cover_0100
     * @tc.name    DeactivateSceneAnimation_Cover_0100
     * @tc.desc    Function DeactivateSceneAnimation covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`DeactivateSceneAnimation_Cover_0100`, 0, async (done:Function) => {
      let name: string = 'DeactivateSceneAnimation_Cover_0100';
      console.info(`${name} start`);
      try {
        formProvider.deactivateSceneAnimation("1").then(() => {
          console.info('deactivateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });

    /*
     * @tc.number  GetFormRect_Cover_0100
     * @tc.name    GetFormRect_Cover_0100
     * @tc.desc    Function GetFormRect covered test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level   Level 1
     */
    it(`GetFormRect_Cover_0100`, 0, async (done:Function) => {
      let name: string = 'GetFormRect_Cover_0100';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect("1").then(() => {
          console.info('getFormRect succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
  })
}