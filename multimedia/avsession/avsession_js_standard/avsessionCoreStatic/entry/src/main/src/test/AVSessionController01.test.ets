/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
  describe('AVSessionControllerTest01', () => {
    let TAG: string = "[AVSessionControllerTest]";
    let session: avSession.AVSession | null = null;
    let controller: avSession.AVSessionController | undefined;
    let tag: string = 'AVSessionCoreXTS';
    let customData: Record<string,Object> = {'customData': 'appdata'}

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context!, tag, 'voice_call').then((data) => {
        session = data;
        console.info(`${TAG}: avSession create success`);
      }).catch((err) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session!.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session!.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await Utils.msSleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session!.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller!.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100
     * @tc.desc   test offCustomDataChange of controller with no input param
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100]';
      let flag:number = 0;
      let callback1 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 1
      }
      let callback2 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 10
      }
      controller!.onCustomDataChange(callback1);
      controller!.onCustomDataChange(callback2);
      controller!.offCustomDataChange();
      await Utils.msSleep(100);
      session!.sendCustomData(customData);
      await Utils.msSleep(300);
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200
     * @tc.desc   test offCustomDataChange of controller with specified callback function
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200]';
      let flag:number = 0;
      let callback1 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 1
      }
      let callback2 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 10
      }
      controller!.onCustomDataChange(callback1);
      controller!.onCustomDataChange(callback2);
      controller!.offCustomDataChange(callback2);
      await Utils.msSleep(100);
      session!.sendCustomData(customData);
      await Utils.msSleep(300);
      expect(flag).assertEqual(1);
      done();
    })



  })
}
