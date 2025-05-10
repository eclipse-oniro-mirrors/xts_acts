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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import avSession from '@ohos.multimedia.avsession';
import { BusinessError } from '@ohos.base';


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}


export default function abilityTest() {
  describe('AVSessionDistributedtest', () => {
    let TAG: string = "[AVSessionDistributedtest]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController;

    beforeAll(async () => {
      console.info(`${TAG}: beforeAll in`)
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      let tag = "createNewSession"
      let context: Context = getContext()
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`)
      if (session != null) {
        await session.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`)
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`)
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100
     * @tc.name      : GETEXTRASWITHEVENT__0100
     * @tc.desc      : Testing getExtrasWithEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100', 2, async (done: Function) => {
        console.info(`${TAG}: before SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100 ${controller}`);
        const COMMON_COMMAND_STRING = undefined;
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
            expect(false).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(err.code).assertEqual(401);
        })
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200
     * @tc.name      : GETEXTRASWITHEVENT__0200
     * @tc.desc      : Testing getExtrasWithEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200', 2, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_XXX";
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
        }).catch((err: BusinessError) => {
            if (err.message == 'expect true, actualValue is false' || err.code == 6600105){
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(true).assertTrue();
            } else {
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }           
        })
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300
     * @tc.name      : GETEXTRASWITHEVENT__0300
     * @tc.desc      : Testing getExtrasWithEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300', 2, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_VOLUME";
        let extras: avSession.ExtraInfo = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
        console.info(`${TAG}: aduio get volume with ${JSON.stringify(extras)}`);
        if (JSON.stringify(extras) == '{}' || 0 <= extras[COMMON_COMMAND_STRING] && extras[COMMON_COMMAND_STRING] <= 15){
          console.info(`${TAG}: aduio get volume with ${extras[COMMON_COMMAND_STRING]}`);
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }           
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400
     * @tc.name      : GETEXTRASWITHEVENT__0400
     * @tc.desc      : Testing getExtrasWithEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400', 2, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_AVAILABLE_DEVICES";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_AVAILABLE_DEVICES ${extras[COMMON_COMMAND_STRING]}`);
            expect(true).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500
     * @tc.name      : GETEXTRASWITHEVENT__0500
     * @tc.desc      : Testing getExtrasWithEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500', 2, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO ${extras[COMMON_COMMAND_STRING]}`);
            expect(true).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })
  })
}