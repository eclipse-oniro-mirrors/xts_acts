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
import featureAbility from '@ohos.ability.featureAbility';
import { AVCastPickerState } from '@ohos.multimedia.avCastPickerParam';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('AVCastPickerHelperTest', () => {
    let TAG: string = "[AVCastPickerHelperTest]";

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0100
     * @tc.name      : ON_HANGUP_0100
     * @tc.desc      : Testing on('hangUp')
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0100', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'video',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0100
     * @tc.name      : ON_HANGUP_0100
     * @tc.desc      : Testing on('hangUp')
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0100', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'video',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      avCastPicker.on('pickerStateChange',(state: AVCastPickerState) => {
        console.info(`${TAG}: pickerStateChange received picker state change: ${state}`);
        if (state == AVCastPickerState.STATE_APPEARING || state == AVCastPickerState.STATE_DISAPPEARING) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        done();
      });
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0200
     * @tc.name      : ON_HANGUP_0100
     * @tc.desc      : Testing on('hangUp')
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0200', 2, async (done: Function) => {
      let flag: boolean = false;
      try {
        let avCastPickerOptions : avSession.AVCastPickerOptions = {
          sessionType: 'video',
        }
        let avCastPicker = new avSession.AVCastPickerHelper(context);
        avCastPicker.on('pickerStateChange',(state: AVCastPickerState) => {
          console.info(`${TAG}: pickerStateChange received picker state change: ${state}`);
          if (state == AVCastPickerState.STATE_APPEARING || state == AVCastPickerState.STATE_DISAPPEARING) {
            flag = true;
          } else {
            expect(false).assertTrue();
          }
        });
        await avCastPicker.off('pickerStateChange');
        await avCastPicker.select(avCastPickerOptions);
        if (flag) {
          console.info(`${TAG}: pickerStateChange off pickerStateChange fail`);
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0200
     * @tc.name      : ON_HANGUP_0100
     * @tc.desc      : Testing on('hangUp')
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0200', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'video',
      }
      let context_1: common.UIAbilityContext;
      context_1 = AppStorage.get<common.UIAbilityContext>('Context') as common.UIAbilityContext;
      try {
        let avCastPicker = new avSession.AVCastPickerHelper(context_1);
        await avCastPicker.select(avCastPickerOptions).then(() => {
          console.info('${TAG}: avCastPicker select successfully');
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual(401);
        })
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0300
     * @tc.name      : sessionType: 'audio'
     * @tc.desc      : sessionType: 'audio'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0300', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'audio',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0400
     * @tc.name      : sessionType: 'voice_call'
     * @tc.desc      : sessionType: 'voice_call'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0400', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'voice_call',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0500
     * @tc.name      : sessionType: 'vioce_call'
     * @tc.desc      : sessionType: 'vioce_call'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0500', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'video_call',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0600
     * @tc.name      : sessionType: 'vioce_call'
     * @tc.desc      : sessionType: 'vioce_call'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0600', 2, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {}
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select(avCastPickerOptions).then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual(401);
      })
      done();
    })

    /* *
     * @tc.number    : SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0700
     * @tc.name      : select()
     * @tc.desc      : select()
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0700', 2, async (done: Function) => {
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select().then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })


  })
}