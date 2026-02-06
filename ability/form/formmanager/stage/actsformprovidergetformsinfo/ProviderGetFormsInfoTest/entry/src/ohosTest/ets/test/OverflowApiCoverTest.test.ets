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

import { describe, afterEach, it, expect } from '@ohos/hypium';
import formInfo  from '@ohos.app.form.formInfo';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import formProvider from '@ohos.app.form.formProvider';
import { BusinessError } from '@kit.BasicServicesKit';

const INTERVAL_TIME = 2500;
const ERROR_CODE1 = 16500050;
const ERROR_CODE2 = 16500060;
const ERROR_CODE3 = 16500100;
const ERROR_CODE4 = 16501000;
const ERROR_CODE5 = 16501001;
const ERROR_CODE6 = 16501003;
const ERROR_CODE7 = 16501011;

export default function overflowApiCoverTest() {
  describe('OverflowApiCoverTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, INTERVAL_TIME);
    })

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_REQUEST_OVERFLOW_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_REQUEST_OVERFLOW_COVER_0100
     * @tc.desc   Function RequestOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_REQUEST_OVERFLOW_COVER_0100`, 0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_REQUEST_OVERFLOW_COVER_0100';
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
          if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else if (error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if (error.code === ERROR_CODE3) {
            expect(error.code).assertEqual(ERROR_CODE3);
          } else if (error.code === ERROR_CODE4) {
            expect(error.code).assertEqual(ERROR_CODE4);
          } else if (error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if (error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          } else if (error.code === ERROR_CODE7) {
            expect(error.code).assertEqual(ERROR_CODE7);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_CANCEL_OVERFLOW_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_CANCEL_OVERFLOW_COVER_0100
     * @tc.desc   Function CancelOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_CANCEL_OVERFLOW_COVER_0100`, 0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_CANCEL_OVERFLOW_COVER_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow("1").then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else if (error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if (error.code === ERROR_CODE3) {
            expect(error.code).assertEqual(ERROR_CODE3);
          } else if (error.code === ERROR_CODE4) {
            expect(error.code).assertEqual(ERROR_CODE4);
          } else if (error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if (error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          } else if (error.code === ERROR_CODE7) {
            expect(error.code).assertEqual(ERROR_CODE7);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_ACTIVATE_SCENE_ANIMATION_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_ACTIVATE_SCENE_ANIMATION_COVER_0100
     * @tc.desc   Function ActivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_ACTIVATE_SCENE_ANIMATION_COVER_0100`, 0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_ACTIVATE_SCENE_ANIMATION_COVER_0100';
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
 
    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_DEACTIVATE_SCENE_ANIMATION_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_DEACTIVATE_SCENE_ANIMATION_COVER_0100
     * @tc.desc   Function DeactivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_DEACTIVATE_SCENE_ANIMATION_COVER_0100`, 0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_DEACTIVATE_SCENE_ANIMATION_COVER_0100';
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

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_GET_FORM_RECT_COVER_0100
     * @tc.number SUB_ABILITY_FORM_FWK_GET_FORM_RECT_COVER_0100
     * @tc.desc   Function GetFormRect covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(`SUB_ABILITY_FORM_FWK_GET_FORM_RECT_COVER_0100`, 0, async (done:Function) => {
      let name: string = 'SUB_ABILITY_FORM_FWK_GET_FORM_RECT_COVER_0100';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect("1").then(() => {
          console.info('getFormRect succeed');
          expect().not().assertFail();
        }).catch((error: BusinessError) => {
          if (error.code === ERROR_CODE1) {
            expect(error.code).assertEqual(ERROR_CODE1);
          } else if (error.code === ERROR_CODE2) {
            expect(error.code).assertEqual(ERROR_CODE2);
          } else if (error.code === ERROR_CODE3) {
            expect(error.code).assertEqual(ERROR_CODE3);
          } else if (error.code === ERROR_CODE4) {
            expect(error.code).assertEqual(ERROR_CODE4);
          } else if (error.code === ERROR_CODE5) {
            expect(error.code).assertEqual(ERROR_CODE5);
          } else if (error.code === ERROR_CODE6) {
            expect(error.code).assertEqual(ERROR_CODE6);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
      console.info(`${name} end`);
      done();
    });
  })
}