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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Key, KeyEvent } from '@kit.InputKit';
import { AVCastPickerState, AVCastPickerStyle } from '@ohos.multimedia.avCastPickerParam';


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let context: common.UIAbilityContext;


export default function abilityTest() {
  describe('AVSessionAVCast', () => {
    let TAG: string = "[AVSessionAVCast]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVCastXTS';
    let customdata: Record<string,string> = {'customData': 'appdata'}
    
     beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'video').then((data) => {
        session = data;
        session.sessionType = 'video';
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
      console.info(`${TAG}: afterEach in`);
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
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0100
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0100
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'video',
      }
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      avCastPicker.on('pickerStateChange',(state: AVCastPickerState) => {
        console.info(`${TAG}: pickerStateChange received picker state change: ${state}`);
        if (state == AVCastPickerState.STATE_APPEARING || state == AVCastPickerState.STATE_DISAPPEARING) {
          console.info('${TAG}: AVCastPickerState: ${state}');
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0200
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0200
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0300
     * @tc.desc   sessionType: 'audio'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0400
     * @tc.desc   sessionType: 'voice_call'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0500
     * @tc.desc   sessionType: 'vioce_call'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0600
     * @tc.desc   sessionType: 'vioce_call'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0700
     * @tc.desc   select()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.select().then(() => {
        console.info('${TAG}: avCastPicker select successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0800
     * @tc.desc   resetCommunicationDevice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCastPicker = new avSession.AVCastPickerHelper(context);
      await avCastPicker.resetCommunicationDevice().then(() => {
        console.info('${TAG}: avCastPicker resetCommunicationDevice successfully');
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: avCastPicker resetCommunicationDevice failed with err: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0900
     * @tc.desc   test interface select(option) with menuPosition involved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let menuPosition:avSession.MenuPosition = {
        x:200,
        y:600,
        width:40,
        height:40
      }
      let avCastPickerOptions : avSession.AVCastPickerOptions = {
        sessionType: 'voice_call',
        pickerStyle: AVCastPickerStyle.STYLE_MENU,
        menuPosition: menuPosition
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('avsession sendCustomData Start');
      await session.sendCustomData(customdata).then(() => {
        console.info('avsession sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`avsession sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('controller sendCustomData Start');
      await controller.sendCustomData(customdata).then(() => {
        console.info('controller sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await session.sendCustomData(customdata);
      } catch(err) {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata1: string = 'appdata'
      console.info('session sendCustomData Start');
      await session.sendCustomData(customdata1).then(() => {
        console.info('session sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.sendCustomData(customdata);
      } catch(err) {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata2: Record<string,string>  = {'appdata' : 'aaa'}
      console.info('session sendCustomData Start');
      await session.sendCustomData(customdata2).then(() => {
        console.info('session sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`session sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let customdata2: Record<string,string>  = {'appdata' : 'aaa'}
      console.info('controller sendCustomData Start');
      await controller.sendCustomData(customdata2).then(() => {
        console.info('controller sendCustomData Successfully');
      }).catch((err: BusinessError) => {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCUSTOMDATA_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await controller.sendCustomData(customdata);
      } catch(err) {
        console.info(`controller sendCustomData BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100
     * @tc.desc   test session.on('customDataChange') callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0100]';
      let flag = false;
      await session.on('customDataChange',(data: Record<string,string>) => {
        console.info(`${TAG}TestLog: session on_customDataChange callback succeed ${data}`)
        flag = true;
      })
      console.info(`${TAG}TestLog: session on_customDataChange registration succeed`)
      await controller.sendCustomData(customdata);
      await sleep(300);
      expect(flag).assertTrue();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0200]';
      await session.destroy();
      try{
        await session.on('customDataChange',(data: Record<string,string>) => {
          console.info(`${TAG}TestLog: on_customDataChange callback succeed ${data}`);
        });
      } catch(err) {
        console.info(`${TAG}TestLog: session on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300
     * @tc.desc   test controller.on('customDataChange') callback registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0300]';
      let flag = false;
      await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`session on_customDataChange callback succeed ${data}`)
        flag = true;
      })    
      await session.sendCustomData(customdata);
      await sleep(300);
      expect(flag).assertTrue();
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CUSTOMDATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`on_customDataChange Successfully ${data}`);
        });
      } catch(err) {
        console.info(`controller on_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })    


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.on('customDataChange',(data: Record<string,string>) => {
        console.info(`session on_customDataChange Successfully ${data}`);
        expect(false).assertTrue();
        done();
      })
      await session.off('customDataChange');
      console.info('session off_customDataChange end')    
      await session.sendCustomData(customdata);
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await session.off('customDataChange');
      } catch(err) {
        console.info(`session off_customDataChangeBusinessError: code: ${err.code}, message: ${err.message}`);    
        expect(err.code).assertEqual(6600101);
      };
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.on('customDataChange',(data: Record<string,string>) => {
        console.info(`controller on_customDataChange Successfully ${data}`);
        expect(false).assertTrue();
        done();
      })
      await controller.off('customDataChange');
      console.info('controller off_customDataChange end')    
      await controller.sendCustomData(customdata);
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.off('customDataChange');
      } catch(err) {
        console.info(`controller off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      };
      await sleep(300);
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CUSTOMDATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try{
        await session.off('customDataChange');
      } catch(err) {
        console.info(`session off_customDataChange BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      };
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_5600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_5600
     * @tc.desc   Testing call stopCasting(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            await session.stopCasting((err:BusinessError) => {
              if (err) {
                  console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
              } else {
                  console.info(`stopCasting successfully`);
              };
          });
        } catch (error) {
            console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            expect(error.message).assertEqual("Cannot read property catch of undefined");
        }
        done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_5700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_5700
     * @tc.desc   Testing call stopCasting(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            await session.stopCasting().then(() => {
              console.info('stopCasting successfully');
            }).catch((err: BusinessError) => {
              console.error(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
            });
        } catch (error) {
            console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            expect(error.message).assertEqual("Cannot read property catch of undefined");
        }
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_5800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_5800
     * @tc.desc   Testing call getavcastcontroller(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            if (controller != null) {
              await controller.destroy()
            }
            let aVCastController: avSession.AVCastController;
            await session.getAVCastController().then((avcontroller: avSession.AVCastController) => {
                aVCastController = avcontroller;
                console.info(`getAVCastController : SUCCESS : sessionid `);
            }).catch((err: BusinessError) => {
                console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
            });
        } catch (error) {
            console.info(`getAVCastController failed: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            expect(error.message).assertEqual("Cannot read property catch of undefined");
        }
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_5900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_5900
     * @tc.desc   Testing call getavcastcontroller(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
            if (controller != null) {
              await controller.destroy()
            }
            let aVCastController: avSession.AVCastController;
            await session.getAVCastController((err: BusinessError, avcontroller: avSession.AVCastController) => {
              if (err) {
                console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
              } else {
                aVCastController = avcontroller;
                console.info('getAVCastController : SUCCESS');
              }
            });
        } catch (error) {
            console.error(`getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(6600109);
            expect(error.message).assertEqual("Cannot read property catch of undefined");
        }
        done();
    })



  })
}

