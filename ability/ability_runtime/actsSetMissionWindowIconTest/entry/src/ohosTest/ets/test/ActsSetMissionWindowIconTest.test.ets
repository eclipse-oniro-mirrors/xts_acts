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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll,it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
let context: common.UIAbilityContext;

export default function ActsSetMissionWindowIconTest() {
  describe('ActsSetMissionWindowIconTest', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100
    * @tc.desc test setMissionWindowIcon success
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it("SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_0100';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      let imagePixelMap: image.PixelMap;
      let color = new ArrayBuffer(50 * 50 * 4);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 0;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 255;
      }
      image.createPixelMap(color, {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 50, width: 50 }
      }).then((data) => {
        imagePixelMap = data;
        context.setMissionWindowIcon(imagePixelMap)
          .then((idata) => {
            expect(idata).assertEqual(undefined);
            console.info('setMissionWindowIcon succeed');
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`setMissionWindowIcon failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(801);
            done();
          });
      }).catch((err: BusinessError) => {
        console.error(`createPixelMap failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      });
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_0200
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_0200
    * @tc.desc test null to the setMissionWindowIcon interface results in a 401 error code
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it("SUB_Ability_AbilityRuntime_setMissionWindowIcon_0200", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_0200';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      try{
        context.setMissionWindowIcon(null);
        console.info('setMissionWindowIcon succeed');
        expect().assertFail();
        done();
      }catch(err){
        console.error(`setMissionWindowIcon failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    })

    /** 
    * @tc.number SUB_Ability_AbilityRuntime_setMissionWindowIcon_0300
    * @tc.name SUB_Ability_AbilityRuntime_setMissionWindowIcon_0300
    * @tc.desc test undefined to the setMissionWindowIcon interface results in a 401 error code
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 0
    */
    it("SUB_Ability_AbilityRuntime_setMissionWindowIcon_0300", Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME: string = 'SUB_Ability_AbilityRuntime_setMissionWindowIcon_0300';
      hilog.info(0x0000, TEST_CASE_NAME, `start`);
      try{
        context.setMissionWindowIcon(undefined);
        console.info('setMissionWindowIcon succeed');
        expect().assertFail();
        done();
      }catch(err){
        console.error(`setMissionWindowIcon failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    })
  })
}