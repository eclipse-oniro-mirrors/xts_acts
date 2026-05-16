/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';
import { ColorMetrics } from '@kit.ArkUI';
import { StartOptions } from '@kit.AbilityKit';
import type Want from '@ohos.app.ability.Want';
import { image } from '@kit.ImageKit';


let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  let want: Want = {
    bundleName: 'com.example.myapplication',
    abilityName: 'StartAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.error(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.error(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.error(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.error(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  AppStorage.setOrCreate('startNum', startNum + 1)
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}
async function terminateAbility(msgStr: string) {
  let pageContext = AppStorage.get('contextStart') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${msgStr} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${msgStr} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(900);
}

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest3') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility3(caseName: string) {
  let pageContext = AppStorage.get('contextTest3') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowControlsTest() {
  describe('windowControlsTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_Null_401
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0100
     * @tc.desc   testSetStartWindowBackgroundColor_Null_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColor_Null_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_Null_401 ';
      console.log(caseName + 'begin');
      try {
        window.setStartWindowBackgroundColor(null, null, null).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(401)
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_Undefined_401
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0200
     * @tc.desc   testSetStartWindowBackgroundColor_Undefined_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColor_Undefined_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_Undefined_401 ';
      console.log(caseName + 'begin');
      try {
        window.setStartWindowBackgroundColor(undefined, undefined, undefined).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(401)
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_1300003
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0300
     * @tc.desc   testSetStartWindowBackgroundColor_1300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColor_1300003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_1300003 ';
      console.log(caseName + 'begin');
      try {
        window.setStartWindowBackgroundColor('moduleName', 'abilityName', ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          if (err.code === 801) {
            done();
          } else {
            expect(err.code).assertEqual(1300003)
            done();
          }

        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_1300016
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0400
     * @tc.desc   testSetStartWindowBackgroundColor_1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColor_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_1300016 ';
      console.log(caseName + 'begin');
      try {
        let moduleName = 'entry_test'.repeat(21);
        console.info(`${caseName} moduleName length: ${moduleName.length}`);
        let abilityName = 'TestAbility';
        window.setStartWindowBackgroundColor(moduleName, abilityName, ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300016)
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_1300016_2
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0500
     * @tc.desc   testSetStartWindowBackgroundColor_1300016_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColor_1300016_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_1300016_2 ';
      console.log(caseName + 'begin');
      try {
        let moduleName = 'entry_test';
        let abilityName = 'TestAbility'.repeat(21);
        console.info(`${caseName} abilityName length: ${abilityName.length}`);
        window.setStartWindowBackgroundColor(moduleName, abilityName, ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300016)
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_Call_Unstart
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0600
     * @tc.desc   testSetStartWindowBackgroundColor_Call_Unstart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetStartWindowBackgroundColor_Call_Unstart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_Call_Unstart ';
      console.log(caseName + 'begin');
      try {
        let moduleName = 'entry_test';
        let abilityName = 'StartAbility';
        window.setStartWindowBackgroundColor(moduleName, abilityName, ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          if (err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSetStartWindowBackgroundColor_Succeed
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_0700
     * @tc.desc   testSetStartWindowBackgroundColor_Succeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetStartWindowBackgroundColor_Succeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetStartWindowBackgroundColor_Succeed ';
      console.log(caseName + 'begin');
      try {
        let moduleName = 'entry_test';
        let abilityName = 'StartTestAbility3';
        await startAbility3(caseName, context);
        window.setStartWindowBackgroundColor(moduleName, abilityName, ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          await terminateAbility3(caseName);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + JSON.stringify(err));
          await terminateAbility3(caseName);
          if (err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility3(caseName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   setImageForRecent_1300016
     * @tc.number SUB_BASIC_WMS_setImageForRecent_0200
     * @tc.desc   setImageForRecent_1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setImageForRecent_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'setImageForRecent_1300016';
      console.log( caseName +' begin');
      if (deviceInfo.deviceType == '2in1') {
        let color = new ArrayBuffer(512 * 512 * 4); // 创建一个ArrayBuffer对象，用于存储图像像素。该对象的大小为（height * width * 4）字节。
        let pixelMap: image.PixelMap;
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 0;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 255;
        }
        image.createPixelMap(color, {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }).then((data:image.PixelMap) => {
          pixelMap = data;
          console.info(caseName +` Succeeded in creating pixelMap`);
          try {
            let promise = windowStage.setImageForRecent(pixelMap, 17);
            promise.then(() => {
              console.info(caseName +` Succeeded in setting image for recent`);
              expect(false).assertTrue();
              done()
            }).catch((err: BusinessError) => {
              console.error(caseName +` Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done()
            });
          } catch (exception) {
            console.error(caseName +` Failed to set image for recent.`+exception.code+','+exception.message);
            expect(exception.code).assertEqual(1300016);
            expect(exception.message).assertEqual('Parameter validation error. Possible causes: 1.The value of the parameter is out of the allowed range;2.The length of the parameter exceeds the allowed length;3.The parameter format is incorrect.')
            done();

          }
        })
      } else {
        done();
      }
    })

    /**
     * @tc.name   setImageForRecent_1300002
     * @tc.number SUB_BASIC_WMS_setImageForRecent_0300
     * @tc.desc   setImageForRecent_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setImageForRecent_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'setImageForRecent_1300002';
      console.log( caseName +' begin');
      let color = new ArrayBuffer(512 * 512 * 4); // 创建一个ArrayBuffer对象，用于存储图像像素。该对象的大小为（height * width * 4）字节。
      let pixelMap: image.PixelMap;
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 0;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 255;
      }
      let windowStart = await startAbility(caseName,context);
      await terminateAbility(caseName);
      image.createPixelMap(color, {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
      }).then((data:image.PixelMap) => {
        pixelMap = data;
        console.info(caseName +` Succeeded in creating pixelMap`);
        try {
          let promise = windowStart.setImageForRecent(pixelMap, ImageFit.Fill);
          promise.then(() => {
            console.info(caseName +` Succeeded in setting image for recent`);
            expect(false).assertTrue();
            done()
          }).catch((err: BusinessError) => {
            console.error(caseName +` Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message).assertEqual('This window state is abnormal. Possible causes: The window is not created or destroyed.')
            done()
          });
        } catch (exception) {
          console.error(caseName +` Failed to set image for recent.`+exception.code+','+exception.message);
          expect(false).assertTrue();
          done()

        }
      })
    })
    /**
     * @tc.name   testsetImageForRecent
     * @tc.number SUB_BASIC_WMS_setImageForRecent_0400
     * @tc.desc   testsetImageForRecent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testsetImageForRecent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testsetImageForRecent';
      console.log( caseName +' begin');
      if (deviceInfo.deviceType == '2in1') {
        let color = new ArrayBuffer(512 * 512 * 4); // 创建一个ArrayBuffer对象，用于存储图像像素。该对象的大小为（height * width * 4）字节。
        let pixelMap: image.PixelMap;
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 0;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 255;
        }
        image.createPixelMap(color, {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
        }).then((data:image.PixelMap) => {
          pixelMap = data;
          console.info(caseName +` Succeeded in creating pixelMap`);
          try {
            let promise = windowStage.setImageForRecent(pixelMap, ImageFit.Fill);
            promise.then(() => {
              console.info(caseName +` Succeeded in setting image for recent`);
              done()
            }).catch((err: BusinessError) => {
              console.error(caseName +` Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          } catch (exception) {
            console.error(caseName +` Failed to set image for recent.`);
            expect(false).assertTrue();
            done()
          }
        })
      } else {
        console.info(caseName +` Unsupported devices.`);
        done();
      }

    })

    /**
     * @tc.name   removeImageForRecent_1300002
     * @tc.number SUB_BASIC_WMS_removeImageForRecent_0200
     * @tc.desc   removeImageForRecent_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeImageForRecent_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'removeImageForRecent_1300002';
      console.log( caseName +' begin');
      let windowStart = await startAbility(caseName,context);
      await terminateAbility(caseName);
      try {
        let promise = windowStart.removeImageForRecent();
        promise.then(() => {
          console.info(caseName +` Succeeded in setting image for recent`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(caseName +` Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message).assertEqual('This window state is abnormal. Possible causes: The window is not created or destroyed.')
          done()
        });
      } catch (exception) {
        console.error(caseName +` Failed to remove image for recent.`+exception.code+','+exception.message);
        expect(false).assertTrue();
        done()

      }
    })
    /**
     * @tc.name   testremoveImageForRecent
     * @tc.number SUB_BASIC_WMS_removeImageForRecent_0300
     * @tc.desc   testremoveImageForRecent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testremoveImageForRecent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testremoveImageForRecent';
      console.log( caseName +' begin');
      if (deviceInfo.deviceType == '2in1') {
        try {
          let promise = windowStage.removeImageForRecent();
          promise.then(() => {
            console.info(caseName +` Succeeded in setting image for recent`);
            done()
          }).catch((err: BusinessError) => {
            console.error(caseName +` Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(caseName +` Failed to remove image for recent.`);
          expect(false).assertTrue();
          done()
        }
      } else {
        console.info(caseName +` Unsupported devices.`);
        done();
      }

    })

    /**
     * @tc.name   testsetImageForRecent_801_0100
     * @tc.number SUB_BASIC_WMS_setImageForRecent_0500
     * @tc.desc   testsetImageForRecent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetImageForRecent_801_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testsetImageForRecent_801_0100';
      console.log( caseName +' begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let color = new ArrayBuffer(512 * 512 * 4); // 创建一个ArrayBuffer对象，用于存储图像像素。该对象的大小为（height * width * 4）字节。
      let pixelMap: image.PixelMap;
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 0;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 255;
      }
      image.createPixelMap(color, {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
      }).then((data:image.PixelMap) => {
        pixelMap = data;
        console.info(caseName +` Succeeded in creating pixelMap`);
        try {
          let promise = windowStage.setImageForRecent(pixelMap, ImageFit.Fill);
          promise.then(() => {
            console.info(caseName +` Succeeded in setting image for recent`);
            if (deviceInfo.deviceType === '2in1') {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          }).catch((err: BusinessError) => {
            console.error(caseName +` Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
            if (!canIUseRes) {
              if (err.code === 801) {
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            } else {
              if (deviceInfo.deviceType !== '2in1') {
                if (err.code === 201) {
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                expect(false).assertTrue();
                done();
              }

            }
          });
        } catch (exception) {
          console.error(caseName +` Failed to set image for recent.`);
          expect(false).assertTrue();
          done()
        }
      })
    })

    /**
     * @tc.name   testremoveImageForRecent_801_0100
     * @tc.number SUB_BASIC_WMS_removeImageForRecent_0400
     * @tc.desc   testremoveImageForRecent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testremoveImageForRecent_801_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'testremoveImageForRecent_801_0100';
      console.log( caseName +' begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let promise = windowStage.removeImageForRecent();
        promise.then(() => {
          console.info(caseName +` Succeeded in setting image for recent`);
          if (deviceInfo.deviceType === '2in1') {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
          done()
        }).catch((err: BusinessError) => {
          console.error(caseName +` Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
          if (!canIUseRes) {
            if (err.code === 801) {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          } else {
            if (deviceInfo.deviceType !== '2in1') {
              if (err.code === 201) {
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            } else {
              expect(false).assertTrue();
              done();
            }
          }
        });
      } catch (exception) {
        console.error(caseName +` Failed to remove image for recent.`);
        expect(false).assertTrue();
        done()
      }
    })

  })
}